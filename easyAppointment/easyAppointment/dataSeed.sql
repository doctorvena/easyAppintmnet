USE [eaReservationMenagment]

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
    (12, CONVERT(VARCHAR, DATEADD(DAY, 3, CONVERT(DATE, GETDATE())), 23) + 'T16:00:00', CONVERT(VARCHAR, DATEADD(DAY, 3, CONVERT(DATE, GETDATE())), 23) + 'T17:00:00', 3, 6, DATEADD(DAY, 3, CONVERT(DATE, GETDATE())), 60, 4, 'Available')


SET IDENTITY_INSERT [dbo].[TimeSlots] OFF;

SET IDENTITY_INSERT [dbo].[Reservations] ON;

INSERT INTO [dbo].[Reservations]
    (ReservationId, SalonId, UserCustomerId, TimeSlotId, Status, ReservationDate, ReservationName)
VALUES
    (1, 1, 16, 1, 'Completed', '2023-08-07', 'Anna'),
    (2, 1, 17, 2, 'Completed', '2023-08-08', 'Brian'),
    (3, 2, 18, 3, 'Completed', '2023-08-08', 'Clara'),
    (4, 2, 19, 4, 'Completed', '2023-08-09', 'David'),
    (5, 3, 16, 5, 'Completed', '2023-08-07', 'Anna'),
    (6, 3, 17, 6, 'Completed', '2023-08-09', 'Brian');

SET IDENTITY_INSERT [dbo].[Reservations] OFF;