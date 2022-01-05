using System;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Mvc;

namespace com.rti.tailspinnew.web.Models.Common
{
	[AttributeUsage(AttributeTargets.Method, AllowMultiple=false, Inherited=true)]
	public class MultiButtonAttribute : ActionNameSelectorAttribute
	{
		public string MatchFormKey
		{
			get;
			set;
		}

		public string MatchFormValue
		{
			get;
			set;
		}

		public MultiButtonAttribute()
		{
		}

		public override bool IsValidName(ControllerContext controllerContext, string actionName, MethodInfo methodInfo)
		{
			if (controllerContext.HttpContext.Request[this.MatchFormKey] == null)
			{
				return false;
			}
			return controllerContext.HttpContext.Request[this.MatchFormKey] == this.MatchFormValue;
		}
	}
}