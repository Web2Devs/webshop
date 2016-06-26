using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppWeb.Framework.Data.DB.Interfaz;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.Framework.Data.DB.Control
{
    public class SubCategoria : IEntidadDB<TSubCategoria>
    {
        private BDWebShopEntities context { get; set; }
        public SubCategoria(BDWebShopEntities _context)
        {
            context = _context;
        }

        public TSubCategoria Create(TSubCategoria entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                context.TSubCategoria.Add(entidad);
                return entidad;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public void Delete(TSubCategoria entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                var p = this.Find(entidad.CodSubCategoria, entidad.CodCategoria);
                if (p != null)
                    context.TSubCategoria.Remove(p);
            }
            catch (Exception e)
            {
                throw new Exception("Entidad tiene referancias : " + e.Message);
            }
        }

        public IEnumerable<TSubCategoria> GetAll()
        {
            return context.TSubCategoria.ToList();
        }

        public void Update(TSubCategoria entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            context.Entry(entidad).State = System.Data.Entity.EntityState.Modified;
        }

        public TSubCategoria Find(params object[] keyValues)
        {
            return context.TSubCategoria.Find(keyValues);
        }
    }
}
