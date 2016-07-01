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
            int codCliente = int.Parse(Session["CodCliente"].ToString());
            TCliente _cli = proxy.BuscarCliente(codCliente);
            return View(_cli);
        }

        [HttpPost]
        public ActionResult Index(TCliente _form_cli)
        {
            int codCliente = int.Parse(Session["CodCliente"].ToString());
            if (codCliente == _form_cli.CodCliente)
            {
                TCliente cliente = proxy.BuscarCliente(codCliente);
                cliente.Nombres = _form_cli.Nombres;
                cliente.Apellidos = _form_cli.Apellidos;
                cliente.TipoDocumento = _form_cli.TipoDocumento;
                cliente.NroDocumento = _form_cli.NroDocumento;
                cliente.Direccion = _form_cli.Direccion;
                cliente.RazonSocial = _form_cli.RazonSocial;
                cliente.Telefono = _form_cli.Telefono;
                cliente.Genero = _form_cli.Genero;
                proxy.ActualizarCliente(cliente);
            }
            return RedirectToAction("Index");
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(TCliente cliente)
        {
            TCliente _cli = proxy.AgregarCliente(cliente);
            if (_cli != null)
            {
                FormsAuthentication.SetAuthCookie(_cli.Usuario, false);
                Session["CodCliente"] = _cli.CodCliente;
                Session["Usuario"] = _cli.Usuario;
                return RedirectToAction("Index");
            }
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
                    return RedirectToAction("Register");
                }
            }
            catch (Exception e)
            {
                //throw e;
                return RedirectToAction("Register");
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