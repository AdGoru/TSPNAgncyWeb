using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Mvc;

namespace com.rti.tailspinnew.web
{
	public class LinkActionToButtonName : ActionMethodSelectorAttribute
	{
		public string SubmitButtonName
		{
			get;
			set;
		}

		public LinkActionToButtonName()
		{
		}

		public override bool IsValidForRequest(ControllerContext controllerContext, MethodInfo methodInfo)
		{
			string item = controllerContext.HttpContext.Request[this.SubmitButtonName];
			return item != null;
		}
	}
}