using System;
using System.Collections.Generic;
using System.ServiceModel;
using AppWeb.Framework.Data.DB.Control;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.Servicios
{
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerSession)]
    public class ServiceShopSoa : IServiceShopSoa
    {
        /// <summary>
        /// Agregar nueva Categoria
        /// </summary>
        /// <param name="categoria"></param>
        /// <returns>int codigo</returns>
        public TCategoria AgregarCategoria(TCategoria categoria)
        {
            using (Categoria cate = new Categoria())
            {
                return cate.Create(categoria);
            }
        }

        public TCliente AgregarCliente(TCliente cliente)
        {
            using (Cliente cli = new Cliente())
            {
                return cli.Create(cliente);
            }
        }

        public TOrdenVenta AgregarNuevaVenta(TCliente cliente, List<TProducto> productos)
        {
            using (Venta vent = new Venta())
            {
                return vent.Agregar(cliente, productos);
            }
        }

        public TProducto AgregarProducto(TProducto producto)
        {
            using (Producto pro = new Producto())
            {
                return pro.Create(producto);
            }
        }

        public TSubCategoria AgregarSubCategoria(TSubCategoria subCategoria)
        {
            using (SubCategoria subcate = new SubCategoria())
            {
                return subcate.Create(subCategoria);
            }
        }

        public bool ValidarLoginCliente(string usuario, string password)
        {
            using (Cliente cli = new Cliente())
            {
                return cli.Validar(usuario, password);
            }
        }
    }
}
