﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CoffeeShops.Service.Models
{
    public class OrderListByKitchenIdViewDto
    {
        public Guid OrderId { get; set; }
        public string ProductName { get; set; }
        public string TableName { get; set; }
    }
}
