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

        #region Categoria
        public TCategoria AgregarCategoria(TCategoria categoria)
        {
            using (Categoria cate = new Categoria())
            {
                return cate.Create(categoria);
            }
        }
        public bool BorrarCategoria(TCategoria categoria)
        {
            using (Categoria cate = new Categoria())
            {
                return cate.Delete(categoria);
            }
        }
        public TCategoria ActualizarCategoria(TCategoria categoria)
        {
            using (Categoria cate = new Categoria())
            {
                cate.Update(categoria);
                return categoria;
            }
        }
        public TSubCategoria AgregarSubCategoria(TSubCategoria subCategoria)
        {
            using (SubCategoria subcate = new SubCategoria())
            {
                return subcate.Create(subCategoria);
            }
        }
        public TSubCategoria ActualizarSubCategoria(TSubCategoria subCategoria)
        {
            using (SubCategoria subcate = new SubCategoria())
            {
                subcate.Update(subCategoria);
                return subCategoria;
            }
        }
        public bool BorrarSubCategoria(TSubCategoria subCategoria)
        {
            using (SubCategoria subcate = new SubCategoria())
            {
                return subcate.Delete(subCategoria);
            }
        }
        #endregion

        #region Cliente
        public TCliente AgregarCliente(TCliente cliente)
        {
            using (Cliente cli = new Cliente())
            {
                return cli.Create(cliente);
            }
        }
        public TCliente ActualizarCliente(TCliente cliente)
        {
            using (Cliente cli = new Cliente())
            {
                cli.Update(cliente);
                return cliente;
            }
        }

        #endregion

        #region Producto
        public TProducto AgregarProducto(TProducto producto)
        {
            using (Producto pro = new Producto())
            {
                return pro.Create(producto);
            }
        }
        public TProducto ActualizarProducto(TProducto producto)
        {
            using (Producto pro = new Producto())
            {
                pro.Update(producto);
                return producto;
            }
        }
        public bool BorrarProducto(TProducto producto)
        {
            using (Producto pro = new Producto())
            {
                return pro.Delete(producto);
            }
        }
        #endregion

        #region Opracion
        public TOrdenVenta AgregarNuevaVenta(TCliente cliente, List<TProducto> productos)
        {
            using (Venta vent = new Venta())
            {
                return vent.Agregar(cliente, productos);
            }
        }
        public bool ValidarLoginCliente(string usuario, string password)
        {
            using (Cliente cli = new Cliente())
            {
                return cli.Validar(usuario, password);
            }
        }
        #endregion
    }
}
