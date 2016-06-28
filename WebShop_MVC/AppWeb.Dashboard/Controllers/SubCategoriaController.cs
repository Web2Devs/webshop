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
        private ServiceShopSoaClient _proxy = new ServiceShopSoaClient();
        // GET: SubCategoria
        public ActionResult Index()
        {
            return View(_proxy.ListaSubCategorias());
        }
    }
}