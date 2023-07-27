USE [easyAppointmnetDB]

SET IDENTITY_INSERT [dbo].[City] ON;

INSERT INTO [dbo].[City] (CityId, CityName, Country)
VALUES
    (1, 'New York', 'USA'),
    (2, 'London', 'UK');

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
    (2, 'BussinesOwner', 'Business Owner'),
    (3, 'Customer', 'Customer'),
    (4, 'Employee', 'Employee');

SET IDENTITY_INSERT [dbo].[Roles] OFF;

SET IDENTITY_INSERT [dbo].[Users] ON;

INSERT INTO [dbo].[Users] (UserId, FirstName, LastName, Email, Phone, Status, SexId, Username, PasswordHash, PasswordSalt)
VALUES
    (1, 'admin', 'admin', 'admin', 'admin', 'admin', 1, 'admin', 'mbFWDfYRoEXDnS/PVVQrvg4NbPY=', 'LpHyBtjDewnQnox7mc+CIQ=='),
    (2, 'John', 'Doe', 'johndoe@example.com', '123456789', 'active', 1, 'johndoe', 'la6h1jNdvHBTrVXk9fkSvoVJE0o=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (3, 'Jane', 'Smith', 'janesmith@example.com', '987654321', 'active', 2, 'janesmith', 'la6h1jNdvHBTrVXk9fkSvoVJE0o=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (4, 'Michael', 'Johnson', 'michaeljohnson@example.com', '555555555', 'active', 1, 'michaeljohnson', 'la6h1jNdvHBTrVXk9fkSvoVJE0o=', 'APr/1L6SP9FyDATeYb+0aQ=='),
    (5, 'Customer', 'Test', 'customer@example.com', '111111111', 'active', 2, 'customer', 'la6h1jNdvHBTrVXk9fkSvoVJE0o=', 'APr/1L6SP9FyDATeYb+0aQ==');

SET IDENTITY_INSERT [dbo].[Users] OFF;

SET IDENTITY_INSERT [dbo].[UserRoles] ON;

INSERT INTO [dbo].[UserRoles] (UserRoleId, UserId, RoleId, ModificationDate)
VALUES
    (1, 1, 1, GETDATE()),
    (2, 2, 2, GETDATE()),
    (3, 3, 2, GETDATE()),
    (4, 4, 4, GETDATE()),
    (5, 5, 4, GETDATE());

SET IDENTITY_INSERT [dbo].[UserRoles] OFF;

SET IDENTITY_INSERT [dbo].[Salon] ON;

INSERT INTO [dbo].[Salon] (SalonId, SalonName, Address, OwnerUserId, CityId)
VALUES
    (1, 'Awesome Salon', '123 Main St, New York, NY', 1, 1),
    (2, 'Beautiful Salon', '456 High St, London', 2, 2);

SET IDENTITY_INSERT [dbo].[Salon] OFF;

SET IDENTITY_INSERT [dbo].[SalonEmployees] ON;

INSERT INTO [dbo].[SalonEmployees] (SalonEmployeeId, SalonId, EmployeeUserId)
VALUES
    (1, 2, 4),
    (2, 2, 5);

SET IDENTITY_INSERT [dbo].[SalonEmployees] OFF;

SET IDENTITY_INSERT [dbo].[Services] ON;

INSERT INTO [dbo].[Services] (ServiceId, ServiceName, Description, Price, SalonId)
VALUES
    (1, 'Haircut', 'A nice haircut', 20.0, 1),
    (2, 'Manicure', 'Beautiful manicure', 30.0, 2);

SET IDENTITY_INSERT [dbo].[Services] OFF;

INSERT INTO [dbo].[TimeSlots] (StartTime, EndTime, ServiceId, EmployeeId, SlotDate, Duration, BusinessId)
VALUES
    ('2023-07-01 09:00:00', '2023-07-01 10:00:00', 1, 1, '2023-07-01', 60, 1),
    ('2023-07-01 10:00:00', '2023-07-01 11:00:00', 2, 2, '2023-07-01', 60, 2);
