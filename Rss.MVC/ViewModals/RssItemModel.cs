using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rss.MVC.ViewModals
{
    public class RssItemModel
    {
        public bool Sort { get; set; }

        public Resource Resource { get; set; }
        
        public IEnumerable<RssItem> RssItems { get; set; }

        public PageInfo PageInfo { get; set; }
    }
}