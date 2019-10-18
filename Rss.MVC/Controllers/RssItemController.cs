using DAL;
using Rss.MVC.ViewModals;
using System;
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

        public async Task<ActionResult> Index(int page = 1)
        {
            var rssItems = from s in db.Rsses
                           select s;

            var items = await rssItems.ToListAsync();

            int pageSize = 10;
            PageInfo pageInfo = new PageInfo { PageNumber = page, PageSize = pageSize, TotalItems = items.Count };
            IEnumerable<RssItem> itemsPerPages = items.Skip((page - 1) * pageSize).Take(pageSize);
            RssItemModel rim = new RssItemModel { PageInfo = pageInfo, RssItems = itemsPerPages };
            return View(rim);
        }


        [HttpPost]
        public async Task<ActionResult> SearchIndex(Resource resource = Resource.All, string sort = null, int page = 1)
        {
            var rssItems = from s in db.Rsses
                           select s;

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

            var items = await rssItems.ToListAsync();

            int pageSize = 10;
            PageInfo pageInfo = new PageInfo { PageNumber = page, PageSize = pageSize, TotalItems = items.Count };
            IEnumerable<RssItem> itemsPerPages = items.Skip((page - 1) * pageSize).Take(pageSize);
            RssItemModel rim = new RssItemModel { PageInfo = pageInfo, RssItems = itemsPerPages };
            return PartialView("_RssItemGrid", rim);
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}
