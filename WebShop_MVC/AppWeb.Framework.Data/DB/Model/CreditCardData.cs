using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppWeb.Framework.Data.DB.Model
{
    public class CreditCardData
    {
        public string CreditCardType { get; set; }
        public string CardholderName { get; set; }
        public string CardNumber { get; set; }
        public int ExpireMonth { get; set; }
        public int ExpireYear { get; set; }
        public int CardCode { get; set; }
    }
}
