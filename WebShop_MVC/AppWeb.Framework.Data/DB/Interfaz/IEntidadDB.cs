using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppWeb.Framework.Data.DB.Interfaz
{
    public interface IEntidadDB<T>
    {
        T Create(T entidad);
        void Update(T entidad);
        void Delete(T entidad);
        T Find(params object[] keyValues);
        IEnumerable<T> GetAll();
    }
}
