using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebMVCWatchOnline.Models.Entities;
namespace WebMVCWatchOnline.Models.Functions
{
    public class F_Product
    {
        private ShopWatchContext context;
        public F_Product()
        {
            context = new ShopWatchContext();
        }
        public IQueryable<Product> ListProduct()
        {
            return context.Products;
        }
        public Product FindEntities(int productId)
        {
            Product dbEntry = context.Products.Find(productId);
            return dbEntry;
        }
        public int? Insert(Product model)
        {
            Product dbEntry = context.Products.Find(model.ProductID);
            if (dbEntry != null)
            {
                return null;
            }
            context.Products.Add(model);
            context.SaveChanges();
            return model.ProductID;
        }
        public int? Delete(int productId)
        {
            Product dbEntry = context.Products.Find(productId);
            if (dbEntry != null)
            {
                return null;
            }
            context.Products.Remove(dbEntry);
            context.SaveChanges();
            return productId;
        }
        public bool Update(Product entity)
        {
            try
            {
                var product = context.Products.Find(entity.ProductID);
                product.ProductName = entity.ProductName;
                product.MetaTitle = entity.MetaTitle;
                product.Description = entity.Description;
                product.ProductImage = entity.ProductImage;
                product.MoreImages = entity.MoreImages;
                product.Price = entity.Price;
                product.PromotionPrice = entity.PromotionPrice;
                product.IncludeVAT = entity.IncludeVAT;
                product.Quantity = entity.Quantity;
                product.CategoryID = entity.CategoryID;
                product.Detail = entity.Detail;
                product.Warranty = entity.Warranty;
                product.CreatedDate = entity.CreatedDate;
                product.CreatedBy = entity.CreatedBy;
                product.ModifiedDate = entity.ModifiedDate;
                product.ModifiedBy = entity.ModifiedBy;
                product.MetaKeywords = entity.MetaKeywords;
                product.MetaDescriptions = entity.MetaDescriptions;
                product.Status = entity.Status;
                product.TopHot = entity.TopHot;
                product.ViewCounts = entity.ViewCounts;
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}