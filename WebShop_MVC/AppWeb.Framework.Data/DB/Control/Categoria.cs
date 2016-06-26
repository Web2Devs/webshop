using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppWeb.Framework.Data.DB.Interfaz;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.Framework.Data.DB.Control
{
    public class Categoria : IEntidadDB<TCategoria>
    {
        private BDWebShopEntities context { get; set; }
        public Categoria(BDWebShopEntities _context)
        {
            context = _context;
        }

        public TCategoria Create(TCategoria entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                context.TCategoria.Add(entidad);
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
        }

        public void Delete(TCategoria entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                var p = context.TCategoria.SingleOrDefault(x => x.CodCategoria == entidad.CodCategoria);
                if (p != null)
                    context.TCategoria.Remove(p);
            }
            catch (Exception e)
            {
                throw new Exception("Entidad tiene referancias : " + e.Message);
            }
        }

        public IEnumerable<TCategoria> GetAll()
        {
            return context.TCategoria.ToList();
        }

        public TCategoria Find(params object[] keyValues)
        {
            return context.TCategoria.Find(keyValues);
        }
    }
}
