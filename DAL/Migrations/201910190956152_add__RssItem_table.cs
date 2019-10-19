namespace DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class add__RssItem_table : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.RssItems",
                c => new
                    {
                        RssItemId = c.Guid(nullable: false, identity: true),
                        Link = c.String(),
                        Title = c.String(),
                        Description = c.String(),
                        Date = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.RssItemId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.RssItems");
        }
    }
}
