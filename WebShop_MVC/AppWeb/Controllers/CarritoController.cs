using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Description;
using System.Web;
using System.Web.Mvc;
using AppWeb.Models;
using AppWeb.ShopWS;

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
            } else if(data == null)
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

            

           return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult MetodoPago(FormCollection col)
        {
            if (Session["CodCliente"] == null || Session["CompraSend"] == null || Session["CompraData"] == null)
                return RedirectToAction("Index", "Carrito");

            try
            {
                CreditCardData card = new CreditCardData()
                {
                    CreditCardType = col["CreditCardType"].ToString(),
                    CardholderName = col["CardholderName"].ToString(),
                    CardNumber = col["CardNumber"].ToString(),
                    ExpireMonth = int.Parse(col["ExpireMonth"].ToString()),
                    ExpireYear = int.Parse(col["ExpireYear"].ToString()),
                    CardCode = int.Parse(col["CardCode"].ToString()),
                };
                Session["CardData"] = card;
                return RedirectToAction("Confirm");
            }
            catch
            { }

            return View();
        }

        public ActionResult Confirm()
        {
            if (Session["CodCliente"] == null || Session["CompraSend"] == null || Session["CompraData"] == null)
                return RedirectToAction("Index", "Carrito");

            if(Session["CardData"] == null)
                return RedirectToAction("MetodoPago", "Carrito");


            int codCliente = (int)Session["CodCliente"];
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                var cli = proxy.BuscarCliente(codCliente);
                return View(cli);
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Confirm(FormCollection col)
        {
            if (Session["CodCliente"] == null || Session["CompraSend"] == null || Session["CompraData"] == null || Session["CardData"] == null)
                return RedirectToAction("Index", "Carrito");

            try
            {
                using(ServiceShopSoaClient proxy = new ServiceShopSoaClient())
                {
                    proxy.Endpoint.Binding.SendTimeout = new TimeSpan(0, 5, 30);
                    proxy.Endpoint.Binding.CloseTimeout = new TimeSpan(0, 5, 30);
                    proxy.Endpoint.Binding.SendTimeout = new TimeSpan(0, 5, 30);
                    proxy.Endpoint.Binding.ReceiveTimeout = new TimeSpan(0, 5, 30);

                    ConfigureClientEndPoint(proxy.Endpoint);

                    int _codCliente = int.Parse(Session["CodCliente"].ToString());
                    TCliente cliente = proxy.BuscarCliente(_codCliente);
                    CreditCardData Card = (CreditCardData)Session["CardData"];
                    List<ShopData> data = (List<ShopData>)Session["CompraData"];
                    int nroVenta = proxy.AgregarNuevaVenta(cliente, data.ToList(), Card);
                    Session["NroVenta"] = nroVenta;
                    Session["Confirm"] = true;
                    Session["CardData"] = null;
                    Session["CompraData"] = null;
                    Session["CompraSend"] = null;
                    return RedirectToAction("Result", "Carrito");
                }
            }
            catch (Exception e)
            {
                //throw e;
            }


            return View();
        }

        public ActionResult Result()
        {
            if (Session["NroVenta"] == null)
                return RedirectToAction("Index", "Carrito");

            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                int nroVenta = (int)Session["NroVenta"];
                TOrdenVenta ordenVenta = proxy.BuscarOrdenVenta(nroVenta);
                return View(ordenVenta);
            }
        }

        private void ConfigureClientEndPoint(ServiceEndpoint endPoint)
        {
            foreach (OperationDescription operation in
                     endPoint.Contract.Operations)
            {
                DataContractSerializerOperationBehavior dataContractBehavior =
                operation.Behaviors.Find<DataContractSerializerOperationBehavior>();
                if (dataContractBehavior != null)
                {
                    dataContractBehavior.MaxItemsInObjectGraph = 2147483647;
                }
            }
        }
    }
}