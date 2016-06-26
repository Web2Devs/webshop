using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using AppWeb.Framework.Data.DB.Control;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.ServicioRest
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "RestService" en el código, en svc y en el archivo de configuración a la vez.
    // NOTA: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione RestService.svc o RestService.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class RestService : IRestService
    {
        private UnitOfWork unit = new UnitOfWork();
        public IEnumerable<TCategoria> ListaCategorias()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<TCliente> ListaClientes()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<TProducto> ListaProductos()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<TSubCategoria> ListaSubCategorias()
        {
            throw new NotImplementedException();
        }
    }
}
