using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppWeb.Models;

namespace AppWeb.Controllers
{
    public class CarritoController : Controller
    {
        // GET: Carrito
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AgregarProducto(FormCollection col)
        {

            return View();
        }

        public ActionResult Compra()
        {
            return View();
        }

        [HttpPost]
        public JsonResult Compra(List<ShopData> data)
        {
            if (Session["CodCliente"] == null)
            {
                Session["CompraSend"] = true;
                Session["CompraData"] = data;
                return Json(new RespShopCompra() { Tipo = 1, Mensaje = "Usuario No Logeado" });
            } else if(data.Count <= 0)
            {
                return Json(new RespShopCompra() { Tipo = 2, Mensaje = "Carrito Vacio" });
            }

            Session["CompraSend"] = true;
            Session["CompraData"] = data;
            return Json(new RespShopCompra() { Tipo = 3, Mensaje = "Correcto" });
        }

        public ActionResult MetodoPago()
        {
            if (Session["CodCliente"] == null || Session["CompraSend"] == null || Session["CompraData"] == null)
                return RedirectToAction("Index", "Carrito");

            //List<ShopData> data = (List<ShopData>)Session["CompraData"];

           return View();
        }

        public ActionResult Confirm()
        {
            return View();
        }
    }
}