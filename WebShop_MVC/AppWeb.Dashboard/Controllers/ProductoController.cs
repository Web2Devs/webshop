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
        ServiceShopSoaClient proxy = new ServiceShopSoaClient();
        // GET: Producto
        public ActionResult Index()
        {
            return View(proxy.ListaProductos());
        }
    }
}