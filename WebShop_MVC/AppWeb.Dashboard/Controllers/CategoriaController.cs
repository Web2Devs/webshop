using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppWeb.Dashboard.ShopWS;

namespace AppWeb.Dashboard.Controllers
{
    public class CategoriaController : Controller
    {
        // GET: Categoria
        public ActionResult Index()
        {
            var proxy = new ServiceShopSoaClient();
            return View(proxy.ListaCategorias());
        }
        public ActionResult Crear()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Crear(TCategoria nuevaCategoria)
        {

            var proxy = new ServiceShopSoaClient();
            proxy.AgregarCategoria(nuevaCategoria);
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Actualizar(int? id)
        {
            var proxy = new ServiceShopSoaClient();
            if (id.HasValue)
            {
                var cat = proxy.BuscarCategoria(id.Value);
                return View(cat);
            }
            else
            {
                return RedirectToAction("Index");
            }
        }
        [HttpPost]
        public ActionResult Actualizar(TCategoria modificarCategoria)
        {
            var proxy = new ServiceShopSoaClient();
            proxy.ActualizarCategoria(modificarCategoria);
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Eliminar(int id)
        {
            var proxy = new ServiceShopSoaClient();
            if (id != 0)
            {
                var cat = proxy.BuscarCategoria(id);
                return View(cat);
            }
            else
            {
                return RedirectToAction("Index");
            }

        }
        [HttpPost]
        public ActionResult Eliminar(TCategoria categoria)
        {
            var proxy = new ServiceShopSoaClient();
            proxy.BorrarCategoria(categoria);
            return RedirectToAction("Index");
        }
    }
}