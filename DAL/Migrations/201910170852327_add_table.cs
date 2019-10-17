namespace DAL.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class add_table : DbMigration
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
                    })
                .PrimaryKey(t => t.RssItemId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.RssItems");
        }
    }
}
