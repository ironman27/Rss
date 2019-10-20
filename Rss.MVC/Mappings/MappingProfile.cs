using AutoMapper;
using System;

namespace Rss.MVC.Mappings
{
    [Obsolete]
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<DAL.RssItem, Rss.Contract.RssItem>()
                .ForMember(d => d.Description, opt => opt.MapFrom(v => v.Description != null ? (v.Description.StartsWith("<") ? "": v.Description.Replace("<br />", "")) : ""));
            
        }
    }

}