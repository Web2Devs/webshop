using System.ServiceModel;
using AppWeb.Framework.DB.Model;

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
    }
}
