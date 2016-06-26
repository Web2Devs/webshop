using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.Framework.Data.DB.Control
{
    public class Venta
    {
        private BDWebShopEntities context { get; set; }
        public Venta(BDWebShopEntities _context)
        {
            context = _context;
        }

        public TOrdenVenta Agregar(TCliente cliente, List<TProducto> productos)
        {


            return null;
        }
    }
}
