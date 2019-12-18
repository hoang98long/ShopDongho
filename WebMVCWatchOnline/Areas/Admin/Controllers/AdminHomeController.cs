using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVCWatchOnline.Models;
using WebMVCWatchOnline.Models.Entities;
using WebMVCWatchOnline.Models.Functions;

namespace WebMVCWatchOnline.Areas.Admin.Controllers
{
    public class AdminHomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            //ShopWatchContext context = new ShopWatchContext();
            //var model = context.Products.OrderBy(p => p.ProductID).ToList();
            return View();
        }

        public ActionResult Logout()
        {
            Session["Id"] = null;
            Session["Username"] = null;

//            return RedirectToAction("Index", "Home", new {area = ""});
            return Redirect("~/Admin1/Index");
        }

        [HttpPost]
        public ActionResult DeleteProduct(int id)
        {
            F_Product f = new F_Product();
            f.Delete(id);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult DeleteCate(int id)
        {
            F_Category f = new F_Category();
            f.Delete(id);
            return RedirectToAction("Index");
        }
    }
}