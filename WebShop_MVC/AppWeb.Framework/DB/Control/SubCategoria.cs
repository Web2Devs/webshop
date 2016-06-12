using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppWeb.Framework.DB.Interfaz;
using AppWeb.Framework.DB.Model;

namespace AppWeb.Framework.DB.Control
{
    public class SubCategoria : IEntidadDB<TSubCategoria>, IDisposable
    {
        public BDWebShopEntities context { get; set; }
        public SubCategoria()
        {
            context = new BDWebShopEntities();
        }

        public TSubCategoria Create(TSubCategoria entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                context.TSubCategoria.Add(entidad);
                context.SaveChanges();
                return entidad;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool Delete(TSubCategoria entidad)
        {
            bool rt = false;
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                context.TSubCategoria.Remove(entidad);
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

        public IEnumerable<TSubCategoria> GetAll()
        {
            return context.TSubCategoria.ToList();
        }

        public void Update(TSubCategoria entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            context.Entry(entidad).State = System.Data.Entity.EntityState.Modified;
            context.SaveChanges();
        }
    }
}
