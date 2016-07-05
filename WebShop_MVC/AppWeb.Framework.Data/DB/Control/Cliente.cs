using System;
using System.Collections.Generic;
using System.Data.Entity;
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
        private BDWebShopSQL context { get; set; }
        private IDbSet<TCliente> _dbSet;
        public Cliente(BDWebShopSQL _context)
        {
            context = _context;
            _dbSet = context.Set<TCliente>();
        }

        public TCliente Create(TCliente entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                return _dbSet.Add(entidad);
            }
            catch (Exception e)
            {
                throw e;
            }
        }

        public TCliente Validar(string usuario, string password)
        {
            try
            {
                var ud = _dbSet.Where(x => x.Usuario.Equals(usuario));
                if (ud == null)
                {
                    throw new InvalidClienteException("Usuario no existe");
                }

                var user = ud.FirstOrDefault<TCliente>();
                if (user.Contrasena.Equals(password))
                {
                    return user;
                } else
                {
                    throw new InvalidPassswordException("Password Incorrecto");
                }
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public void Delete(TCliente entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            try
            {
                var p = this.Find(entidad.CodCliente);
                if (p != null)
                    _dbSet.Remove(p);
            }
            catch (Exception e)
            {
                throw new Exception("Entidad tiene referancias : " + e.Message);
            }
        }

        public IEnumerable<TCliente> GetAll()
        {
            return _dbSet.ToList();
        }

        public void Update(TCliente entidad)
        {
            if (entidad == null) throw new ArgumentNullException("entidad");
            _dbSet.Attach(entidad);
            context.Entry(entidad).State = EntityState.Modified;
        }

        public TCliente Find(params object[] keyValues)
        {
            return _dbSet.Find(keyValues);
        }
    }
}
