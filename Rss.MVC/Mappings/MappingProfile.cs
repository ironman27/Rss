using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Rss.MVC.Mappings
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            //CreateMap<Entities.Employee, Contracts.Employee>()
            //    .ForMember(d => d.ManagerName, opt => opt.MapFrom(v => v.Manager != null ? v.Manager.Name : ""))
            //    //.ForMember(d => d.Position, opt => opt.ConvertUsing<Entities.Position>(new EnumValueConverter<Entities.Position, Contracts.Position>(), u => u.Position))
            //    ;

            //CreateMap<Contracts.Employee, Entities.Employee>()
            ////.ForMember(i => i., opt => opt.Ignore())
            ;
        }
    }

}