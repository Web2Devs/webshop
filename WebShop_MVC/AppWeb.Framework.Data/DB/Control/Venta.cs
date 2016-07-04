using System;
using System.Collections.Generic;
using System.Data.Entity;
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

        public TOrdenVenta Find(int id)
        {
            return context.TOrdenVenta.Where(x => x.NroVenta == id).Select(x => x).FirstOrDefault();
        }
        public int Agregar(TCliente cliente, List<ShopData> productos, CreditCardData card)
        {

            decimal? _totalVenta = 0;
            int nroVenta = 0;
            using (var dbContextTransaction = context.Database.BeginTransaction())
            {
                try
                {
                    context.Configuration.ProxyCreationEnabled = false;
                    TOrdenVenta _orden = new TOrdenVenta()
                    {
                        CodCliente = cliente.CodCliente,
                        Total = _totalVenta,
                        FechaVenta = DateTime.Now,
                        FechaEntrega = DateTime.Now.AddDays(7),
                    };
                    _orden = context.TOrdenVenta.Add(_orden);

                    foreach (ShopData item in productos)
                    {
                        TDetalleVenta _detalle = new TDetalleVenta()
                        {
                            NroVenta = _orden.NroVenta,
                            CodProducto = item.Producto.CodProducto,
                            Cantidad = item.Cantidad,
                            PrecioUnitario = item.Producto.Precio
                        };
                        _totalVenta += (item.Cantidad * item.Producto.Precio);
                        context.TDetalleVenta.Add(_detalle);
                    }
                    _orden.Total = _totalVenta;

                    context.SaveChanges();
                    dbContextTransaction.Commit();
                    nroVenta = _orden.NroVenta;
                }
                catch (Exception e)
                {
                    dbContextTransaction.Rollback();
                    throw new Exception("Fuck" + e.Message);
                }
            }
            return nroVenta;
        }
    }
}
