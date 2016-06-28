using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using AppWeb.Tests.ShopWS;

namespace AppWeb.Tests
{
    [TestClass]
    public class UnitTest1
    {

        [TestMethod]
        public void AgregarCliente()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TCliente cli = proxy.AgregarCliente(new TCliente()
                {
                    Nombres = "Nataly",
                    Apellidos = "Salazar Garcia",
                    Genero = "F",
                    TipoDocumento = "DNI",
                    NroDocumento = "74367561",
                    Email = "nataly@hotmail.com",
                    Provincia = "Lima",
                    Ciudad = "Lima",
                    Distrito = "Surco",
                    Direccion = "Av. Caminos del Inca 652",
                    Usuario = "Nataly",
                    Contrasena = "123456",
                    RazonSocial = null,
                    Telefono = "6541257"
                });
                Assert.AreNotEqual(cli, null);
            }
        }

        [TestMethod]
        public void ActualizarCliente()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TCliente c = new TCliente();
                {
                    c.CodCliente = 1;
                    c.Nombres = "Nataly";
                    c.Apellidos = "Salazar Garcia";
                    c.Genero = "F";
                    c.TipoDocumento = "DNI";
                    c.NroDocumento = "74367561";
                    c.Email = "nataly_dianne@hotmail.com";
                    c.Provincia = "Lima";
                    c.Ciudad = "Lima";
                    c.Distrito = "Surco";
                    c.Direccion = "Av. Caminos del Inca 652";
                    c.Usuario = "Nataly";
                    c.Contrasena = "123456";
                    c.RazonSocial = null;
                    c.Telefono = "6541257";
                    proxy.ActualizarCliente(c);
                    Assert.AreNotEqual(c, null);
                }

            }
        }

        [TestMethod]
        public void AgregarCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TCategoria cate = proxy.AgregarCategoria(new TCategoria()
                {
                    Nombre = "Computo"
                });
                Assert.AreNotEqual(cate, null);
            }
        }

        [TestMethod]
        public void ActualizarCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TCategoria cate = new TCategoria();
                {
                    cate.CodCategoria = 1;
                    cate.Nombre = "Computos";
                    proxy.ActualizarCategoria(cate);
                    Assert.AreNotEqual(cate, null);
                }
            }
        }

        [TestMethod]
        public void BorrarCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TCategoria cate = new TCategoria();
                {
                    cate.CodCategoria = 2;
                    proxy.BorrarCategoria(cate);
                    Assert.IsNotNull(cate);
                }
            }
        }

        [TestMethod]
        public void AgregarSubCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TSubCategoria subCate = proxy.AgregarSubCategoria(new TSubCategoria()
                {
                    Nombre = "Laptop",
                    CodCategoria = 1
                });
                Assert.AreNotEqual(subCate, null);
            }
        }
        /*error*/
        [TestMethod]
        public void ActualizarSubCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TSubCategoria subCate = new TSubCategoria();
                {
                    subCate.CodSubCategoria = 1;
                    subCate.Nombre = "Laptops";
                    subCate.CodCategoria = 1;
                    proxy.ActualizarSubCategoria(subCate);
                    Assert.AreNotEqual(subCate, null);
                }
            }
        }

        /*error*/
        [TestMethod]
        public void BorrarSubCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TSubCategoria subCate = new TSubCategoria();
                {
                    subCate.CodSubCategoria = 3;
                    proxy.BorrarSubCategoria(subCate);
                    Assert.IsNotNull(subCate);
                }

            }
        }

        [TestMethod]
        public void AgregarProducto()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TProducto pro = proxy.AgregarProducto(new TProducto()
                {
                    Nombre = "Teclado",
                    Descripcion = "Teclado para pc",
                    Especificacion = "nose",
                    Stock = 50,
                    Precio = 45,
                    CodSubCategoria = 1
                });
                Assert.AreNotEqual(pro, null);
            }
        }
        /*error*/
        [TestMethod]
        public void ActualizarProducto()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TProducto pro = new TProducto();
                {
                    pro.CodProducto = 3;
                    pro.Nombre = "Teclado";
                    pro.Descripcion = "Teclado para pc";
                    pro.Especificacion = "nose";
                    pro.Stock = 50;
                    pro.Precio = 45;
                    pro.CodSubCategoria = 1;
                    proxy.ActualizarProducto(pro);
                    Assert.AreNotEqual(pro, null);
                }

            }
        }

        [TestMethod]
        public void BorrarProducto()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TProducto pro = new TProducto();
                {
                    pro.CodProducto = 2;
                    proxy.BorrarProducto(pro);
                    Assert.IsNotNull(pro);
                }
            }
        }

        /*[TestMethod]
        public void AgregarNuevaVenta()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TOrdenVenta venta = new TOrdenVenta();
                TProducto pro = new TProducto();
                 
                {
                    venta.CodCliente = 1;
                    venta.Total = 100;
                    venta.FechaVenta = null;
                    venta.FechaEntrega = null;
                    proxy.AgregarNuevaVenta(venta,pro);
                    Assert.AreNotEqual(venta, null);
                }
            }
        }*/

        [TestMethod]
        public void ValidarLoginCliente()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TCliente cliente = proxy.ValidarLoginCliente("Nataly", "123456");
                Assert.AreNotEqual(cliente, null);
            }
        }
    }
}
