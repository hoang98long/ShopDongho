using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVCWatchOnline.Models.Entities;
using WebMVCWatchOnline.Models.Functions;

namespace WebMVCWatchOnline.Areas.Admin.Controllers
{
    public class BillController : Controller
    {
        // GET: QLHoaDon

        private static int mahd;
        public ActionResult Index()
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var model = new Donhang()
                {
                    DonHangDaDuyet = shop.Bills.Where(h => h.Status == 1).ToList(),
                    DonHangChuaDuyet = shop.Bills.Where(h => h.Status == 0).ToList()
                };

                return View(model);
            }

        }
    }
}