﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.ServicioRest
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IRestService" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IRestService
    {
        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/Clientes", ResponseFormat = WebMessageFormat.Json)]
        IEnumerable<TCliente> ListaClientes();

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/Productos", ResponseFormat = WebMessageFormat.Json)]
        IEnumerable<TProducto> ListaProductos();

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/Producto/{id}", ResponseFormat = WebMessageFormat.Json)]
        TProducto BuscarProducto(string id);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/ProductosSubCate/{id}", ResponseFormat = WebMessageFormat.Json)]
        IEnumerable<TProducto> ListaProductosSubCate(string id);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/ProductosCate/{id}", ResponseFormat = WebMessageFormat.Json)]
        IEnumerable<TProducto> ListaProductosCate(string id);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/SubCategoria", ResponseFormat = WebMessageFormat.Json)]
        IEnumerable<TSubCategoria> ListaSubCategorias();

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/SubCategoriaCate/{id}", ResponseFormat = WebMessageFormat.Json)]
        IEnumerable<TSubCategoria> ListaSubCategoriasId(string id);

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "/Categorias", ResponseFormat = WebMessageFormat.Json)]
        IEnumerable<TCategoria> ListaCategorias();
    }
}
