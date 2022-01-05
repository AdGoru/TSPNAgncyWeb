using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace com.rti.tailspinnew.web
{
	public class MvcApplication : HttpApplication
	{
		public MvcApplication()
		{
		}

		protected void Application_Start()
		{
			AreaRegistration.RegisterAllAreas();
			MvcApplication.RegisterGlobalFilters(GlobalFilters.Filters);
			MvcApplication.RegisterRoutes(RouteTable.Routes);
		}

		public static void RegisterGlobalFilters(GlobalFilterCollection filters)
		{
			filters.Add(new HandleErrorAttribute());
		}

		public static void RegisterRoutes(RouteCollection routes)
		{
			RouteCollectionExtensions.IgnoreRoute(routes, "{resource}.axd/{*pathInfo}");
			RouteCollectionExtensions.MapRoute(routes, "Default", "{controller}/{action}/{id}", new { controller = "Account", action = "LogOn", id = UrlParameter.Optional });
		}
	}
}