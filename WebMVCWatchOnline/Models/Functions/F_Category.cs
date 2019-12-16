using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebMVCWatchOnline.Models.Entities;

namespace WebMVCWatchOnline.Models.Functions
{
        public class F_Category
    {
        private ShopWatchContext context;
        public F_Category()
        {
            context = new ShopWatchContext();
        }
        public IQueryable<ProductCategory> ListProductCategory()
        {
            return context.ProductCategories;
        }
        public ProductCategory FindEntities(int? categoryId)
        {
            ProductCategory dbEntry = context.ProductCategories.Find(categoryId);
            return dbEntry;
        }
        public int? Insert(ProductCategory model)
        {
            ProductCategory dbEntry = context.ProductCategories.Find(model.CategoryID);
            if (dbEntry != null)
            {
                return null;
            }
            context.ProductCategories.Add(model);
            context.SaveChanges();
            return model.CategoryID;
        }
        public int? Delete(int productId)
        {
            ProductCategory dbEntry = context.ProductCategories.Find(productId);
            if (dbEntry != null)
            {
                return null;
            }
            context.ProductCategories.Remove(dbEntry);
            context.SaveChanges();
            return productId;
        }
        public bool Update(ProductCategory entity)
        {
            try
            {
                var product = context.ProductCategories.Find(entity.CategoryID);
                product.Name = entity.Name;
                product.MetaTitle = entity.MetaTitle;
                product.ParentID = entity.ParentID;
                product.DisplayOrder = entity.DisplayOrder;
                product.SeoTitle = entity.SeoTitle;
                product.CreatedDate = entity.CreatedDate;
                product.CreatedBy = entity.CreatedBy;
                product.ModifiedDate = entity.ModifiedDate;
                product.ModifiedBy = entity.ModifiedBy;
                product.CategoryID = entity.CategoryID;
                product.MetaKeywords = entity.MetaKeywords;
                product.MetaDescriptions = entity.MetaDescriptions;
                product.Status = entity.Status;
                product.ShowOnHome = entity.ShowOnHome;
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