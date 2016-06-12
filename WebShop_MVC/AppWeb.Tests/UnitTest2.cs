using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using AppWeb.Tests.ShopWS;

namespace AppWeb.Tests
{
    [TestClass]
    public class UnitTest2
    {
        [TestMethod]
        public void AgregarCategoria()
        {
            using (ServiceShopSoaClient proxy  = new ServiceShopSoaClient())
            {
                int cod = proxy.AgregarCategoria(new TCategoria()
                {
                    Nombre = "Prueba2"
                });

                Assert.AreEqual(cod, 1);
            }
        }
    }
}