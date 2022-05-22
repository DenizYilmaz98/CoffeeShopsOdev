﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CoffeeShops.API.Models.UserModel
{
    public class GetUserViewModel
    {
   
        public string FirstName { get; set; }


        public string LastName { get; set; }


        public string Email { get; set; }

    }
}
