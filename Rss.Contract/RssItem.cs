using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Rss.Contract
{
    public class RssItem
    {
        public Guid RssItemId { get; set; }

        public string Link { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public DateTime Date { get; set; }

        public string Host { get; set; }
    }
}
