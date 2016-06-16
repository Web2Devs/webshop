using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using AppWeb.Tests.ShopWS;

namespace AppWeb.Tests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void AgregarCategoria()
        {
            using ( ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
               int cate = proxy.AgregarCategoria(new TCategoria()
                {
                    Nombre = "Computo"
                });
                Assert.AreEqual(cate, 1);
            }
        }

        [TestMethod]
        public void ActualizarCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                int cate = proxy.ActualizarCategoria(new TCategoria()
                {
                    Nombre = "Computos"
                });
                Assert.AreEqual(cate, 1);
            }
        }

        [TestMethod]
        public void BorrarCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                int cate = proxy.BorrarCategoria(new TCategoria()
                {
                    CodCategoria = 1
                });
                Assert.AreNotEqual(cate, 1);
            }
        }

        [TestMethod]
        public void AgregarSubCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                int subCate = proxy.AgregarSubCategoria(new TSubCategoria()
                {
                    Nombre = "Laptop",
                    CodCategoria = 1
                });
                Assert.AreEqual(subCate, 1);
            }
        }

        public void ActualizarSubCategoria()
        {
            using (ServiceShopSoaClient proxy = new ServiceShopSoaClient())
            {
                int subCate = proxy.ActualizarSubCategoria(new TSubCategoria()
                {
                    Nombre = "Laptops",
                    CodCategoria = 1
                });
                Assert.AreEqual(subCate, 1);
            }
        }
    }
}
