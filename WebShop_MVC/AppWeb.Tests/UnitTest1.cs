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
                TCliente cli = proxy.ActualizarCliente(new TCliente()
                {
                    CodCliente = 1,
                    Nombres = "Nataly",
                    Apellidos = "Salazar Garcia",
                    Genero = "F",
                    TipoDocumento = "DNI",
                    NroDocumento = "74367561",
                    Email = "nataly_dianne@hotmail.com",
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
                TCategoria cate = proxy.ActualizarCategoria(new TCategoria()
                {
                    CodCategoria = 1,
                    Nombre = "Computos"
                });
                Assert.AreNotEqual(cate, null);
            }
        }

        [TestMethod]
        public void BorrarCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                bool cate = proxy.BorrarCategoria(new TCategoria()
                {
                    CodCategoria = 2
                });
                Assert.IsTrue(cate);
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

        [TestMethod]
        public void ActualizarSubCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TSubCategoria subCate = proxy.ActualizarSubCategoria(new TSubCategoria()
                {
                    CodSubCategoria = 3,
                    Nombre = "Laptops",
                    CodCategoria = 1
                });
                Assert.AreNotEqual(subCate, null);
            }
        }

        [TestMethod]
        public void BorrarSubCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                bool subCate = proxy.BorrarSubCategoria(new TSubCategoria()
                {
                    CodSubCategoria = 3
                });
                Assert.IsTrue(subCate);
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
                    CodSubCategoria = 3
                });
                Assert.AreNotEqual(pro, null);
            }
        }

        [TestMethod]
        public void ActualizarProducto()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TProducto pro = proxy.ActualizarProducto(new TProducto()
                {
                    CodProducto = 2,
                    Nombre = "Teclado",
                    Descripcion = "Teclado para pc",
                    Especificacion = "nose",
                    Stock = 100,
                    Precio = 45,
                    CodSubCategoria = 3
                });
                Assert.AreNotEqual(pro, null);
            }
        }

        [TestMethod]
        public void BorrarProducto()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                bool pro = proxy.BorrarProducto(new TProducto()
                {
                    CodProducto = 2
                });
                Assert.IsTrue(pro);
            }
        }

        /*[TestMethod]
        public void AgregarNuevaVenta()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TOrdenVenta venta = proxy.AgregarNuevaVenta(new TCliente(), TProducto
                {
                    CodCliente = 1,
                    Total = 100,
                    FechaVenta = null,
                    FechaEntrega = null
                });
            }
        }*/

        [TestMethod]
        public void ValidarLoginCliente()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TCliente cliente = new TCliente();
                bool pro = proxy.ValidarLoginCliente( "Nataly", "123456");
                Assert.IsTrue(pro);
            }
        }
    }
}
