using System.Web.Mvc;

namespace WebMVCWatchOnline.Areas.Admin.Controllers
{
    public class NewsController : Controller
    {
        // GET: News
        public ActionResult Index()
        {
            return View();
        }
    }
}