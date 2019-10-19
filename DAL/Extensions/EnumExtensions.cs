using System;

namespace DAL.Extensions
{
    [Obsolete]
    public static class ResourceExt
    {
        public static string AsDisplayString(this Resource resource)
        {
            switch (resource)
            {
                case Resource.All: return "Все";
                case Resource.Habr: return "Хабр";
                case Resource.Interfax: return "Интерфакс";

                default: throw new ArgumentOutOfRangeException("Resource");
            }
        }
    }
}