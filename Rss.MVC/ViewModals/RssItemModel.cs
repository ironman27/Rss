using DAL;

namespace Rss.MVC.ViewModals
{
    public class RssItemModel
    {        
        public PagedList.IPagedList<DAL.RssItem> RssItems { get; set; }
    }
}