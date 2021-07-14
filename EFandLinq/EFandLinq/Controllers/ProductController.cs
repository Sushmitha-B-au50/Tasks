using EFandLinq.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EFandLinq.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            using (ProductsEntities db = new ProductsEntities())
            {
                List<Product> products = db.Products.ToList();
                List<Customer> customers = db.Customers.ToList();
                List<PurchaseOrder> purchaseOrders = db.PurchaseOrders.ToList();
                List<PurchaseOrderDetail> purchaseOrderDetails = db.PurchaseOrderDetails.ToList();


                var PurchaseList = from c in customers
                                   join po in purchaseOrders on c.CustomerID equals po.CustomerID into table1
                                   from po in table1.ToList()
                                   join pod in purchaseOrderDetails on po.POID equals pod.POID into table2
                                   from pod in table2.ToList()
                                   join p in products on pod.ProductID equals p.ProductID into table3
                                   from p in table3.ToList()

                                   select new ViewModel
                                   {
                                      customer=c,
                                       product=p,
                                       purchaseorder=po,
                                       purchaseorderdetail=pod

                                   };
                return View(PurchaseList);
            }
        }

        public ActionResult CustomerReport()
        {
            using (ProductsEntities db = new ProductsEntities())
            {
               
                List<Customer> customers = db.Customers.ToList();
                List<PurchaseOrder> purchaseOrders = db.PurchaseOrders.ToList();


                var CustomerReport = from c in customers
                                     join po in purchaseOrders on c.CustomerID equals po.CustomerID into table1
                                     from po in table1.ToList()
                                     select new ViewModel
                                     {
                                          purchaseorder= po,
                                          customer=c

                                   };
                return View(CustomerReport);
            }
        }

        public ActionResult Productsales()
        {
            using (ProductsEntities db = new ProductsEntities())
            {

                List<Product> products = db.Products.ToList();
                List<PurchaseOrder> purchaseOrders = db.PurchaseOrders.ToList();
                List<PurchaseOrderDetail> purchaseOrderDetails = db.PurchaseOrderDetails.ToList();


                var salesreport = from po in purchaseOrders
                                     join pod in purchaseOrderDetails on po.POID equals pod.POID into table1
                                     from pod in table1.ToList()
                                     join p in products on pod.ProductID equals p.ProductID into table2
                                     from p in table2.ToList()
                                     orderby p.Name ascending
                                  select new ViewModel
                                     {
                                       product = p,
                                       purchaseorder = po,
                                       purchaseorderdetail = pod
                                   };
                return View(salesreport);
            }
        }

        public ActionResult MaxOrder()
        {
            using (ProductsEntities db = new ProductsEntities())
            {

                List<PurchaseOrder> purchaseOrders = db.PurchaseOrders.ToList();
                List<PurchaseOrderDetail> purchaseOrderDetails = db.PurchaseOrderDetails.ToList();


                var orderreport = from po in purchaseOrders
                                  join pod in purchaseOrderDetails on po.POID equals pod.POID
                                  group new { po, pod } by new { po.Date.Value.Month}
                                  into table1
                                  let productsales = table1.FirstOrDefault()
                                  let DOP = productsales.po
                                  let POID = productsales.pod
                                  let MaxPrice = table1.Max(m => m.pod.Price)
                                  select new MaximumPrice
                                  {
                                      Date = (DateTime)DOP.Date,
                                      Poid = POID,
                                      Price = MaxPrice

                                  };


                return View(orderreport);
            }
        }


    }
}