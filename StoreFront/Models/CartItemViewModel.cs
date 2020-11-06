using StoreFrontLab.DATA.EF;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations; 
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreFront.Models
{
    public class CartItemViewModel : Controller
    {
        [Range(1, int.MaxValue)] //ensure values are greater than 0 but not greater than the max for the int datatype
        public int Qty { get; set; }

        public Game Product { get; set; }

        // FQCOTR  
        public CartItemViewModel(int qty, Game product)
        {
            Qty = qty;
            Product = product;
        }
    }
}