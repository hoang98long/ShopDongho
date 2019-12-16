using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVCWatchOnline.Models.Entities;
namespace WebMVCWatchOnline.Controllers
{
    public class Home1Controller : Controller
    {
        // GET: Home1
        public ActionResult Index()
        {
            ShopWatchContext shop = new ShopWatchContext();
            var model = shop.ProductCategories.OrderBy(h => h.CategoryID).ToList().Skip(0).Take(5).ToList();
            return View(model);
        }
        public ActionResult ProductDetail(int id)
        {
            ShopWatchContext shop = new ShopWatchContext();
            var model = shop.Products.SingleOrDefault(s => s.ProductID == id);
            var list = shop.Products.Where(s => s.CategoryID == model.CategoryID).ToList();
            var hang = shop.ProductCategories.SingleOrDefault(h => h.CategoryID == model.CategoryID);
            var listhang = shop.ProductCategories.ToList();
            listhang.Remove(hang);
            list.Remove(model);
            ViewBag.LienQuan = list.ToList().Skip(0).Take(6).ToList();
            ViewBag.Hang = listhang.ToList();
            return View(model);
        }
    }
}