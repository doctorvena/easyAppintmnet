USE [eaSalonMenagment]

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
    (1, 'Awesome Salon', '123 Main St, New York, NY', 10 , 2, 1, 4.5), -- Business Owner 1's Salon
    (2, 'Beautiful Salon', '456 High St, London', 20 , 3, 2, 5),     -- Business Owner 2's Salon
    (3, 'Glamour Salon', '789 Park Ave, Paris', 15 , 4, 3, 3.5);       -- Business Owner 3's Salon
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
    (12, 4.0, GETDATE(), 19, 3);

SET IDENTITY_INSERT [dbo].[SalonRating] OFF;