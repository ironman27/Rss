﻿using DAL;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.ServiceModel.Syndication;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Xml;

namespace Rss
{
    public class RssReader
    {
        public static IEnumerable<RssItem> GetRssFeed(string url)
        {
            XmlReader reader = XmlReader.Create(url);
            SyndicationFeed feed = SyndicationFeed.Load(reader);
            reader.Close();

            var feeds = from item in feed.Items
                        select new RssItem
                        {
                            Title = item.Title.Text,
                            Host = item.Links.FirstOrDefault().Uri.Host,
                            Link = item.Links.Any() ? item.Links.FirstOrDefault().Uri.AbsoluteUri : string.Empty,
                            Description = Regex.Match(item.Summary.Text, @"^.{1,180}\b(?<!\s)").Value,
                            Date = item.PublishDate.DateTime
                        };

            return feeds;
        }

        public static async Task<int> Save(IEnumerable<RssItem> feeds)
        {
            int savedCount = 0;

            using (var context = new ApplicationContext())
            {
                var rssItemLinks = await context.Rsses.Select(r => r.Link).ToListAsync();

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
