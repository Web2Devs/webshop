﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppWeb.Controllers
{
    public class ProductoController : Controller
    {
        // GET: Producto
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Lista()
        {
            return View();
        }

        public ActionResult Info(int? id)
        {
            if (!id.HasValue)
                return RedirectToAction("Index", "Home");
            return View();
        }
    }
}