﻿using AutoMapper;
using easyAppointment.Model.Requests;
using easyAppointment.Model.Responses;
using easyAppointment.Model.SearchObjects;
using easyAppointment.Services.Database;
using easyAppointment.Services.InterfaceServices;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace easyAppointment.Services.ServiceImpl
{
    public class SexServiceImpl : ServiceImpl<SexResponse, Sex, SexSearchObject>, SexService
    {
        public SexServiceImpl(EasyAppointmnetDbContext _context, IMapper _mapper) : base( _context, _mapper)
        {
        }
    }
}
