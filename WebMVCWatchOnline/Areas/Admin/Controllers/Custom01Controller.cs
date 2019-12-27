using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using WebMVCWatchOnline.Models.Entities;

namespace WebMVCWatchOnline.Areas.Admin.Controllers
{
    public class Custom01Controller : Controller
    {
        // GET: Admin/Custom01
        public ActionResult Index()
        {
            ShopWatchContext shop = new ShopWatchContext();
            var listProduct = shop.Products.ToList().ToPagedList(1, 10);
            return View(listProduct);
        }

        [HttpGet]
        public ActionResult EditProduct(int id)
        {
            ShopWatchContext shop = new ShopWatchContext();
            Product model = shop.Products.Find(id);
            return View(model);
        }

        [HttpPost]
        public ActionResult EditProduct(Product product)
        {
            return RedirectToAction("Index");

        }
    }
}