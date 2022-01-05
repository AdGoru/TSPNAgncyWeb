using com.rti.tailspinnew.Models;
using com.rti.tailspinnew.web.Models.Common;
using System;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace com.rti.tailspinnew.web
{
	[HandleError]
	public class HomeController : Controller
	{
		public HomeController()
		{
		}

		public ActionResult About()
		{
			return base.View();
		}

		public ActionResult LeftPane(string strUrl)
		{
            //if(true) // testing JHF 10/28/19
            //{
            //    return base.PartialView("LeftCampPane1");
            //}
            if (strUrl.ToUpper() == "2")
			{
				return base.PartialView("LeftPane1");
			}
			if (strUrl.ToUpper() == "3")
			{
				return base.PartialView("LeftPane2");
			}
			if (strUrl.ToUpper() == "4")
			{
				return base.PartialView(null);
			}
			if (strUrl.ToUpper() == "5")
			{
				return base.PartialView("HelpLeftPane");
			}
			return base.PartialView(null);
		}

		protected override void OnActionExecuted(ActionExecutedContext filterContext)
		{
			base.OnActionExecuted(filterContext);
		}

		protected override void OnActionExecuting(ActionExecutingContext filterContext)
		{
			if (!System.Web.HttpContext.Current.User.Identity.IsAuthenticated || base.Session["UserRole"] == null)
			{
				filterContext.Result = new RedirectResult(base.Url.Action("LogOn", "Account"));
			}
			base.OnActionExecuting(filterContext);
		}

		public ViewResult PostLoginCampHome()
		{
			ClearCache.ClearAllCache();
            base.ViewData["PostLogin"] = "Camp User post-log-in message goes here..."; //WebSessionManager.getPostLoginMessage();
			return base.View();
		}

        public ViewResult PostLoginHome()
        {
            ClearCache.ClearAllCache();
            base.ViewData["PostLogin"] = WebSessionManager.getPostLoginMessage();
            return base.View();
        }
    }
}