﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVCWatchOnline.Models.Entities;
using WebMVCWatchOnline.Models.Functions;

namespace WebMVCWatchOnline.Controllers
{
    public class AccountController : Controller
    {
        // GET: QLTaiKhoan
        private static int matk;
        public ActionResult Index()
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Admin1");
            }
            else
            {
                ShopWatchContext shop = new ShopWatchContext();
                var model = shop.User_.ToList();
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
                var listUser  = shop.User_.OrderByDescending(p => p.Id).ToList();
                User_ maxId = listUser.FirstOrDefault();
                int id = maxId.Id;
                tk.Id = id + 1;
                tk.Name = model.Name;
                tk.Email = model.Email;
                tk.UserName = model.UserName;
                tk.Password = model.Password;
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