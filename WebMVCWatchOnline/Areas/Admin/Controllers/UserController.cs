using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using WebMVCWatchOnline.Models.Entities;

namespace WebMVCWatchOnline.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        private static int matk;
        // GET: Admin/User
        public ActionResult Index(int? page)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var user = shop.User_.ToList();
                int pageIndex = 1, pageSize = 10;
                pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
                var model = user.ToPagedList(pageIndex, pageSize);
                return View(model);
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
                return View();
            }

        }

        [HttpPost]
        public ActionResult Add(User_ model)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                User_ tk = new User_();
                var listUser = shop.User_.OrderByDescending(p => p.Id).ToList();
                User_ maxId = listUser.FirstOrDefault();
                int id = maxId.Id;
                tk.Id = id + 1;
                tk.Name = model.Name;
                tk.Email = model.Email;
                tk.UserName = model.UserName;
                tk.Password = model.Password;
                tk.Group_ID = model.Group_ID;
                shop.User_.Add(tk);
                shop.SaveChanges();
                Response.Redirect("Index");
                return View("Index");
            }

        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                matk = id;
                ShopWatchContext shop = new ShopWatchContext();
                var model = shop.User_.SingleOrDefault(s => s.Id == id);

                return View(model);
            }

        }
        [HttpPost]
        public ActionResult Edit(User_ taiKhoan)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var tk = shop.User_.SingleOrDefault(s => s.Id == matk);
                tk.Name = taiKhoan.Name;
                tk.Email = taiKhoan.Email;
                tk.UserName = taiKhoan.UserName;
                tk.Password = taiKhoan.Password;
                tk.Group_ID = taiKhoan.Group_ID;
                shop.SaveChanges();
                var model = shop.User_.OrderByDescending(s => s.Id).ToList();
                return View("Index", model);
            }

        }


        [HttpGet]
        public ActionResult Delete(int id)
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var model = shop.User_.OrderByDescending(s => s.Id).ToList();

                var tk = shop.User_.SingleOrDefault(s => s.Id == id);
                if (tk != null)
                {
                    shop.User_.Remove(tk);
                    shop.SaveChanges();
                }

                return RedirectToAction("Index");
            }
        }

    }
}