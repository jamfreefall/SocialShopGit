using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace ASP
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            //var settings = new FriendlyUrlSettings();
            //settings.AutoRedirectMode = RedirectMode.Permanent;
            //routes.EnableFriendlyUrls(settings);

            var settings = new FriendlyUrlSettings();
            //settings.ResolverCachingMode = ResolverCachingMode.Dynamic;
            //settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
            routes.MapPageRoute("blog-page", "blog/{url}", "~/blogpage.aspx");
            routes.MapPageRoute("coupon-offer-page", "offer/{url}", "~/offerpage.aspx");
        }
    }
}
