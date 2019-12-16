using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebMVCWatchOnline.Models.Entities;
namespace WebMVCWatchOnline.Models.Functions
{
    public class F_Customer
    {
        private ShopWatchContext db;
        public F_Customer()
        {
            db = new ShopWatchContext();
        }
        public Customer GetByID(int id)
        {
            return db.Customers.Find(id);
        }
        public int Insert(Customer entity)
        {
            db.Customers.Add(entity);
            db.SaveChanges();
            return entity.Id;
        }
        public bool Update(Customer entity)
        {
            try
            {
                var customer = db.Customers.Find(entity.Id);
                customer.Name = entity.Name;
                customer.UserName = entity.UserName;
                customer.BirthDay = entity.BirthDay;
                customer.Province = entity.Province;
                customer.Address = entity.Address;
                customer.Tel = entity.Tel;
                customer.Email = entity.Email;
                customer.Password = entity.Password;


                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}