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
    public class DangkiController : Controller
    {
        // GET: Dangki
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult dangki()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult dangki(User_ model, HttpPostedFileBase file)
        {

            ShopWatchContext shop = new ShopWatchContext();
            var listID = shop.User_.OrderByDescending(p => p.Id).ToList();
            User_ maxId = listID.FirstOrDefault();
            int id = maxId.Id;
            file = file ?? Request.Files["file"];
            if (file != null && file.ContentLength > 0)
            {
                var fileName = Path.GetFileName(file.FileName);
                if (fileName != null)
                {
                    
                    User_ sp = new User_();

                    sp.Id = id + 1;
                    sp.Name = model.Name;
                    sp.Email = model.Email;
                    sp.UserName = model.UserName;
                    sp.Password = model.Password;
                  
                    shop.User_.Add(sp);
                    shop.SaveChanges();
                    Response.Redirect("Index");
                }
            }
            else
            {


                User_ sp = new User_();
                sp.Id = id + 1;
                sp.Name = model.Name;
                sp.Email = model.Email;
                sp.UserName = model.UserName;
                sp.Password = model.Password;
                
                shop.User_.Add(sp);
                shop.SaveChanges();
                Response.Redirect("Index");
            }

    
            return View("Index", shop);
        }
    }
}