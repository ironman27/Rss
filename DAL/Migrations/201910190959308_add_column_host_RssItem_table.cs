namespace DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class add_column_host_RssItem_table : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.RssItems", "Host", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.RssItems", "Host");
        }
    }
}
