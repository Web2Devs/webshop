using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using AppWeb.ShopWS;

namespace AppWeb.Controllers
{
    public class ClienteController : Controller
    {
        ServiceShopSoaClient proxy = new ServiceShopSoaClient();
        // GET: Cliente
        /*[Authorize]*/
        public ActionResult Index()
        {
            if (Session["CodCliente"] == null)
                return RedirectToAction("Login");
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection coll)
        {
            string usuario = coll["txtUsuario"].ToString();
            string password = coll["txtPassword"].ToString();
            try
            {
                TCliente _cliente = proxy.ValidarLoginCliente(usuario, password);
                if (_cliente != null)
                {
                    FormsAuthentication.SetAuthCookie(_cliente.Usuario, false);
                    
                    Session["CodCliente"] = _cliente.CodCliente;
                    Session["Usuario"] = _cliente.Usuario;
                    return RedirectToAction("Index");
                }
                else
                {
                    return RedirectToAction("Login");
                }
            }
            catch (Exception e)
            {
                //throw e;
                return RedirectToAction("Login");
            }
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            return RedirectToAction("Index", "Home");
        }
    }
}