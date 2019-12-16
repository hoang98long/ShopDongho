using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebMVCWatchOnline.Models.Entities;
using WebMVCWatchOnline.Models.Functions;
namespace WebMVCWatchOnline.Areas.Admin.Controllers
{
    public class DemoController : ApiController
    {
        // GET: api/Demo
        public IEnumerable<Product> Get()
        {
            return new F_Product().ListProduct();
        }

        // GET: api/Demo/5
        public Product Get(int id)
        {
            return new F_Product().FindEntities(id);
        }

        // POST: api/Demo
        public int? Post(Product model)
        {
            return new F_Product().Insert(model);
        }

        // PUT: api/Demo/5
        public bool Put(int Id, Product model)
        {
            return new F_Product().Update(model);
        }

        // DELETE: api/Demo/5
        public int? Delete(int id)
        {
            return new F_Product().Delete(id);
        }
    }
}
