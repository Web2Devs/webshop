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
                       

    }
}