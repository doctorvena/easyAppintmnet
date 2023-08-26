﻿using AutoMapper;
using easyAppointment.Contributor.Database;
using easyAppointment.Contributor.Models;
using easyAppointment.Contributor.SearchObjects;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Net;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace easyAppointment.Contributor.Services
{
    public class UserService : BaseCRUDService<UserResponse, Database.User, UserSearchObject, UserInsertRequest, UserUpdateRequest>, IUserService
    {
        private readonly IConfiguration _configuration;

        public UserService(ILogger<BaseCRUDService<UserResponse, Database.User, UserSearchObject, UserInsertRequest, UserUpdateRequest>> logger, EasyAppointmnetUserDbContext context, IMapper mapper, IConfiguration configuration)
          : base(logger, context, mapper)
        {
            _configuration = configuration;
        }

            public static string GenerateSalt()
        {
            RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider();
            var byteArray = new byte[16];
            provider.GetBytes(byteArray);

            return Convert.ToBase64String(byteArray);
        }
        public static string GenerateHash(string salt, string password)
        {
            byte[] src = Convert.FromBase64String(salt);
            byte[] bytes = Encoding.Unicode.GetBytes(password);
            byte[] dst = new byte[src.Length + bytes.Length];

            System.Buffer.BlockCopy(src, 0, dst, 0, src.Length);
            System.Buffer.BlockCopy(bytes, 0, dst, src.Length, bytes.Length);

            HashAlgorithm algorithm = HashAlgorithm.Create("SHA1");
            byte[] inArray = algorithm.ComputeHash(dst);
            return Convert.ToBase64String(inArray);
        }

        public async Task<(UserResponse, string)> Login(string username, string password) // Return tuple containing UserResponse and JWT
        {
            try
            {
                var entity = await _context.Users
                .Include(u => u.UserRoles)
                    .ThenInclude(ur => ur.Role)
                .FirstOrDefaultAsync(x => x.Username == username);


                if (entity == null)
                {
                    throw new UserException("Wrong username or password");
                }
                var hash = GenerateHash(entity.PasswordSalt, password);

                if (hash != entity.PasswordHash)
                {
                    throw new UserException("Wrong username or password");
                }

                // Get the roles from the user entity
                var roles = entity.UserRoles.Select(ur => ur.Role.RoleName).ToList(); // Assuming RoleName is the name of the role in your model

                // Generate the JWT, including roles
                var token = CreateToken(username, roles);

                return (_mapper.Map<UserResponse>(entity), token); // Return the mapped user and the JWT
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public override IQueryable<Database.User> AddInclude(IQueryable<Database.User> query, UserSearchObject? search = null)
        {
            if (search?.AreRolesIncluded == true)
            {
                query = query.Include("UserRoles.Role");
            }
            return base.AddInclude(query, search);
        }

        public UserResponse Register(UserInsertRequest request)
        {
            var entity = _mapper.Map<Database.User>(request);

            if (request.Password != request.PasswordRepeat)
            {
                throw new UserException("Password and PasswordRepeat are not the same!");
            }

            var korisnici = _context.Users.ToList();
            foreach (var korisnik in korisnici)
            {
                if (korisnik.Username == request.Username)
                    throw new UserException("Username is taken!");
                if (korisnik.Email == request.Email)
                    throw new UserException("Email is taken!");
            }

            entity.PasswordSalt = GenerateSalt();
            entity.PasswordHash = GenerateHash(entity.PasswordSalt, request.Password);

            _context.Add(entity);
            _context.SaveChanges(); // Ensure that entity is saved and UserId is generated

            var userRoles = new UserRole
            {
                UserId = entity.UserId,
                RoleId = request.RoleId,
                ModificationDate = DateTime.Now
            };
            _context.UserRoles.AddRange(userRoles);
            _context.SaveChanges();

            return _mapper.Map<UserResponse>(entity);
        }

        private string CreateToken(string username, List<string> roles)
        {
            List<Claim> claims = new()
            {
                new Claim("username", Convert.ToString(username)),
            };

            // Add user roles to the claims
            foreach (var role in roles)
            {
                claims.Add(new Claim(ClaimTypes.Role, role));
            }

            var key = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(_configuration.GetSection("AppSettings:Token").Value));
            var cred = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);
            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.Now.AddHours(2),
                signingCredentials: cred
            );

            var jwt = new JwtSecurityTokenHandler().WriteToken(token);
            return jwt;
        }
    }
}
