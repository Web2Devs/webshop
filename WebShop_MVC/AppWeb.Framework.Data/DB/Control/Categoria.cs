using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppWeb.Framework.Data.DB.Interfaz;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.Framework.Data.DB.Control
{
    public class Categoria : IEntidadDB<TCategoria>, IDisposable
    {
        public BDWebShopEntities context { get; set; }
        public Categoria()
        {
            context = new BDWebShopEntities();
        }

        public TCategoria Create(TCategoria entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                context.TCategoria.Add(entidad);
                context.SaveChanges();
                return entidad;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public void Update(TCategoria entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            context.Entry(entidad).State = System.Data.Entity.EntityState.Modified;
            context.SaveChanges();
        }

        public bool Delete(TCategoria entidad)
        {
            bool rt = false;
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                var p = context.TCategoria.SingleOrDefault(x => x.CodCategoria == entidad.CodCategoria);
                if (p == null)
                    return rt;

                context.TCategoria.Remove(p);
                if (context.SaveChanges() > 0)
                    rt = true;
            }
            catch (Exception e)
            {
                throw new Exception("Entidad tiene referancias : " + e.Message);
            }
            return rt;
        }

        public IEnumerable<TCategoria> GetAll()
        {
            return context.TCategoria.ToList();
        }

        public void Dispose()
        {
            context.Dispose();
        }
    }
}
