using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class ApplicationContext : DbContext
    {
        public ApplicationContext() :
            base("ApplicationContext")
        { }

        public DbSet<RssItem> Rsses { get; set; }
    }

}
