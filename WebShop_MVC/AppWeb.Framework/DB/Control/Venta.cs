using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppWeb.Framework.DB.Model;

namespace AppWeb.Framework.DB.Control
{
    public class Venta : IDisposable
    {
        public BDWebShopEntities context { get; set; }
        public Venta()
        {
            context = new BDWebShopEntities();
        }

        public TOrdenVenta Agregar(TCliente cliente, List<TProducto> productos)
        {


            return null;
        }


        public void Dispose()
        {
            context.Dispose();
        }
    }
}
