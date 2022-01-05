using System;
using System.Collections;
using System.IO;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace com.rti.tailspinnew.web
{
	[HandleError]
	public class AttachFilesController : Controller
	{
		public AttachFilesController()
		{
		}

		public ActionResult AttachFiles()
		{
			return base.View();
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

		[HttpPost]
		public ActionResult UploadFiles()
		{
			foreach (string file in base.Request.Files)
			{
				if (base.Request.Files[file].ContentLength <= 0)
				{
					continue;
				}
				string contentType = base.Request.Files[file].ContentType;
				Stream inputStream = base.Request.Files[file].InputStream;
				Path.GetFileName(base.Request.Files[file].FileName);
				int contentLength = base.Request.Files[file].ContentLength;
				inputStream.Read(new byte[contentLength], 0, contentLength);
			}
			return base.View();
		}
	}
}