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
	                Genero  = "F",
	                TipoDocumento = "DNI",
	                NroDocumento = "74367561",
	                Email  = "nataly@hotmail.com", 
	                Provincia = "Lima",
	                Ciudad = "Lima",
	                Distrito  = "Surco",
	                Direccion  = "Av. Caminos del Inca 652",
	                Usuario = "Nataly",
	                Contrasena = "123456",
	                RazonSocial  = null,
                    Telefono = "6541257"
                });
                Assert.AreEqual(cli, null);
            }
        }

        public void ActualizarCliente()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TCliente cli = proxy.ActualizarCliente(new TCliente()
                {
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
                Assert.AreEqual(cli, null);
            }
        }

        [TestMethod]
        public void AgregarCategoria()
        {
            using ( ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
               TCategoria cate = proxy.AgregarCategoria(new TCategoria()
                {
                    Nombre = "Computo"
                });
                Assert.AreEqual(cate, null);
            }
        }

        [TestMethod]
        public void ActualizarCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TCategoria cate = proxy.ActualizarCategoria(new TCategoria()
                {
                    Nombre = "Computos"
                });
                Assert.AreEqual(cate, null);
            }
        }

        [TestMethod]
        public void BorrarCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                bool cate = proxy.BorrarCategoria(new TCategoria()
                {
                    CodCategoria = 1
                });
                Assert.IsTrue(cate);
                //Assert.AreNotEqual(cate, 1);
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
                Assert.AreEqual(subCate, null);
            }
        }

        [TestMethod]
        public void ActualizarSubCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TSubCategoria subCate = proxy.ActualizarSubCategoria(new TSubCategoria()
                {
                    Nombre = "Laptops",
                    CodCategoria = 1
                });
                Assert.AreEqual(subCate, null);
            }
        }

        [TestMethod]
        public void BorrarSubCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                bool subCate = proxy.BorrarSubCategoria(new TSubCategoria()
                {
                    CodSubCategoria = 1
                    
                });
                Assert.IsTrue(subCate);
                //Assert.AreNotEqual(cate, 1);
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
	                CodSubCategoria  = 1

                });
                Assert.AreEqual(pro, null);
            }
        }

        [TestMethod]
        public void ActualizarProducto()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                TProducto pro = proxy.ActualizarProducto(new TProducto()
                {

                    Nombre = "Teclado",
                    Descripcion = "Teclado para pc",
                    Especificacion = "nose",
                    Stock = 100,
                    Precio = 45,
                    CodSubCategoria = 1

                });
                Assert.AreEqual(pro, null);
            }
        }

        [TestMethod]
        public void TProducto()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                bool pro = proxy.BorrarProducto(new TProducto()
                {
                    CodProducto = 1
                });
                Assert.IsTrue(pro);
                //Assert.AreNotEqual(cate, 1);
            }
        }

    }
}
