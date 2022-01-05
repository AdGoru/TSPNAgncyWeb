using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Web.Mvc;

namespace com.rti.tailspinnew.web.Helpers
{
	public static class DialogHelper
	{
		public static MvcHtmlString DialogFormLink(this HtmlHelper htmlHelper, string linkText, string dialogContentUrl, string dialogTitle, string updateTargetId, string updateUrl)
		{
			TagBuilder tagBuilder = new TagBuilder("a");
			tagBuilder.SetInnerText(linkText);
			tagBuilder.Attributes.Add("href", dialogContentUrl);
			tagBuilder.Attributes.Add("data-dialog-title", dialogTitle);
			tagBuilder.Attributes.Add("data-update-target-id", updateTargetId);
			tagBuilder.Attributes.Add("data-update-url", updateUrl);
			tagBuilder.AddCssClass("dialogLink");
			return new MvcHtmlString(tagBuilder.ToString());
		}
	}
}