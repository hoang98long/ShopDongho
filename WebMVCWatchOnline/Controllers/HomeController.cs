using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using WebMVCWatchOnline.Models.Entities;

namespace WebMVCWatchOnline.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ShopWatchContext shop = new ShopWatchContext();
            var model = shop.ProductCategories.OrderBy(h => h.CategoryID).ToList().Skip(0).Take(5).ToList();

            return View(model);
        }

        public ActionResult ProductDetail(int id)
        {
            ShopWatchContext shop=new ShopWatchContext();
            var model = shop.Products.SingleOrDefault(s => s.ProductID == id);
            var list = shop.Products.Where(s => s.CategoryID == model.CategoryID).ToList();
            var hang= shop.ProductCategories.SingleOrDefault(h => h.CategoryID == model.CategoryID);
            var listhang = shop.ProductCategories.ToList();
            listhang.Remove(hang);
            list.Remove(model);
            ViewBag.LienQuan = list.ToList().Skip(0).Take(6).ToList();
            ViewBag.Hang = listhang.ToList();
            return View(model);
        }


        public IPagedList<NewsFeed> NewsFeedList(int? page)
        {
            ShopWatchContext shop = new ShopWatchContext();
            var tin = shop.NewsFeeds.OrderByDescending(t => t.CreatedDate);
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            tin.ToPagedList(pageNumber, pageSize);
            return tin.ToPagedList(pageNumber, pageSize);
        } 
        public ActionResult NewsFeedDetail(int id)
        {
            ShopWatchContext shop=new ShopWatchContext();
            var model = shop.NewsFeeds.SingleOrDefault(t => t.Id == id);
           
            return View(model);
        }
        public ActionResult Categories()
        {
            ShopWatchContext shop=new ShopWatchContext();
            var model = shop.ProductCategories.ToList();
            return View(model);
        }

        public ActionResult NewsFeed( int?page)
        {
            IPagedList<NewsFeed> model = NewsFeedList(page);
            return View(model);
        }

        public ActionResult CategoryDetail(int id)
        {
            ShopWatchContext shop = new ShopWatchContext();
            var model = shop.ProductCategories.Where(s=>s.CategoryID==id).ToList();
            ViewBag.TenChuyenMuc = model[0].Name;
            return View(model);
        }

        public ActionResult TimKiem(string search,string type/*,int?page*/)
        {
            if (type == "1")
            {
                ViewBag.KQ = search;
                var model = DanhSachTimKiem(search, type);
                return View(model);
            }
            else if (type == "2")
            {
                ViewBag.KQ = search;
                var model = DanhSachTimKiem(search, type);
                return View(model);
            }
            else
            {
                ViewBag.KQ = search;
                var model = DanhSachTimKiem(search, type);
                return View(model);
            }

        }

        public IEnumerable<Product> DanhSachTimKiem(string search, string type)

        {
            if (type == "1")
            {
                ShopWatchContext shop = new ShopWatchContext();
                string name = search.ToLower();
                ProductCategory procate = shop.ProductCategories.Where(z => z.Name == name).FirstOrDefault();
                var model = shop.Products.Where(z=>z.CategoryID == procate.CategoryID);
                return model;
            }
            if(type == "2")
            {
                ShopWatchContext shop = new ShopWatchContext();
                var model = shop.Products.Where(s => s.ProductName.ToLower().Contains(search.ToLower())).OrderByDescending(c => c.ProductID);
                return model;
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                int gia = int.Parse(search);
                var model = shop.Products.Where(z => z.Price <= gia);
                return model;
            }
        }
    }
}