using System;
using System.ServiceModel;
using AppWeb.Framework.DB.Control;
using AppWeb.Framework.DB.Model;

namespace AppWeb.Servicios
{
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.PerSession)]
    public class ServiceShopSoa : IServiceShopSoa
    {
        private Categoria cateDao = new Categoria();
        /// <summary>
        /// Agregar nueva Categoria
        /// </summary>
        /// <param name="categoria"></param>
        /// <returns>int codigo</returns>
        public int AgregarCategoria(TCategoria categoria)
        {
            using (Categoria cate = new Categoria())
            {
                cate.Create(categoria);
                return categoria.CodCategoria;
            }
        }

        public int AgregarCliente(TCliente cliente)
        {
            return 1;
        }

        public int AgregarProducto(TProducto producto)
        {
            return 1;
        }

        public int AgregarSubCategoria(TSubCategoria subCategoria)
        {
            return 1;
        }
    }
}
