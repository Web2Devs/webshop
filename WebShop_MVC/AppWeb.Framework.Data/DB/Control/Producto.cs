using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppWeb.Framework.Data.DB.Interfaz;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.Framework.Data.DB.Control
{
    public class Producto : IEntidadDB<TProducto>, IDisposable
    {
        public BDWebShopEntities context { get; set; }
        public Producto()
        {
            context = new BDWebShopEntities();
        }

        public TProducto Create(TProducto entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                context.TProducto.Add(entidad);
                context.SaveChanges();
                return entidad;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool Delete(TProducto entidad)
        {
            bool rt = false;
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                var p = context.TProducto.SingleOrDefault(x => x.CodProducto == entidad.CodProducto);
                if (p == null)
                    return rt;

                context.TProducto.Remove(p);
                if (context.SaveChanges() > 0)
                    rt = true;
            }
            catch (Exception e)
            {
                throw new Exception("Entidad tiene referancias : " + e.Message);
            }
            return rt;
        }

        public void Dispose()
        {
            context.Dispose();
        }

        public IEnumerable<TProducto> GetAll()
        {
            return context.TProducto.ToList();
        }

        public void Update(TProducto entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            context.Entry(entidad).State = System.Data.Entity.EntityState.Modified;
            context.SaveChanges();
        }
    }
}
