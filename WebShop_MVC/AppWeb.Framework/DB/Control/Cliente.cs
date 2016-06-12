using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppWeb.Framework.DB.Interfaz;
using AppWeb.Framework.DB.Model;

namespace AppWeb.Framework.DB.Control
{
    public class Cliente : IEntidadDB<TCliente>, IDisposable
    {
        public BDWebShopEntities context { get; set; }
        public Cliente()
        {
            context = new BDWebShopEntities();
        }

        public TCliente Create(TCliente entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                context.TCliente.Add(entidad);
                context.SaveChanges();
                return entidad;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool Delete(TCliente entidad)
        {
            bool rt = false;
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                context.TCliente.Remove(entidad);
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

        public IEnumerable<TCliente> GetAll()
        {
            return context.TCliente.ToList();
        }

        public void Update(TCliente entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            context.Entry(entidad).State = System.Data.Entity.EntityState.Modified;
            context.SaveChanges();
        }
    }
}
