using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppWeb.Framework.Data.DB.Interfaz;
using AppWeb.Framework.Data.DB.Model;

namespace AppWeb.Framework.Data.DB.Control
{
    public class Producto : IEntidadDB<TProducto>
    {
        private BDWebShopEntities context { get; set; }
        public Producto(BDWebShopEntities _context)
        {
            context = _context;
        }

        public TProducto Create(TProducto entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                context.TProducto.Add(entidad);
                return entidad;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public void Delete(TProducto entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                var p = this.Find(entidad.CodProducto);
                if (p != null)
                   context.TProducto.Remove(p);
            }
            catch (Exception e)
            {
                throw new Exception("Entidad tiene referancias : " + e.Message);
            }
        }

        public IEnumerable<TProducto> GetAll()
        {
            return context.TProducto.ToList();
        }

        public void Update(TProducto entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            context.Entry(entidad).State = System.Data.Entity.EntityState.Modified;
        }

        public TProducto Find(params object[] keyValues)
        {
            return context.TProducto.Find(keyValues);
        }
    }
}
