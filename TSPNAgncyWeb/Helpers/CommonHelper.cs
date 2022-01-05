using System;
using System.Runtime.CompilerServices;
using System.Web.Mvc;
using System.Web.Routing;

namespace com.rti.tailspinnew.web.Helpers
{
	public static class CommonHelper
	{
		public static MvcHtmlString Pager(this HtmlHelper helper, int currentPage, int pageSize, int totalItemCount, object routeValues)
		{
			int num = 5;
			int num1 = (int)Math.Ceiling((double)totalItemCount / (double)pageSize);
			currentPage = Math.Max(currentPage, 1);
			currentPage = Math.Min(currentPage, num1);
			UrlHelper urlHelper = new UrlHelper(helper.ViewContext.RequestContext, helper.RouteCollection);
			TagBuilder tagBuilder = new TagBuilder("div");
			tagBuilder.AddCssClass("pager");
			string requiredString = helper.ViewContext.RouteData.GetRequiredString("Action");
			int num2 = currentPage;
			while (num2 % num != 0)
			{
				num2++;
			}
			int num3 = Math.Min(num2, num1);
			int num4 = num2 - (num - 1);
			if (currentPage > 1)
			{
				TagBuilder tagBuilder1 = new TagBuilder("a");
				tagBuilder1.SetInnerText("<");
				tagBuilder1.AddCssClass("previous");
				RouteValueDictionary routeValueDictionaries = new RouteValueDictionary(routeValues)
				{
					{ "page", currentPage - 1 }
				};
				tagBuilder1.MergeAttribute("href", urlHelper.Action(requiredString, routeValueDictionaries));
				TagBuilder tagBuilder2 = tagBuilder;
				tagBuilder2.InnerHtml = string.Concat(tagBuilder2.InnerHtml, tagBuilder1.ToString());
			}
			if (currentPage > num)
			{
				TagBuilder tagBuilder3 = new TagBuilder("a");
				tagBuilder3.SetInnerText("...");
				tagBuilder3.AddCssClass("previous-dots");
				RouteValueDictionary routeValueDictionaries1 = new RouteValueDictionary(routeValues)
				{
					{ "page", num4 - num }
				};
				tagBuilder3.MergeAttribute("href", urlHelper.Action(requiredString, routeValueDictionaries1));
				TagBuilder tagBuilder4 = tagBuilder;
				tagBuilder4.InnerHtml = string.Concat(tagBuilder4.InnerHtml, tagBuilder3.ToString());
			}
			for (int i = num4; i <= num3; i++)
			{
				TagBuilder tagBuilder5 = new TagBuilder("a");
				tagBuilder5.AddCssClass((i == currentPage ? "selected-page" : "page"));
				tagBuilder5.SetInnerText(i.ToString());
				RouteValueDictionary routeValueDictionaries2 = new RouteValueDictionary(routeValues)
				{
					{ "page", i }
				};
				tagBuilder5.MergeAttribute("href", urlHelper.Action(requiredString, routeValueDictionaries2));
				TagBuilder tagBuilder6 = tagBuilder;
				tagBuilder6.InnerHtml = string.Concat(tagBuilder6.InnerHtml, tagBuilder5.ToString());
			}
			if (num1 > num3)
			{
				TagBuilder tagBuilder7 = new TagBuilder("a");
				tagBuilder7.SetInnerText("...");
				tagBuilder7.AddCssClass("next-dots");
				RouteValueDictionary routeValueDictionaries3 = new RouteValueDictionary(routeValues)
				{
					{ "page", num3 + 1 }
				};
				tagBuilder7.MergeAttribute("href", urlHelper.Action(requiredString, routeValueDictionaries3));
				TagBuilder tagBuilder8 = tagBuilder;
				tagBuilder8.InnerHtml = string.Concat(tagBuilder8.InnerHtml, tagBuilder7.ToString());
			}
			if (currentPage < num1)
			{
				TagBuilder tagBuilder9 = new TagBuilder("a");
				tagBuilder9.SetInnerText(">");
				tagBuilder9.AddCssClass("next");
				RouteValueDictionary routeValueDictionaries4 = new RouteValueDictionary(routeValues)
				{
					{ "page", currentPage + 1 }
				};
				tagBuilder9.MergeAttribute("href", urlHelper.Action(requiredString, routeValueDictionaries4));
				TagBuilder tagBuilder10 = tagBuilder;
				tagBuilder10.InnerHtml = string.Concat(tagBuilder10.InnerHtml, tagBuilder9.ToString());
			}
			return MvcHtmlString.Create(tagBuilder.ToString());
		}
	}
}