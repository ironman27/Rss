using DAL;
using PagedList;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using AutoMapper;

namespace Rss.MVC.Controllers
{
    public class RssItemController : Controller
    {
        private ApplicationContext db = new ApplicationContext();

        int pageSize = 10;

        public RssItemController()
        {
            Mapper.Initialize(cfg => 
            cfg.CreateMap<RssItem, Rss.Contract.RssItem>()
            .ForMember(d => d.Description, opt => opt.MapFrom(v => v.Description != null ? (v.Description.StartsWith("<") ? "" : v.Description.Replace("<br", "")) : ""))
            );  
        }

        public async Task<ActionResult> Index(int? page)
        {
            var entityRssItems = await (from s in db.Rsses
                                  select s).ToListAsync();

            var contractRssItems =
                Mapper.Map<List<RssItem>, List<Rss.Contract.RssItem>>(entityRssItems);
            
            ViewBag.Hosts = contractRssItems.OrderBy(r => r.Host).Select(r => r.Host).Distinct().Select(x =>
                                 new SelectListItem()
                                 {
                                     Value = x.ToString(),
                                     Text = x.ToString()
                                 });

            int pageNumber = page ?? 1;
            return View(contractRssItems.ToPagedList(pageNumber, pageSize));
        }

        [HttpPost]
        //[ValidateAntiForgeryToken]
        public async Task<ActionResult> IndexSearch(int? page, string sort, string resource)
        {
            if (!ModelState.IsValid)
            {
                return RedirectToAction("Index");
            }

            ViewBag.Sort = sort;
            ViewBag.Resource = resource;

            List<Contract.RssItem> contractRssItems = Session["rssItemList"] as List<Contract.RssItem>;

            string resourceState = Session["resourceState"] as string;
            string sortState = Session["sortState"] as string;

            if (contractRssItems == null || resource != resourceState || sort != sortState)
            {
                Session["resourceState"] = resource;
                Session["sortState"] = sort;

                var rssItems = from s in db.Rsses
                               select s;

                Session["rssItemList"] = rssItems;

                if (!string.IsNullOrEmpty(resource))
                {
                    rssItems = rssItems.Where(r => r.Host == resource);
                }

                switch (sort)
                {
                    case "Date":
                        rssItems = rssItems.OrderByDescending(s => s.Date);
                        break;
                    case "Url":
                        rssItems = rssItems
                            .OrderBy(s => s.Host);
                        break;
                    default:
                        break;
                }

                List<RssItem> rssItemList = await rssItems.ToListAsync();

                contractRssItems =
                    Mapper.Map<List<RssItem>, List<Rss.Contract.RssItem>>(rssItemList);
                
                Session["rssItemList"] = contractRssItems;
            }
            
            ViewBag.Hosts = contractRssItems.OrderBy(r => r.Host).Select(r => r.Host).Distinct().Select(x =>
                                  new SelectListItem()
                                  {
                                      Value = x.ToString(),
                                      Text = x.ToString()
                                  });

            int pageNumber = page ?? 1;
            return PartialView("_RssItemGrid", contractRssItems.ToPagedList(pageNumber, pageSize));
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}
