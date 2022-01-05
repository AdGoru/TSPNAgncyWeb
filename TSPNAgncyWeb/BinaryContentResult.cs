using System;
using System.IO;
using System.Web;
using System.Web.Mvc;

namespace com.rti.tailspinnew.web
{
	public class BinaryContentResult : ActionResult
	{
		private string ContentType;

		private byte[] ContentBytes;

		public BinaryContentResult(byte[] contentBytes, string contentType)
		{
			this.ContentBytes = contentBytes;
			this.ContentType = contentType;
		}

		public override void ExecuteResult(ControllerContext context)
		{
			HttpResponseBase response = context.HttpContext.Response;
			response.Clear();
			response.Cache.SetCacheability(HttpCacheability.NoCache);
			response.ContentType = this.ContentType;
			MemoryStream memoryStream = new MemoryStream(this.ContentBytes);
			memoryStream.WriteTo(response.OutputStream);
			memoryStream.Dispose();
		}
	}
}