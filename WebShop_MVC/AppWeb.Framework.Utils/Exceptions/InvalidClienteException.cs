using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace AppWeb.Framework.Utils.Exceptions
{
    public class InvalidClienteException : Exception, ISerializable
    {
        public InvalidClienteException()
        {

        }

        public InvalidClienteException(string mensaje) : base(mensaje)
        {

        }
    }
}
