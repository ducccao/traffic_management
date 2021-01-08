using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace _1712362
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{mssv}",
                defaults: new { mssv = RouteParameter.Optional }
            );
            // using JSON - remove XML format
            config.Formatters.Remove(config.Formatters.XmlFormatter);
        }
    }
}
