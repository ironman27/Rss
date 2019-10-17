using System;
using System.Linq;

namespace Rss
{
    class Program
    {
        static void Main(string[] blogs)
        {
            foreach (var blog in blogs)
            {
                var feeds = RssReader.GetRssFeed(blog);
                var writeCount = RssReader.Save(feeds);

                Console.WriteLine(blog);
                Console.WriteLine("Read count {0}", feeds.Count());
                Console.WriteLine("Saved count {0}", writeCount);
            }

            Console.ReadKey();
        }
    }
}
