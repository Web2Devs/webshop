using System.Collections.Generic;
using System.ServiceModel;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.Servicios
{
    [ServiceContract]
    public interface IServiceShopSoa
    {
        [OperationContract]
        TCliente AgregarCliente(TCliente cliente);
        [OperationContract]
        TProducto AgregarProducto(TProducto producto);
        [OperationContract]
        TSubCategoria AgregarSubCategoria(TSubCategoria subCategoria);
        [OperationContract]
        TCategoria AgregarCategoria(TCategoria categoria);
        [OperationContract]
        TOrdenVenta AgregarNuevaVenta(TCliente cliente, List<TProducto> productos);

        [OperationContract]
        bool ValidarLoginCliente(string usuario, string password);
    }
}
