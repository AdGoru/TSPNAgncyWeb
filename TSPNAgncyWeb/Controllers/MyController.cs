using System;
using System.IO;
using System.Security.Principal;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace com.rti.tailspinnew.web
{
	public class MyController : Controller
	{
		public MyController()
		{
		}

		protected override void OnActionExecuted(ActionExecutedContext filterContext)
		{
			base.OnActionExecuted(filterContext);
		}

		protected override void OnActionExecuting(ActionExecutingContext filterContext)
		{
			if (!HttpContext.User.Identity.IsAuthenticated || base.Session["UserRole"] == null)
			{
				filterContext.Result = new RedirectResult(base.Url.Action("LogOn", "Account"));
			}
			base.OnActionExecuting(filterContext);
		}

		protected string RenderActionResultToString(ActionResult result)
		{
			StringBuilder stringBuilder = new StringBuilder();
			StringWriter stringWriter = new StringWriter(stringBuilder);
			HttpResponse httpResponse = new HttpResponse(stringWriter);
			HttpContext httpContext = new HttpContext(System.Web.HttpContext.Current.Request, httpResponse);
			ControllerContext controllerContext = new ControllerContext(new HttpContextWrapper(httpContext), base.ControllerContext.RouteData, base.ControllerContext.Controller);
			HttpContext current = System.Web.HttpContext.Current;
			System.Web.HttpContext.Current = httpContext;
			result.ExecuteResult(controllerContext);
			System.Web.HttpContext.Current = current;
			stringWriter.Flush();
			return stringBuilder.ToString();
		}

		protected ActionResult ViewPdf(object model)
		{
			MemoryStream memoryStream = new MemoryStream();
			this.RenderActionResultToString(base.View(model));
			byte[] numArray = new byte[memoryStream.Position];
			memoryStream.Position = (long)0;
			memoryStream.Read(numArray, 0, (int)numArray.Length);
			return new BinaryContentResult(numArray, "application/pdf");
		}
	}
}