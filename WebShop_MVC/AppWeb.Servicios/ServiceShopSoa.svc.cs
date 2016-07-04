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
        public ServiceShopSoa()
        {

        }
        #region Categoria
        public TCategoria AgregarCategoria(TCategoria categoria)
        {
            TCategoria _categoria = unit.Categoria.Create(categoria);
            unit.SaveChanges();
            return _categoria;
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
        public TCategoria BuscarCategoria(int id)
        {
            return unit.Categoria.Find(id);
        }

        public TSubCategoria AgregarSubCategoria(TSubCategoria subCategoria)
        {
            TSubCategoria _subcategoria = unit.SubCategoria.Create(subCategoria);
            unit.SaveChanges();
            return _subcategoria;
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
        public TSubCategoria BuscarSubCategoria(int id)
        {
            return unit.SubCategoria.Find(id);
        }
        #endregion

        #region Cliente
        public TCliente AgregarCliente(TCliente cliente)
        {
            TCliente _cliente = unit.Cliente.Create(cliente);
            unit.SaveChanges();
            return _cliente;
        }
        public void ActualizarCliente(TCliente cliente)
        {
            unit.Cliente.Update(cliente);
            unit.SaveChanges();
        }
        public IEnumerable<TCliente> ListaClientes()
        {
            return unit.Cliente.GetAll();
        }
        public TCliente BuscarCliente(int id)
        {
            return unit.Cliente.Find(id);
        }
        #endregion

        #region Producto
        public TProducto AgregarProducto(TProducto producto)
        {
            TProducto _producto = unit.Producto.Create(producto);
            unit.SaveChanges();
            return _producto;
        }
        public void ActualizarProducto(TProducto producto)
        {
            unit.Producto.Update(producto);
            unit.SaveChanges();
        }
        public void BorrarProducto(TProducto producto)
        {
            unit.Producto.Delete(producto);
            unit.SaveChanges();
        }
        public IEnumerable<TProducto> ListaProductos()
        {
            return unit.Producto.GetAll();
        }
        public TProducto BuscarProducto(int id)
        {
            return unit.Producto.Find(id);
        }
        #endregion

        #region Opracion
        public int AgregarNuevaVenta(TCliente cliente, List<ShopData> productos, CreditCardData card)
        {
            return unit.Venta.Agregar(cliente, productos, card);
        }
        public TOrdenVenta BuscarOrdenVenta(int id)
        {
            TOrdenVenta ordenVenta = unit.Venta.Find(id);
            return ordenVenta;
        }
        public TCliente ValidarLoginCliente(string usuario, string password)
        {
            return unit.Cliente.Validar(usuario, password);
        }
        #endregion
    }
}
