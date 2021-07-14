using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EFandLinq.Models
{
    public class ViewModel
    {
        public Customer customer { get; set; }
        public Product product { get; set; }
        public PurchaseOrder purchaseorder { get; set; }

        public PurchaseOrderDetail purchaseorderdetail { get; set; }
    }
}