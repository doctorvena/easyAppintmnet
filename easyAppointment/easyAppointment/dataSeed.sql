USE [easyAppointmnetDB]

SET IDENTITY_INSERT [dbo].[City] ON;

INSERT INTO [dbo].[City] (CityId, CityName, Country)
VALUES
    (1, 'New York', 'USA'),
    (2, 'London', 'UK'),
    (3, 'Paris', 'France'),
    (4, 'Los Angeles', 'USA'),
    (5, 'Tokyo', 'Japan');
SET IDENTITY_INSERT [dbo].[City] OFF;

SET IDENTITY_INSERT [dbo].[Sex] ON;

INSERT INTO [dbo].[Sex] (SexId, SexName)
VALUES
    (1, 'Male'),
    (2, 'Female');

SET IDENTITY_INSERT [dbo].[Sex] OFF;

SET IDENTITY_INSERT [dbo].[Roles] ON;

INSERT INTO [dbo].[Roles] (RoleId, RoleName, Description)
VALUES
    (1, 'Admin', 'Administrator'),
    (2, 'BusinessOwner', 'Business Owner'),
    (3, 'Customer', 'Customer'),
    (4, 'Employee', 'Employee');

SET IDENTITY_INSERT [dbo].[Roles] OFF;

SET IDENTITY_INSERT [dbo].[Users] ON;

INSERT INTO [dbo].[Users] (UserId, FirstName, LastName, Email, Phone, Status, SexId, Username, PasswordHash, PasswordSalt)
VALUES
    (1, 'Admin', 'User', 'admin@example.com', '000000000', 'active', 1, 'admin', 'mbFWDfYRoEXDnS/PVVQrvg4NbPY=', 'LpHyBtjDewnQnox7mc+CIQ=='),
    (2, 'John', 'Owner', 'johndoe@example.com', '123456789', 'active', 1, 'JohnDoeBusinessOwner', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (3, 'Alice', 'Owner', 'alicesmith@example.com', '987654321', 'active', 2, 'AliceSmithBusinessOwner', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (4, 'Bob', 'Owner', 'bobjohnson@example.com', '555555555', 'active', 1, 'BobJohnsonBusinessOwner', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (5, 'Customer', 'Test', 'customer@example.com', '111111111', 'active', 2, 'customer', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (6, 'Leila', 'Employee', 'leila@example.com', '999999999', 'active', 2, 'LeilaEmployee', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (7, 'James', 'Employee', 'james@example.com', '888888888', 'active', 1, 'JamesEmployee', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (8, 'Sophia', 'Employee', 'sophia@example.com', '777777777', 'active', 2, 'SophiaEmployee', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (9, 'Oliver', 'Employee', 'oliver@example.com', '666666666', 'active', 1, 'OliverEmployee', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (10, 'Emma', 'Employee', 'emma@example.com', '555555555', 'active', 2, 'EmmaEmployee', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (11, 'Noah', 'Employee', 'noah@example.com', '444444444', 'active', 1, 'NoahEmployee', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (12, 'Ava', 'Employee', 'ava@example.com', '333333333', 'active', 2, 'AvaEmployee', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (13, 'William', 'Employee', 'william@example.com', '222222222', 'active', 1, 'WilliamEmployee', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (14, 'Mia', 'Employee', 'mia@example.com', '111111111', 'active', 2, 'MiaEmployee', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (15, 'Elijah', 'Employee', 'elijah@example.com', '1010101010', 'active', 1, 'ElijahEmployee', '4CnCDUR2Yu71jl/+rKeCDUSx2lY=', 'APr/1L6SP9FyDATeYb+0aQ==');
SET IDENTITY_INSERT [dbo].[Users] OFF;

SET IDENTITY_INSERT [dbo].[UserRoles] ON;

INSERT INTO [dbo].[UserRoles] (UserRoleId, UserId, RoleId, ModificationDate)
VALUES
    (1, 1, 1, GETDATE()),
    (2, 2, 2, GETDATE()),
    (3, 3, 2, GETDATE()),
    (4, 4, 2, GETDATE()),
    (5, 5, 3, GETDATE()),  -- Admin becomes a customer
    (6, 6, 2, GETDATE()),  -- Business Owner 1
    (7, 7, 2, GETDATE()),  -- Business Owner 2
    (8, 8, 2, GETDATE()),  -- Business Owner 3
    (9, 9, 4, GETDATE()),  -- Unassigned Employee
    (10, 10, 4, GETDATE()), -- Unassigned Employee
    (11, 11, 4, GETDATE()), -- Unassigned Employee
    (12, 12, 4, GETDATE()), -- Unassigned Employee
    (13, 13, 4, GETDATE()), -- Unassigned Employee
    (14, 14, 4, GETDATE()), -- Unassigned Employee
    (15, 15, 4, GETDATE()), -- Unassigned Employee
    (16, 2, 4, GETDATE()),  -- Employee of Business Owner 1
    (17, 2, 4, GETDATE()),  -- Employee of Business Owner 1
    (18, 3, 4, GETDATE()),  -- Employee of Business Owner 2
    (19, 3, 4, GETDATE()),  -- Employee of Business Owner 2
    (20, 4, 4, GETDATE()),  -- Employee of Business Owner 3
    (21, 4, 4, GETDATE());  -- Employee of Business Owner 3
SET IDENTITY_INSERT [dbo].[UserRoles] OFF;

SET IDENTITY_INSERT [dbo].[Salon] ON;

INSERT INTO [dbo].[Salon] (SalonId, SalonName, Address, OwnerUserId, CityId)
VALUES
    (1, 'Awesome Salon', '123 Main St, New York, NY', 6, 1), -- Business Owner 1's Salon
    (2, 'Beautiful Salon', '456 High St, London', 7, 2),     -- Business Owner 2's Salon
    (3, 'Glamour Salon', '789 Park Ave, Paris', 8, 3);        -- Business Owner 3's Salon
SET IDENTITY_INSERT [dbo].[Salon] OFF;

SET IDENTITY_INSERT [dbo].[SalonEmployees] ON;

INSERT INTO [dbo].[SalonEmployees] (SalonEmployeeId, SalonId, EmployeeUserId)
VALUES
    (1, 1, 6),   -- Employee 1 of Business Owner 1
    (2, 1, 7),   -- Employee 2 of Business Owner 1
    (3, 2, 8),   -- Employee 1 of Business Owner 2
    (4, 2, 9),   -- Employee 2 of Business Owner 2
    (5, 3, 10),  -- Employee 1 of Business Owner 3
    (6, 3, 11);  -- Employee 2 of Business Owner 3

SET IDENTITY_INSERT [dbo].[SalonEmployees] OFF;


SET IDENTITY_INSERT [dbo].[Services] ON;

INSERT INTO [dbo].[Services] (ServiceId, ServiceName, Description, Price, SalonId)
VALUES
    (1, 'Haircut', 'A nice haircut', 20.0, 1),
    (2, 'Manicure', 'Beautiful manicure', 30.0, 2);

SET IDENTITY_INSERT [dbo].[Services] OFF;

INSERT INTO [dbo].[TimeSlots] (StartTime, EndTime, SalonId, EmployeeId, SlotDate, Duration, BusinessUserId)
VALUES
    ('2023-07-01 09:00:00', '2023-07-01 10:00:00', 1, 1, '2023-07-01', 60, 1),
    ('2023-07-01 10:00:00', '2023-07-01 11:00:00', 2, 2, '2023-07-01', 60, 2);
