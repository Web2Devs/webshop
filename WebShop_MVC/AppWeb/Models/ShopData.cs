using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AppWeb.ShopWS;

namespace AppWeb.Models
{
    public class ShopData
    {
        public int id { get; set; }
        public int Cantidad { get; set; }
        public TProducto Producto { get; set; }
    }
}