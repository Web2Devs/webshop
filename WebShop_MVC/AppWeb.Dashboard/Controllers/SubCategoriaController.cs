using AppWeb.Dashboard.ShopWS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppWeb.Dashboard.Controllers
{
    public class SubCategoriaController : Controller
    {
        private ServiceShopSoaClient proxy = new ServiceShopSoaClient();
        // GET: SubCategoria
        public ActionResult Index()
        {
            var lista = proxy.ListaSubCategorias();
            return View(lista);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(TSubCategoria subCategoria)
        {
            proxy.AgregarSubCategoria(subCategoria);
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int? Id)
        {
            if (Id.HasValue)
            {
                var sub = proxy.BuscarSubCategoria(Id.Value);
                return View(sub);
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult Edit(TSubCategoria subCategoria)
        {
            proxy.ActualizarSubCategoria(subCategoria);
            return RedirectToAction("Index");
        }

        public ActionResult Delete(int? Id)
        {
            if (Id.HasValue)
            {
                var sub = proxy.BuscarSubCategoria(Id.Value);
                return View(sub);
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult Delete(TSubCategoria subCategoria)
        {
            proxy.BorrarSubCategoria(subCategoria);
            return RedirectToAction("Index");
        }
    }
}