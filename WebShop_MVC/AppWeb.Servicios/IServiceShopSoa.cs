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
        TCliente ActualizarCliente(TCliente cliente);
        #endregion

        #region Producto
        [OperationContract]
        TProducto AgregarProducto(TProducto producto);
        [OperationContract]
        TProducto ActualizarProducto(TProducto producto);
        [OperationContract]
        bool BorrarProducto(TProducto producto);
        #endregion

        #region Categoria
        [OperationContract]
        TSubCategoria AgregarSubCategoria(TSubCategoria subCategoria);
        [OperationContract]
        TSubCategoria ActualizarSubCategoria(TSubCategoria subCategoria);
        [OperationContract]
        bool BorrarSubCategoria(TSubCategoria subCategoria);
        [OperationContract]
        TCategoria AgregarCategoria(TCategoria categoria);
        [OperationContract]
        TCategoria ActualizarCategoria(TCategoria categoria);
        [OperationContract]
        bool BorrarCategoria(TCategoria categoria);
        #endregion

        #region Operaciones
        [OperationContract]
        TOrdenVenta AgregarNuevaVenta(TCliente cliente, List<TProducto> productos);
        [OperationContract]
        bool ValidarLoginCliente(string usuario, string password);
        #endregion

    }
}
