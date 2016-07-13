using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AppWeb.Dashboard.ShopWS;
using AppWeb.Dashboard.Models;
namespace AppWeb.Dashboard.Controllers
{
    public class ClienteController : Controller
    {
        ServiceShopSoaClient proxy = new ServiceShopSoaClient();
        // GET: Cliente
        public ActionResult Index()
        {
            ServiceShopSoaClient proxy = new ServiceShopSoaClient();
            var listado = proxy.ListaClientes();               
            return View(listado);
        }

        public ActionResult Create()
        {
            List<Genero> ListaGenero = new List<Genero> {
                                      new Genero{ Name="Masculino",   ID = "M"},
                                      new Genero{ Name="Femenino", ID = "F"}};
            ViewBag.Genero = new SelectList(ListaGenero, "ID", "Name");
            

            List<TipoDocumento> ListaTipo = new List<TipoDocumento> {
                                      new TipoDocumento{ nombre="DNI", id = "DNI"},
                                      new TipoDocumento{ nombre="Pasaporte", id = "Pasaporte"}};
            ViewBag.TipoDocumento = new SelectList(ListaTipo, "id", "nombre");
            return View();
        }
        
        [HttpPost]
        public ActionResult Create(TCliente cliente)
        {
            proxy.AgregarCliente(cliente);
            return RedirectToAction("Index");
        }

        public ActionResult Edit(int? Id)
        {
            if (Id.HasValue)
            {
                var cli = proxy.BuscarCliente(Id.Value);
                return View(cli);
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult Edit(TCliente cliente)
        {
             proxy.ActualizarCliente(cliente);
            return RedirectToAction("Index");
        }

    }
}