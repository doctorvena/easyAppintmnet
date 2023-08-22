﻿using System;
using System.Collections.Generic;

namespace easyAppointment.Salon.Database;
public partial class SalonRating
{
    public int SalonRatingId { get; set; }

    public double Rating { get; set; }

    public DateTime RatingDate { get; set; }

    public int? UserId { get; set; }

    public int? SalonId { get; set; }

    public virtual Salon? Salon { get; set; }

}
