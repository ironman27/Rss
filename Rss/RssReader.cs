using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Rss
{
    public class RssReader
    {
        public static IEnumerable<RssItem> GetRssFeed(string url)
        {
            XDocument feedXml = XDocument.Load(url);
            var feeds = from feed in feedXml.Descendants("item")
                        select new RssItem
                        {
                            Title = feed.Element("title").Value,
                            Link = feed.Element("link").Value,
                            Description = Regex.Match(feed.Element("description").Value, @"^.{1,180}\b(?<!\s)").Value
                        };
            return feeds;
        }

        public static int Save(IEnumerable<RssItem> feeds)
        {
            int savedCount = 0;

            using (var context = new ApplicationContext())
            {
                var rssItemLinks = context.Rsses.Select(r => r.Link).ToList();

                foreach (var rss in feeds.Where(f => f.Link != null))
                {
                    if (!rssItemLinks.Contains(rss.Link))
                    {
                        context.Rsses.Add(rss);
                        savedCount++;
                    }
                }

                context.SaveChanges();
            }

            return savedCount;
        }
    }

}
