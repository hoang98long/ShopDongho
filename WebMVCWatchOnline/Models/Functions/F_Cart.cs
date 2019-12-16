using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVCWatchOnline.Models.Functions
{
    public class F_Cart
    {
        public F_Cart()
        {
            CartList = new List<CartItem>();
        }
        public List<CartItem> CartList;

        public void Addtocart(CartItem item)
        {
            if (CartList.Where(i => i.ProductName.Equals(item.ProductName)).Any())
            {
                var myItem = CartList.Single(s => s.ProductName.Equals(item.ProductName));
                myItem.Quantity += item.Quantity;
                myItem.Amount += item.Quantity * Convert.ToDouble(item.Price.Trim().Replace(",", string.Empty).Replace(".", string.Empty));
            }
            else
            {
                CartList.Add(item);
            }
        }
        public bool DeleteProduct(int lngProductSellID)
        {
            CartItem existsItem = CartList.Where(i => i.ProductId == lngProductSellID).SingleOrDefault();
            if (existsItem != null)
            {
                CartList.Remove(existsItem);
            }
            return true;
        }
        public bool UpdateQuantity(int lngProductSellID, int intQuantity)
        {
            CartItem existsItem =CartList.Where(x => x.ProductId == lngProductSellID).SingleOrDefault();
            if (existsItem != null)
            {
                existsItem.Quantity = intQuantity;
                existsItem.Amount = existsItem.Quantity * Convert.ToDouble(existsItem.Price.Replace(",", string.Empty).Replace(".", string.Empty));
            }
            return true;
        }
        public bool CartEmpty()
        {
            CartList.Clear();
            return true;
        }
        public class CartItem
        {
            public string Image { get; set; }
            public int ProductId { get; set; }
            public string ProductName { get; set; }
            public string Price { get; set; }
            public int Quantity { get; set; }
            public double Amount { get; set; }
        }

    }

    
}