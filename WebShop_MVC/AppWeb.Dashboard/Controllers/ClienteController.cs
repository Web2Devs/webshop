using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppWeb.Dashboard.ShopWS;
namespace AppWeb.Dashboard.Controllers
{
    public class ClienteController : Controller
    {
        // GET: Cliente
        public ActionResult Index()
        {
            ServiceShopSoaClient proxy = new ServiceShopSoaClient();
            var listado = proxy.ListaProductos();               
            return View(listado);
        }
        public ActionResult Crear()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Crear(TProducto nuevoProducto)
        {

            var proxy = new ServiceShopSoaClient();
            proxy.AgregarProducto(nuevoProducto);
            return RedirectToAction("Index");
        }
        
        [HttpGet]
        public ActionResult Actualizar(int? id)
        {
            var proxy = new ServiceShopSoaClient();
            if (id.HasValue)
            {
                
                var prod = proxy(id.Value);
                return View(prod);
            }
            else
            {
                return RedirectToAction("Index");
            }
        }
        [HttpPost]
        public ActionResult Actualizar(TProducto modificarProducto)
        {
            var proxy = new ServiceShopSoaClient();
            proxy.ActualizarProducto(modificarProducto);
            return RedirectToAction("Index");
        }

    }
}