using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AppWeb.Models
{
    public class Cart
    {
        public int Id { get; set; }
        public string CartId { get; set; }
        public int CodProducto { get; set; }
        public int Cantidad { get; set; }
    }
}