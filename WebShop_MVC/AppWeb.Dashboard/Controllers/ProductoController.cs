using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppWeb.Dashboard.ShopWS;

namespace AppWeb.Dashboard.Controllers
{
    public class ProductoController : Controller
    {
        
        // GET: Producto
        public ActionResult Index()
        {
            var proxy = new ServiceShopSoaClient();
            return View(proxy.ListaProductos());
        }
        public ActionResult Crear()
        {
            var proxy = new ServiceShopSoaClient();
            var listadoSubCategoria = proxy.ListaSubCategorias();
            ViewBag.CodSubCategoria = new SelectList(listadoSubCategoria, "CodSubCategoria", "Nombre");
            return View();
        }
        [HttpPost]
        public ActionResult Crear(TProducto nuevoProducto,int CodSubProducto)
        {
            var proxy = new ServiceShopSoaClient();
            var subcategoria = proxy.BuscarSubCategoria(CodSubProducto);
            nuevoProducto.TSubCategoria = subcategoria;
            proxy.AgregarProducto(nuevoProducto);
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Actualizar(int? id)
        {
            var proxy = new ServiceShopSoaClient();
            if (id.HasValue)
            {
                var listadoSubCategoria = proxy.ListaSubCategorias();
                ViewBag.CodSubCategoria = new SelectList(listadoSubCategoria, "CodSubCategoria", "Nombre");
                var prod = proxy.BuscarProducto(id.Value);
                return View(prod);
            }
            else
            {
                return RedirectToAction("Index");
            }
        }
        [HttpPost]
        public ActionResult Actualizar(TProducto modificarProducto, int CodSubProducto)
        {
            var proxy = new ServiceShopSoaClient();
            var subcategoria = proxy.BuscarSubCategoria(CodSubProducto);
            modificarProducto.TSubCategoria = subcategoria;
            proxy.ActualizarProducto(modificarProducto);
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Eliminar(int id)
        {
            var proxy = new ServiceShopSoaClient();
            if (id != 0)
            {
                var prod = proxy.BuscarProducto(id);
                return View(prod);
            }
            else
            {
                return RedirectToAction("Index");
            }

        }
        [HttpPost]
        public ActionResult Eliminar(TProducto producto)
        {
            var proxy = new ServiceShopSoaClient();
            proxy.BorrarProducto(producto);
            return RedirectToAction("Index");
        }
    }
}