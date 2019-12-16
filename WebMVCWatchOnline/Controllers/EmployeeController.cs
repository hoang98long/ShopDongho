using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVCWatchOnline.Models.Entities;
namespace WebMVCWatchOnline.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            if (Session["Id"] == null)
            {
                return RedirectToAction("LogIn", "Employee");
            }
            else
            {
                return View();
            }

        }
        [HttpGet]
        public ActionResult LogIn()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LogIn(User_ tk)
        {

            ShopWatchContext shop = new ShopWatchContext();
            var taikhoan = shop.User_.Where((z => z.UserName.ToLower() == tk.UserName.ToLower())).Where(z => z.Password.ToLower() == tk.Password.ToLower()).FirstOrDefault();

            //shop.TaiKhoans.SingleOrDefault(t => t.TenTaiKhoan.ToLower() == tk.TenTaiKhoan.ToLower() && t.MatKhau.ToLower() == tk.MatKhau.ToLower());
            if (ModelState.IsValid)
            {
                if (taikhoan != null)
                {
                    if (taikhoan.Group_ID == 2)
                    {
                        Session["MaTk"] = taikhoan.Id;
                        Session["TenTk"] = taikhoan.UserName;
                        return Redirect("/Views/Employee/Index");
                    }
                    else
                    {
                        return Redirect("/Home/Index");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không đúng");
                }
            }
            return View();

        }

        public ActionResult ForgetPassword()
        {
            return View();
        }
        public ActionResult DangXuat()
        {
            Session["MaTk"] = null;
            Session["TenTk"] = null;
            return View("LogIn");
        }
    }
}