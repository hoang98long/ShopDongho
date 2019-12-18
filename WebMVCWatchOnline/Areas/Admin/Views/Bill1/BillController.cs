using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVCWatchOnline.Models.Entities;
using WebMVCWatchOnline.Models.Functions;

namespace ShopWatches.Controllers
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
        [HttpGet]
        public ActionResult AddBill()
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                return View();
            }

        }

        [HttpPost]
        public ActionResult AddBill(Bill model)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                Bill hd = new Bill();
                var listBill = shop.Bills.OrderByDescending(p => p.Id).ToList();
                Bill maxId = listBill.FirstOrDefault();
                int id = maxId.Id;
                hd.Id = id + 1;
                hd.Customer_Id = model.Customer_Id;
                hd.Customer_Name = model.Customer_Name;
                hd.TotalMoney = model.TotalMoney;
                hd.Date = model.Date;
                hd.Status = model.Status;
                hd.Address = model.Address;
                hd.Email = model.Email;
                hd.Number_phone = model.Number_phone;
                shop.Bills.Add(hd);
                shop.SaveChanges();
                Response.Redirect("Index");
                return View("Index");
            }

        }
        [HttpGet]
        public ActionResult EditBill(int id)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                mahd = id;
                ShopWatchContext shop = new ShopWatchContext();
                var model = shop.Bills.SingleOrDefault(s => s.Id == id);

                return View(model);
            }

        }
        [HttpPost]
        public ActionResult EditBill(Bill hoaDon)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var hd = shop.Bills.SingleOrDefault(s => s.Id == mahd);
                hd.Customer_Id = hoaDon.Customer_Id;
                hd.Customer_Name = hoaDon.Customer_Name;
                hd.TotalMoney = hoaDon.TotalMoney;
                hd.Date = hoaDon.Date;
                hd.Status = hoaDon.Status;
                hd.Address = hoaDon.Address;
                hd.Email = hoaDon.Email;
                hd.Number_phone = hoaDon.Number_phone;
                shop.SaveChanges();
                var model = shop.Bills.OrderByDescending(s => s.Id).ToList();
                return View("Index", model);
            }

        }


        public ActionResult Delete(int id)
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


                var hd = shop.Bills.SingleOrDefault(s => s.Id == id);
                if (hd != null)
                {
                    foreach (var item in shop.BillDetails.Where(c => c.BillID == id).ToList())
                    {
                        var sp = shop.Products.SingleOrDefault(s => s.ProductID == item.ProductID);
                        sp.Quantity += item.Quantity;
                        shop.BillDetails.Remove(item);
                    }
                    shop.Bills.Remove(hd);
                    shop.SaveChanges();
                }

                return RedirectToAction("Index", model);
            }


        }

        public ActionResult Detail(int id)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                mahd = id;
                ViewBag.mahd = id;
                ShopWatchContext shop = new ShopWatchContext();
                var model = shop.BillDetails.Where(c => c.BillID == mahd).OrderByDescending(c => c.BillID).ToList();
                List<SelectListItem> sanPham = new List<SelectListItem>();
                for (int i = 0; i < shop.Products.ToList().Count; i++)
                {
                    SelectListItem sl = new SelectListItem() { Text = shop.Products.ToList()[i].ProductName, Value = shop.Products.ToList()[i].ProductID.ToString() };
                    sanPham.Add(sl);
                }
                ViewBag.Sp = sanPham;
                return View(model);
            }

        }
        [HttpPost]
        public ActionResult AddDetail(int SanPham, int SoLuong)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var sp = shop.Products.SingleOrDefault(s => s.ProductID == SanPham);
                var hd = shop.Bills.SingleOrDefault(h => h.Id == mahd);
                BillDetail ct = new BillDetail();
                ct.BillID = mahd;
                ct.ProductID = SanPham;
                ct.Quantity = SoLuong;
                ct.TotalMoney = SoLuong * sp.Price;
                shop.BillDetails.Add(ct);
                hd.TotalMoney += ct.TotalMoney;
                shop.SaveChanges();
                return RedirectToAction("Detail", new { id = mahd });
            }

        }
        public ActionResult DeleteDetail(int id)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();

                var ct = shop.BillDetails.SingleOrDefault(s => s.BillID == id);
                var hd = shop.BillDetails.SingleOrDefault(h => h.BillID == mahd);
                if (ct != null)
                {
                    shop.BillDetails.Remove(ct);
                    hd.TotalMoney -= ct.TotalMoney;
                    shop.SaveChanges();
                }

                return RedirectToAction("Detail", new { id = mahd });

            }

        }
        //[HttpPost]
        //public ActionResult ThemChiTietHd(ChiTietHoaDon model)
        //{
        //    ShopWatchesEntities shop=new ShopWatchesEntities();

        //    return View();
        //}
        [HttpPost]
        public ActionResult EditDetail(int id, int soLuong)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var ct = shop.BillDetails.SingleOrDefault(c => c.BillID == id);

                ct.TotalMoney += (soLuong * shop.Products.Where(h=>h.ProductID == id).FirstOrDefault().Price) - ct.TotalMoney;
                ct.Quantity = soLuong;
                shop.SaveChanges();
                return this.Json(new { data = true }, JsonRequestBehavior.AllowGet); ;
            }

        }
        public ActionResult ConfirmDetail()
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var model = shop.Bills.Where(h => h.Status == 0).ToList();
                return View(model);
            }

        }

        public ActionResult Duyet(int id)
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


                var hd = shop.Bills.SingleOrDefault(h => h.Id == id);
                hd.Status = 1;

                var listChiTiet = shop.BillDetails.Where(c => c.BillID == id).ToList();
                foreach (var item in listChiTiet)
                {
                    var sp = shop.Products.SingleOrDefault(s => s.ProductID == item.ProductID);
                    if (sp.Quantity > item.Quantity)
                    {
                        sp.Quantity -= item.Quantity;
                    }

                }
                shop.SaveChanges();
                return RedirectToAction("Index", model);
            }

        }
    }
}