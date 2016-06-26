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
        private UnitOfWork unit = new UnitOfWork();
        #region Categoria
        public TCategoria AgregarCategoria(TCategoria categoria)
        {
            return unit.Categoria.Create(categoria);
            unit.SaveChanges();
        }
        public void BorrarCategoria(TCategoria categoria)
        {
            unit.Categoria.Delete(categoria);
            unit.SaveChanges();
        }
        public void ActualizarCategoria(TCategoria categoria)
        {
            unit.Categoria.Update(categoria);
            unit.SaveChanges();
        }
        public IEnumerable<TCategoria> ListaCategorias()
        {
            return unit.Categoria.GetAll();
        }
        public TSubCategoria AgregarSubCategoria(TSubCategoria subCategoria)
        {
            return unit.SubCategoria.Create(subCategoria);
            unit.SaveChanges();
        }
        public void ActualizarSubCategoria(TSubCategoria subCategoria)
        {
            unit.SubCategoria.Update(subCategoria);
            unit.SaveChanges();
        }
        public void BorrarSubCategoria(TSubCategoria subCategoria)
        {
            unit.SubCategoria.Delete(subCategoria);
            unit.SaveChanges();
        }
        public IEnumerable<TSubCategoria> ListaSubCategorias()
        {
            return unit.SubCategoria.GetAll();
        }
        #endregion

        #region Cliente
        public TCliente AgregarCliente(TCliente cliente)
        {
            return unit.Cliente.Create(cliente);
        }
        public void ActualizarCliente(TCliente cliente)
        {
            unit.Cliente.Update(cliente);
        }
        public IEnumerable<TCliente> ListaClientes()
        {
            return unit.Cliente.GetAll();
        }
        #endregion

        #region Producto
        public TProducto AgregarProducto(TProducto producto)
        {
            return unit.Producto.Create(producto);
        }
        public void ActualizarProducto(TProducto producto)
        {
            unit.Producto.Update(producto);
        }
        public void BorrarProducto(TProducto producto)
        {
            unit.Producto.Delete(producto);
        }
        public IEnumerable<TProducto> ListaProductos()
        {
            return unit.Producto.GetAll();
        }
        #endregion

        #region Opracion
        public TOrdenVenta AgregarNuevaVenta(TCliente cliente, List<TProducto> productos)
        {
            return unit.Venta.Agregar(cliente, productos);
        }
        public bool ValidarLoginCliente(string usuario, string password)
        {
            return unit.Cliente.Validar(usuario, password);
        }
        #endregion
    }
}
