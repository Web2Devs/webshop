using System.ServiceModel;
using AppWeb.Framework.DB.Model;

namespace AppWeb.Servicios
{
    [ServiceContract]
    public interface IServiceShopSoa
    {
        [OperationContract]
        int AgregarCliente(TCliente cliente);
        [OperationContract]
        int AgregarProducto(TProducto producto);
        [OperationContract]
        int AgregarSubCategoria(TSubCategoria subCategoria);
        [OperationContract]
        int AgregarCategoria(TCategoria categoria);
    }
}
