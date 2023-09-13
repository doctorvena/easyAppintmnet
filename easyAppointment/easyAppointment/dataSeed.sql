USE [easyAppointmentDB]

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
    (2, 'John', 'Owner', 'johndoe@example.com', '123456789', 'active', 1, 'JohnDoeBO', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (3, 'Alice', 'Owner', 'alicesmith@example.com', '987654321', 'active', 2, 'AliceSmithBO', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (4, 'Bob', 'Owner', 'bobjohnson@example.com', '555555555', 'active', 1, 'BobJohnsonBO', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (5, 'Customer', 'Test', 'customer@example.com', '111111111', 'active', 2, 'customer', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (6, 'Leila', 'Employee', 'leila@example.com', '999999999', 'active', 2, 'LeilaEmployee', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (7, 'James', 'Employee', 'james@example.com', '888888888', 'active', 1, 'JamesEmployee', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (8, 'Sophia', 'Employee', 'sophia@example.com', '777777777', 'active', 2, 'SophiaEmployee', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (9, 'Oliver', 'Employee', 'oliver@example.com', '666666666', 'active', 1, 'OliverEmployee', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (10, 'Emma', 'Employee', 'emma@example.com', '555555555', 'active', 2, 'EmmaEmployee', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (11, 'Noah', 'Employee', 'noah@example.com', '444444444', 'active', 1, 'NoahEmployee', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (12, 'Ava', 'Employee', 'ava@example.com', '333333333', 'active', 2, 'AvaEmployee', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (13, 'William', 'Employee', 'william@example.com', '222222222', 'active', 1, 'WilliamEmployee', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),    
    (14, 'Mia', 'Employee', 'mia@example.com', '111111111', 'active', 2, 'MiaEmployee', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (15, 'Elijah', 'Employee', 'elijah@example.com', '1010101010', 'active', 1, 'ElijahEmployee', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (16, 'Anna', 'Customer', 'anna.customer@example.com', '123412341', 'active', 2, 'AnnaC', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (17, 'Brian', 'Customer', 'brian.customer@example.com', '234523452', 'active', 1, 'BrianC', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (18, 'Clara', 'Customer', 'clara.customer@example.com', '345634563', 'active', 2, 'ClaraC', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (19, 'David', 'Customer', 'david.customer@example.com', '456745674', 'active', 1, 'DavidC', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (20, 'Elena', 'Owner', 'elena@example.com', '121212121', 'active', 2, 'ElenaBO', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA=='),
    (21, 'Frank', 'Owner', 'frank@example.com', '131313131', 'active', 1, 'FrankBO', '4A0hSwTHqNQ+UlLcwZocUjrjh4Y=', 'KhpdbY7uYWyLbhC4Iio2AA==');

SET IDENTITY_INSERT [dbo].[Users] OFF;

SET IDENTITY_INSERT [dbo].[UserRoles] ON;

INSERT INTO [dbo].[UserRoles] (UserRoleId, UserId, RoleId, ModificationDate)
VALUES
    (1, 1, 1, GETDATE()),
    (2, 2, 2, GETDATE()),
    (3, 3, 2, GETDATE()),
    (4, 4, 2, GETDATE()),
    (5, 5, 3, GETDATE()),  -- Admin becomes a customer
    (6, 6, 4, GETDATE()),  -- Business Owner 1
    (7, 7, 4, GETDATE()),  -- Business Owner 2
    (8, 8, 4, GETDATE()),  -- Business Owner 3
    (9, 9, 4, GETDATE()),  -- Unassigned Employee
    (11, 11, 4, GETDATE()), 
    (13, 13, 4, GETDATE()), 
    (10, 10, 4, GETDATE()), 
    (12, 12, 4, GETDATE()), 
    (14, 14, 4, GETDATE()), 
    (15, 15, 4, GETDATE()), 
    (16, 2, 4, GETDATE()),  
    (17, 2, 4, GETDATE()),  
    (18, 3, 4, GETDATE()),  
    (19, 3, 4, GETDATE()),  
    (20, 4, 4, GETDATE()),  
    (21, 4, 4, GETDATE()),  
    (22, 16, 3, GETDATE()),
    (23, 17, 3, GETDATE()),
    (24, 18, 3, GETDATE()),
    (25, 19, 3, GETDATE()),
    (26, 20, 2, GETDATE()),  
    (27, 21, 2, GETDATE()); 

SET IDENTITY_INSERT [dbo].[UserRoles] OFF;

SET IDENTITY_INSERT [dbo].[City] ON;

INSERT INTO [dbo].[City] (CityId, CityName, Country)
VALUES
    (1, 'New York', 'USA'),
    (2, 'London', 'UK'),
    (3, 'Paris', 'France'),
    (4, 'Los Angeles', 'USA'),
    (5, 'Tokyo', 'Japan');
SET IDENTITY_INSERT [dbo].[City] OFF;

SET IDENTITY_INSERT [dbo].[Salon] ON;

INSERT INTO [dbo].[Salon] (SalonId, SalonName, Address, ReservationPrice, OwnerUserId, CityId, Rating)
VALUES
    (1, 'Awesome Salon', '123 Main St, New York, NY', 10 , 2, 1,4.5), 
    (2, 'Beautiful Salon', '456 High St, London', 20 , 3, 2,4.4),  
    (3, 'Glamour Salon', '789 Park Ave, Paris', 15 , 4, 3,3.8),      
    (4, 'Majestic Salon', '321 Beach St, Los Angeles, CA', 25, 20, 4,4.6),  
    (5, 'Elegant Salon', '123 Sakura St, Tokyo', 30, 21, 5,4.2);   

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

SET IDENTITY_INSERT [dbo].[SalonRating] ON;

INSERT INTO [dbo].[SalonRating] 
(SalonRatingId, Rating, RatingDate, UserId, SalonId)
VALUES
    (1, 4.5, GETDATE(), 16, 1), 
    (2, 5.0, GETDATE(), 16, 2), 
    (3, 4.0, GETDATE(), 16, 3),
    (4, 5.0, GETDATE(), 17, 1),
    (5, 3.5, GETDATE(), 17, 2),
    (6, 4.5, GETDATE(), 17, 3),
    (7, 4.0, GETDATE(), 18, 1),
    (8, 4.5, GETDATE(), 18, 2),
    (9, 3.0, GETDATE(), 18, 3),
    (10, 5.0, GETDATE(), 19, 1),
    (11, 5.0, GETDATE(), 19, 2),
    (12, 4.0, GETDATE(), 19, 3),
    (13, 4.7, GETDATE(), 16, 4),
    (14, 4.5, GETDATE(), 17, 4),
    (15, 4.8, GETDATE(), 18, 4),
    (16, 4.6, GETDATE(), 19, 4),
    (17, 4.7, GETDATE(), 15, 4),
    (18, 4.3, GETDATE(), 16, 5),
    (19, 4.0, GETDATE(), 17, 5),
    (20, 4.1, GETDATE(), 18, 5),
    (21, 4.4, GETDATE(), 19, 5),
    (22, 4.5, GETDATE(), 14, 5);

SET IDENTITY_INSERT [dbo].[SalonRating] OFF;

SET IDENTITY_INSERT [dbo].[TimeSlots] ON;

INSERT INTO [dbo].[TimeSlots] 
    (TimeSlotId, StartTime, EndTime, SalonId, SalonEmployeeId, SlotDate, Duration, OwnerUserId, Status)
VALUES
    (1, '2023-08-13 09:00', '2023-08-13 10:00', 1, 1, '2023-08-07', 60, 2, 'Taken'),
    (2, '2023-08-13 11:00', '2023-08-13 12:00', 1, 1, '2023-08-08', 60, 2, 'Taken'),
    (3, '2023-08-13 10:00', '2023-08-13 11:00', 2, 3, '2023-08-08', 60, 3, 'Taken'),
    (4, '2023-08-14 14:00', '2023-08-14 15:00', 2, 4, '2023-08-09', 60, 3, 'Taken'),
    (5, '2023-08-13 15:00', '2023-08-13 16:00', 3, 5, '2023-08-07', 60, 4, 'Taken'),
    (6, '2023-08-13 16:00', '2023-08-13 17:00', 3, 6, '2023-08-09', 60, 4, 'Taken'),
    (7, CONVERT(VARCHAR, DATEADD(DAY, 1, CONVERT(DATE, GETDATE())), 23) + 'T09:00:00', CONVERT(VARCHAR, DATEADD(DAY, 1, CONVERT(DATE, GETDATE())), 23) + 'T10:00:00', 1, 1, DATEADD(DAY, 1, CONVERT(DATE, GETDATE())), 60, 2, 'Available'),
    (8, CONVERT(VARCHAR, DATEADD(DAY, 1, CONVERT(DATE, GETDATE())), 23) + 'T11:00:00', CONVERT(VARCHAR, DATEADD(DAY, 1, CONVERT(DATE, GETDATE())), 23) + 'T12:00:00', 1, 1, DATEADD(DAY, 1, CONVERT(DATE, GETDATE())), 60, 2, 'Available'),
    (9, CONVERT(VARCHAR, DATEADD(DAY, 2, CONVERT(DATE, GETDATE())), 23) + 'T10:00:00', CONVERT(VARCHAR, DATEADD(DAY, 2, CONVERT(DATE, GETDATE())), 23) + 'T11:00:00', 2, 3, DATEADD(DAY, 2, CONVERT(DATE, GETDATE())), 60, 3, 'Available'),
    (10, CONVERT(VARCHAR, DATEADD(DAY, 2, CONVERT(DATE, GETDATE())), 23) + 'T14:00:00', CONVERT(VARCHAR, DATEADD(DAY, 2, CONVERT(DATE, GETDATE())), 23) + 'T15:00:00', 2, 4, DATEADD(DAY, 2, CONVERT(DATE, GETDATE())), 60, 3, 'Available'),
    (11, CONVERT(VARCHAR, DATEADD(DAY, 3, CONVERT(DATE, GETDATE())), 23) + 'T09:00:00', CONVERT(VARCHAR, DATEADD(DAY, 3, CONVERT(DATE, GETDATE())), 23) + 'T10:00:00', 3, 5, DATEADD(DAY, 3, CONVERT(DATE, GETDATE())), 60, 4, 'Available'),
    (12, CONVERT(VARCHAR, DATEADD(DAY, 3, CONVERT(DATE, GETDATE())), 23) + 'T16:00:00', CONVERT(VARCHAR, DATEADD(DAY, 3, CONVERT(DATE, GETDATE())), 23) + 'T17:00:00', 3, 6, DATEADD(DAY, 3, CONVERT(DATE, GETDATE())), 60, 4, 'Available');

SET IDENTITY_INSERT [dbo].[TimeSlots] OFF;

SET IDENTITY_INSERT [dbo].[Reservations] ON;

INSERT INTO [dbo].[Reservations]
    (ReservationId, SalonId, UserCustomerId, TimeSlotId, Status, ReservationDate, ReservationName,Rating,IsPaid,Price)
VALUES
    (1, 1, 16, 1, 'Completed', '2023-08-07', 'Anna' , 4, 0,10),
    (2, 1, 17, 2, 'Completed', '2023-08-08', 'Brian', 5, 0,10),
    (3, 2, 18, 3, 'Completed', '2023-08-08', 'Clara', 3, 0,20),
    (4, 2, 19, 4, 'Completed', '2023-08-09', 'David', 2, 0,20),
    (5, 3, 16, 5, 'Completed', '2023-08-07', 'Anna' , 5, 0,15),
    (6, 3, 17, 6, 'Completed', '2023-08-09', 'Brian', 4, 0,15);

SET IDENTITY_INSERT [dbo].[Reservations] OFF;