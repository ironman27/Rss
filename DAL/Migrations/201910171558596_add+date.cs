namespace DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class adddate : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.RssItems", "Date", c => c.DateTime(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.RssItems", "Date");
        }
    }
}
