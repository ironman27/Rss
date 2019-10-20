using DAL;
using System;

namespace Rss.MVC.ViewModals
{
    [Obsolete]
    public class RssItemModel
    {        
        public PagedList.IPagedList<DAL.RssItem> RssItems { get; set; }
    }
}