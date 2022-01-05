using System;
using System.Web;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class ClearCache
	{
		public ClearCache()
		{
		}

		public static void ClearAllCache()
		{
			HttpContext.Current.Response.ClearHeaders();
			HttpContext.Current.Response.AppendHeader("Cache-Control", "no-cache");
			HttpContext.Current.Response.AppendHeader("Cache-Control", "private");
			HttpContext.Current.Response.AppendHeader("Cache-Control", "no-store");
			HttpContext.Current.Response.AppendHeader("Cache-Control", "must-revalidate");
			HttpContext.Current.Response.AppendHeader("Cache-Control", "max-stale=0");
			HttpContext.Current.Response.AppendHeader("Cache-Control", "post-check=0");
			HttpContext.Current.Response.AppendHeader("Cache-Control", "pre-check=0");
			HttpContext.Current.Response.AppendHeader("Pragma", "no-cache");
			HttpContext.Current.Response.AppendHeader("Keep-Alive", "timeout=3, max=993");
			HttpContext.Current.Response.AppendHeader("Expires", "Mon, 26 Jul 1997 05:00:00 GMT");
		}
	}
}