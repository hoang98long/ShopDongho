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
    public class HaController : Controller
    {
        // GET: Product
        private static int cur_id;
        public ActionResult Index(int? page)
        {
            F_Product f = new F_Product();
            var listProducts = f.ListProduct().ToList();
            int pageIndex = 1, pageSize = 10;
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            var model = listProducts.ToPagedList(pageIndex, pageSize);
            return View("/Areas/Views/Product/Index.cshtml", model);
        }

        [HttpGet]
        public ActionResult EditProduct(int id)
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
            return View("/Areas/Views/Product/EditProduc.cshtml", model);
        }

        [HttpPost]
        public ActionResult EditProduct(Product product, string img, HttpPostedFileBase file)
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
            return RedirectToAction("/Areas/Views/Product/Index.cshtml");
        }

        [HttpGet]
        public ActionResult Add()
        {

            return View("/Areas/Views/Product/Add.cshtml");
        }

        [HttpPost]
        public ActionResult Add(Product product, string img, HttpPostedFileBase file)
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
            return RedirectToAction("/Areas/Views/Product/Index.cshtml");
        }




        [HttpGet]
        public ActionResult DeleteProduct(int id)
        {
            ShopWatchContext shop = new ShopWatchContext();
            var model = shop.Products.OrderByDescending(s => s.ProductID).ToList();

            var sanpham = shop.Products.SingleOrDefault(s => s.ProductID == id);
            if (sanpham != null)
            {
                shop.Products.Remove(sanpham);
                shop.SaveChanges();
            }

            return RedirectToAction("/Areas/Views/Product/Index.cshtml");
        }

    }
}
