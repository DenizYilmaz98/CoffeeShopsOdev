﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CoffeeShops.API.Models
{
    public class LoginInputModel
    {
       
        public string Email { get; set; }
        
        public string Password { get; set; }
    }
}
