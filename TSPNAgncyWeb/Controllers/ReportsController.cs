using com.rti.tailspinnew.web.Models.Common;
using System;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace com.rti.tailspinnew.web
{
	[HandleError]
	public class ReportsController : Controller
	{
		public ReportsController()
		{
		}

		protected override void OnActionExecuted(ActionExecutedContext filterContext)
		{
			ClearCache.ClearAllCache();
			base.OnActionExecuted(filterContext);
		}

		protected override void OnActionExecuting(ActionExecutingContext filterContext)
		{
			if (!System.Web.HttpContext.Current.User.Identity.IsAuthenticated || base.Session["UserRole"] == null)
			{
				filterContext.Result = new RedirectResult(base.Url.Action("LogOn", "Account"));
			}
			if (base.Session["UserRole"] != null)
			{
				HttpRequestBase request = filterContext.HttpContext.Request;
				HttpResponseBase response = filterContext.HttpContext.Response;
				if (base.Session["UserRole"].ToString().ToLower() == "user" && (filterContext.ActionDescriptor.ActionName.ToLower() == "agencyuserslist" || filterContext.ActionDescriptor.ActionName.ToLower() == "updateagencyprofile" || filterContext.ActionDescriptor.ActionName.ToLower() == "agencycontactregistration" || filterContext.ActionDescriptor.ActionName.ToLower() == "reports"))
				{
					response.Redirect(base.Url.Action("PostLoginHome", "Home"));
				}
			}
			base.OnActionExecuting(filterContext);
		}

		public ActionResult Reports()
		{
			return base.View();
		}
	}
}