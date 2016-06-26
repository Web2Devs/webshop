using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AppWeb.Framework.Data.DB.Interfaz;
using AppWeb.Framework.Data.DB.Model;
using AppWeb.Framework.Utils.Exceptions;

namespace AppWeb.Framework.Data.DB.Control
{
    public class Cliente : IEntidadDB<TCliente>
    {
        private BDWebShopEntities context { get; set; }
        public Cliente(BDWebShopEntities _context)
        {
            context = _context;
        }

        public TCliente Create(TCliente entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                context.TCliente.Add(entidad);
                return entidad;
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public bool Validar(string usuario, string password)
        {
            try
            {
                var ud = context.TCliente.Where(x => x.Usuario.Equals(usuario));
                if (ud == null)
                    throw new InvalidClienteException("Usuario no existe");

                var user = ud.FirstOrDefault<TCliente>();
                if (user.Contrasena.Equals(password))
                {
                    return true;
                } else
                {
                    throw new InvalidPassswordException("Password Incorrecto");
                }
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public void Delete(TCliente entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                var p = this.Find(entidad.CodCliente);
                if (p != null)
                    context.TCliente.Remove(p);
            }
            catch (Exception e)
            {
                throw new Exception("Entidad tiene referancias : " + e.Message);
            }
        }

        public IEnumerable<TCliente> GetAll()
        {
            return context.TCliente.ToList();
        }

        public void Update(TCliente entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            context.Entry(entidad).State = System.Data.Entity.EntityState.Modified;
        }

        public TCliente Find(params object[] keyValues)
        {
            return context.TCliente.Find(keyValues);
        }
    }
}
