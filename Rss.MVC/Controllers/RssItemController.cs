using DAL;
using PagedList;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace Rss.MVC.Controllers
{
    public class RssItemController : Controller
    {
        private ApplicationContext db = new ApplicationContext();

        int pageSize = 10;

        public async Task<ActionResult> Index(int? page)
        {
            var rssItems = await (from s in db.Rsses
                                  select s).ToListAsync();
            
            int pageNumber = (page ?? 1);
            return View(rssItems.ToPagedList(pageNumber, pageSize));
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        public async Task<ActionResult> IndexSearch(int? page, string sort, Resource? resource)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("");
            }

            ViewBag.Sort = sort;
            ViewBag.Resource = resource;

            List<RssItem> rssItemList = Session["rssItemList"] as List<RssItem>;

            Resource? resourceState = Session["resourceState"] as Resource?;
            string sortState = Session["sortState"] as string;

            if (rssItemList == null || resource != resourceState || sort != sortState)
            {
                Session["resourceState"] = resource;
                Session["sortState"] = sort;

                var rssItems = from s in db.Rsses
                               select s;

                Session["rssItemList"] = rssItems;

                if (resource != Resource.All)
                {
                    rssItems = rssItems.Where(r => r.Link.Contains(resource.ToString()));
                }

                switch (sort)
                {
                    case "Date":
                        rssItems = rssItems.OrderByDescending(s => s.Date);
                        break;
                    case "Url":
                        rssItems = rssItems
                            .OrderBy(s => s.Link);
                        break;
                    default:
                        break;
                }

                rssItemList = await rssItems.ToListAsync();

                Session["rssItemList"] = rssItemList;
            }
            
            int pageNumber = (page ?? 1);
            return PartialView("_RssItemGrid", rssItemList.ToPagedList(pageNumber, pageSize));
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}
