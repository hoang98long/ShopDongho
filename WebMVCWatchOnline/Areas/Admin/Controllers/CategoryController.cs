using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using WebMVCWatchOnline.Models.Entities;
using WebMVCWatchOnline.Models.Functions;


namespace WebMVCWatchOnline.Controllers
{
    public class CategoryController : Controller
    {
        // GET: QLHang
        private static int mahang;
        public ActionResult Index()
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var model = shop.ProductCategories.ToList();
                return View(model);
            }


        }
        [HttpGet]
        public ActionResult AddCate()
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
        public ActionResult AddCate(ProductCategory model)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                ProductCategory cate = new ProductCategory();
                cate.Name = model.Name;

                shop.ProductCategories.Add(cate);
                shop.SaveChanges();
                Response.Redirect("Index");
                return View("Index");
            }

        }
        [HttpGet]
        public ActionResult EditCate(int id)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                mahang = id;
                ShopWatchContext shop = new ShopWatchContext();
                var model = shop.ProductCategories.SingleOrDefault(s => s.CategoryID == id);

                return View(model);
            }


        }
        [HttpPost]
        public ActionResult EditCate(ProductCategory cate)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var hang = shop.ProductCategories.SingleOrDefault(s => s.CategoryID == mahang);
                hang.Name = cate.Name;

                shop.SaveChanges();
                var model = shop.ProductCategories.OrderByDescending(s => s.CategoryID).ToList();
                return View("Index", model);
            }

        }


        [HttpGet]
        public ActionResult DeleteCategory(int id)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var model = shop.ProductCategories.OrderByDescending(s => s.CategoryID).ToList();

                var hang = shop.ProductCategories.SingleOrDefault(s => s.CategoryID == id);
                if (hang != null)
                {
                    shop.ProductCategories.Remove(hang);
                    shop.SaveChanges();
                }

                return RedirectToAction("Index");
            }
        }

    }
 }
