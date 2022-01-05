using com.rti.tailspinnew.Models;
using com.rti.tailspinnew.Models.WcfAppService;
using System;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace com.rti.tailspinnew.web
{
	public class PrintController : Controller
	{
		public PrintController()
		{
		}

		public ActionResult CampMonitoringForm(int id)
		{
			localCAF cAFrec = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
			return base.View(cAFrec);
		}

		public ActionResult CoverSheet(int id)
		{
			localCAF cAFrec = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
			return base.View(cAFrec);
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

		public ActionResult PrintCAF(int? id, localCAF model)
		{
			CAFController cAFController = new CAFController();
			if (id.HasValue)
			{
				int value = id.Value;
				model = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], value);
			}
			else
			{
				model = new localCAF();
			}
			return base.View(model);
		}

		[ActionName("TCAF")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="PrintTcaf")]
		public ActionResult TCAFPrintBtn(localCAF model, int id)
		{
			return this.View("print", "PrintCAF", new { id = model.AppID, model = model });
		}
	}
}