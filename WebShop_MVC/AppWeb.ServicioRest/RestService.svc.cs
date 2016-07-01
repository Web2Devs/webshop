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
            var listaCategoria = unit.Categoria.GetAll();
            return listaCategoria;
        }

        public IEnumerable<TCliente> ListaClientes()
        {
            var listaCliente = unit.Cliente.GetAll();
            return listaCliente;
        }

        public IEnumerable<TProducto> ListaProductos()
        {
            var listaProductos = unit.Producto.GetAll();
            return listaProductos;
        }

        public IEnumerable<TSubCategoria> ListaSubCategorias()
        {
            var listaSubCate = unit.SubCategoria.GetAll();
            return listaSubCate;
        }

        public IEnumerable<TSubCategoria> ListaSubCategoriasId(string id)
        {
            var xid = int.Parse(id);
            var listaSubCateB = ListaSubCategorias().Select(x => x).Where(x => x.CodCategoria == xid).ToList();
            return listaSubCateB;
        }
    }
}