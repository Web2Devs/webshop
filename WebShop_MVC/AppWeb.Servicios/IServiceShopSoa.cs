using System.Collections.Generic;
using System.ServiceModel;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.Servicios
{
    [ServiceContract]
    public interface IServiceShopSoa
    {
        #region Cliente
        [OperationContract]
        TCliente AgregarCliente(TCliente cliente);
        [OperationContract]
        void ActualizarCliente(TCliente cliente);
        [OperationContract]
        IEnumerable<TCliente> ListaClientes();
        [OperationContract]
        TCliente BuscarCliente(int id);
        #endregion

        #region Producto
        [OperationContract]
        TProducto AgregarProducto(TProducto producto);
        [OperationContract]
        void ActualizarProducto(TProducto producto);
        [OperationContract]
        void BorrarProducto(TProducto producto);
        [OperationContract]
        IEnumerable<TProducto> ListaProductos();
        [OperationContract]
        TProducto BuscarProducto(int id);
        #endregion

        #region Categoria
        [OperationContract]
        TSubCategoria AgregarSubCategoria(TSubCategoria subCategoria);
        [OperationContract]
        void ActualizarSubCategoria(TSubCategoria subCategoria);
        [OperationContract]
        void BorrarSubCategoria(TSubCategoria subCategoria);
        [OperationContract]
        IEnumerable<TSubCategoria> ListaSubCategorias();
        [OperationContract]
        TSubCategoria BuscarSubCategoria(int id);

        [OperationContract]
        TCategoria AgregarCategoria(TCategoria categoria);
        [OperationContract]
        void ActualizarCategoria(TCategoria categoria);
        [OperationContract]
        void BorrarCategoria(TCategoria categoria);
        [OperationContract]
        IEnumerable<TCategoria> ListaCategorias();
        [OperationContract]
        TCategoria BuscarCategoria(int id);
        #endregion

        #region Operaciones
        [OperationContract]
        int AgregarNuevaVenta(TCliente cliente, List<ShopData> productos, CreditCardData card);
        [OperationContract]
        List<TOrdenVenta> ListaOrdenVent(int cliente);
        [OperationContract]
        List<TDetalleVenta> ObtenerDetalleVenta(int codVenta);
        [OperationContract]
        TOrdenVenta BuscarOrdenVenta(int id);
        [OperationContract]
        TCliente ValidarLoginCliente(string usuario, string password);
        #endregion

    }
}
