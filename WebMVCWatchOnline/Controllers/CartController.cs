using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using WebMVCWatchOnline.Models.Entities;
using WebMVCWatchOnline.Models.Functions;
namespace WebMVCWatchOnline.Controllers
{
    public class CartController : Controller
    {
        public ActionResult DeleteProduct(int id)
        {
            F_Cart objCart = (F_Cart)Session["Cart"];
            if (objCart != null)
            {
                objCart.DeleteProduct(id);

                Session["Cart"] = objCart;
            }
            return RedirectToAction("Index");
        }
        // thêm vào giỏ hàng 1 sản phẩm có id = id của sản phẩm
        [HttpPost]
        public ActionResult AddToCart(int id, int soLuong)
        {
                ShopWatchContext db = new ShopWatchContext();
                var p = db.Products.SingleOrDefault(s => s.ProductID.Equals(id));
                if (Session["Id"] == null)
                {
//                    return RedirectToAction("Index", "Admin1");
                    JsonSerializerSettings jsss = new JsonSerializerSettings { ReferenceLoopHandling = ReferenceLoopHandling.Ignore };
                    var resultt = JsonConvert.SerializeObject("Bạn chưa đăng nhập hoặc đăng ký", Formatting.Indented, jsss);
                    Session["IdWaiting"] = id;
                    Session["NumWaiting"] = soLuong;
                    return this.Json(resultt, JsonRequestBehavior.AllowGet); ;
                }
                
                if (p != null)
                {
                    F_Cart objCart = (F_Cart)Session["Cart"];
                    if (objCart == null)
                    {
                        objCart = new F_Cart();
                    }
                    F_Cart.CartItem item = new F_Cart.CartItem()
                    {
                        Image = p.ProductImage,
                        ProductName = p.ProductName,
                        ProductId = p.ProductID,
                        Quantity = soLuong,
                        Price = p.Price.ToString(),

                        Amount = Convert.ToDouble(p.Price.ToString().Trim().Replace(",", string.Empty).Replace(".", string.Empty)) * soLuong
                    };
                    objCart.Addtocart(item);
                    Session["Cart"] = objCart;
                }
                JsonSerializerSettings jss = new JsonSerializerSettings { ReferenceLoopHandling = ReferenceLoopHandling.Ignore };
                var result = JsonConvert.SerializeObject("Thêm thành công", Formatting.Indented, jss);
                return this.Json(result, JsonRequestBehavior.AllowGet); ;
            
        }
        // cập nhật giỏ hàng theo loại sản phẩm và số lượng
        public ActionResult UpdateQuantity(string ProductID, int soLuong)
        {
            int id = Convert.ToInt32(ProductID.Substring(7, ProductID.Length - 7));
            F_Cart objCart = (F_Cart)Session["Cart"];
            if (objCart != null)
            {
                objCart.UpdateQuantity(id, soLuong);
                Session["Cart"] = objCart;
            }
            return RedirectToAction("index");
        }
        // giỏ hàng mặc định, nếu session = null thì hiện không có hàng trong giỏ, nếu có thì trả lại list các sản phẩm
        //[HttpGet]
        public ActionResult Index()
        {
            ViewBag.Title = "Giỏ hàng";
            CartViewModel model = new CartViewModel();
            model.F_Cart = (F_Cart)Session["Cart"];
            return View(model);
        }
        [HttpPost]
        public ActionResult Pay(Bill hoadon)
        {
            ShopWatchContext shop = new ShopWatchContext();
            CartViewModel model = new CartViewModel();
            model.F_Cart = (F_Cart)Session["Cart"];
            decimal tong = model.F_Cart.CartList.Sum(item => decimal.Parse(item.Price) * item.Quantity);
            Bill hd = new Bill();
            //Customer newcs = shop.Customers.Where(z => z.Id == hd.Customer_Id).FirstOrDefault();
            var listID = shop.Bills.OrderByDescending(p => p.Id).ToList();
            Bill maxId = listID.FirstOrDefault();
            int id = maxId.Id;
            hd.Id = id + 1;
            hd.Customer_Id = hoadon.Customer_Id;
            hd.TotalMoney = tong;
            hd.Date = hoadon.Date;
            hd.Status = hoadon.Status;
            hd.Email = hoadon.Email;
            hd.Number_phone = hoadon.Number_phone;
            hd.Customer_Name = hoadon.Customer_Name;

            shop.Bills.Add(hd);
            shop.SaveChanges();

            var hoaDon = (from h in shop.Bills orderby h.Id descending select h).FirstOrDefault();
            foreach (var item in model.F_Cart.CartList)
            {

                BillDetail ct = new BillDetail();
                ct.BillID = hoaDon.Id;
                ct.ProductID = item.ProductId;
                ct.Quantity = item.Quantity;
                ct.TotalMoney = int.Parse(item.Price.ToString(CultureInfo.InvariantCulture));
                shop.BillDetails.Add(ct);
                shop.SaveChanges();
            }
            model.F_Cart.CartList.Clear();
            return View();
        }

        public ActionResult FillInfo()
        {
            ShopWatchContext context = new ShopWatchContext();
            var customer = context.User_.Where(h=>h.Group_ID == 3).OrderByDescending(p => p.Id).ToList();
            List<SelectListItem> lKH = customer.Select(t => new SelectListItem() { Text = t.Id.ToString(), Value = t.Id.ToString() }).ToList();
            ViewBag.ListCustomer = lKH;
            return View();
        }

    }
}