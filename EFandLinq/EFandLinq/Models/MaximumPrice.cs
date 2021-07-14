using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EFandLinq.Models
{
    public class MaximumPrice
    {
        public DateTime Date { get; set; }

        public PurchaseOrderDetail Poid { get; set; }

        public decimal? Price { get; set; }
    }
}