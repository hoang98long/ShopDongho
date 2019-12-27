using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using WebMVCWatchOnline.Models.Entities;
using WebMVCWatchOnline.Models.Functions;

namespace WebMVCWatchOnline.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        private static int cur_id;
        public ActionResult Index(int? page)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                F_Product f = new F_Product();
                var listProducts = f.ListProduct().ToList();
                int pageIndex = 1, pageSize = 10;
                pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
                var model = listProducts.ToPagedList(pageIndex, pageSize);
                return View(model);
            }
        }

        [HttpGet]
        public ActionResult EditProduct(int id)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                cur_id = id;
                ShopWatchContext context = new ShopWatchContext();
                var categories = context.ProductCategories.OrderByDescending(p => p.CategoryID).ToList();
                List<SelectListItem> lCategory = categories.Select(t => new SelectListItem() { Text = t.Name, Value = t.CategoryID.ToString() }).ToList();
                ViewBag.ListCategory = lCategory;

                F_Product f = new F_Product();
                var model = f.FindEntities(id);
                var temp = model.ProductID;
                var temp1 = model.ProductName;
                Session["Ngaydang"] = model.CreatedDate;
                return View(model);
            }
        }

        [HttpPost]
        public ActionResult EditProduct(Product product, string img, HttpPostedFileBase file)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext context = new ShopWatchContext();
                var categories = context.ProductCategories.OrderByDescending(p => p.CategoryID).ToList();
                List<SelectListItem> lCategory = categories.Select(t => new SelectListItem() { Text = t.Name, Value = t.CategoryID.ToString() }).ToList();
                ViewBag.ListCategory = lCategory;

                F_Product f = new F_Product();
                product.ProductID = cur_id;
                product.CreatedDate = System.DateTime.Parse(Session["Ngaydang"].ToString());
                if (file != null && file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    if (fileName != null)
                    {
                        var path = Path.Combine(Server.MapPath("~/images/products/"), fileName);
                        file.SaveAs(path);
                        product.ProductImage = "/images/products/" + fileName;
                    }
                }
                else
                {
                    product.ProductImage = img;
                }
                f.Update(product);
                return RedirectToAction("Index");
            }
        }

        [HttpGet]
        public ActionResult Add()
        {

            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var listHang = shop.ProductCategories.OrderByDescending(p => p.CategoryID).ToList();
                List<SelectListItem> slSanPham = listHang.Select(t => new SelectListItem() { Text = t.Name, Value = t.CategoryID.ToString() }).ToList();

                ViewBag.Hang = slSanPham;
                return View();
            }

        }
        /*
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(Product product , HttpPostedFileBase file)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                file = file ?? Request.Files["file"];
                if (file != null && file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    if (fileName != null)
                    {
                        var path = Path.Combine(Server.MapPath("~/images/products/"), fileName);
                        file.SaveAs(path);
                        F_Product t = new F_Product();
                        t.Insert(product);
                        Response.Redirect("Index");
                    }
                }
                else
                {
                    F_Product f = new F_Product();
                    f.Insert(product);
                    Response.Redirect("Index");
                }

                return View("Index");
            }
        }
        */


        [HttpGet]
        public ActionResult DeleteProduct(int id)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var model = shop.Products.OrderByDescending(s => s.ProductID).ToList();

                var sanpham = shop.Products.SingleOrDefault(s => s.ProductID == id);
                if (sanpham != null)
                {
                    shop.Products.Remove(sanpham);
                    shop.SaveChanges();
                }

                return RedirectToAction("Index");
            }
        }

        /*[HttpGet]
        public ActionResult Add()
        {

            ShopWatchContext shop = new ShopWatchContext();
            var listHang = shop.ProductCategories.OrderByDescending(p => p.CategoryID).ToList();
            List<SelectListItem> slSanPham = listHang.Select(t => new SelectListItem() { Text = t.Name, Value = t.CategoryID.ToString() }).ToList();

            ViewBag.Hang = slSanPham;
            return View();



        }
        */
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Add(Product model, HttpPostedFileBase file)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var listHang = shop.Products.OrderByDescending(p => p.ProductID).ToList();
                Product maxId = listHang.FirstOrDefault();
                int id = maxId.ProductID;
                file = file ?? Request.Files["file"];
                if (file != null && file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    if (fileName != null)
                    {
                        var path = Path.Combine(Server.MapPath("~/images/products/"), fileName);
                        file.SaveAs(path);
                        Product sp = new Product();

                        sp.ProductID = id + 1;
                        sp.ProductName = model.ProductName;
                        sp.CategoryID = model.CategoryID;
                        sp.Quantity = model.Quantity;
                        sp.PromotionPrice = model.PromotionPrice;
                        sp.Price = model.Price;
                        sp.ProductImage = "/images/products/" + fileName;


                        sp.Description = model.Description;
                        sp.Detail = model.Detail;

                        sp.CreatedDate = DateTime.Now;
                        shop.Products.Add(sp);
                        shop.SaveChanges();
                        Response.Redirect("Index");
                    }
                }
                else
                {


                    Product sp = new Product();
                    sp.ProductID = id + 1;
                    sp.ProductName = model.ProductName;
                    sp.CategoryID = model.CategoryID;
                    sp.Quantity = model.Quantity;
                    sp.PromotionPrice = model.PromotionPrice;
                    sp.Price = model.Price;
                    sp.ProductImage = "~/images/p-8.png";


                    sp.Description = model.Description;

                    sp.Detail = model.Detail;
                    sp.CreatedDate = DateTime.Now;
                    shop.Products.Add(sp);
                    shop.SaveChanges();
                    Response.Redirect("Index");
                }


                return View("Index", shop.Products.ToList().ToPagedList(10, 1));
            }
        }
    }
}
