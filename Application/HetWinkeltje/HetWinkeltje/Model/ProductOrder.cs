using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HetWinkeltje.Model
{
    class ProductOrder
    {
        public Product product { get; set; }
        public Order Order { get; set; }
        public int Amount { get; set; }
    }
}
