using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.Framework.Data.DB.Model
{
    public class ShopData
    {
        public int id { get; set; }
        public int Cantidad { get; set; }
        public TProducto Producto { get; set; }
    }
}