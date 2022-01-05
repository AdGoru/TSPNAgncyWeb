using com.rti.tailspinnew.Models;
using com.rti.tailspinnew.Models.WcfAppService;
using com.rti.tailspinnew.web.Models.Common;
using System;
using System.Collections.Generic;
using System.IO;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace com.rti.tailspinnew.web
{
	public class FaxController : MyController
	{
		private List<localInbox> files = new List<localInbox>();

		public FaxController()
		{
		}

		public static string CreateFileFromByteArray(byte[] bytFileContents, string strFileName)
		{
			string str = string.Concat(Environment.GetFolderPath(Environment.SpecialFolder.Personal), "\\TSPN");
			string str1 = string.Concat(str, "\\", strFileName);
			try
			{
				byte[] numArray = bytFileContents;
				if (!System.IO.File.Exists(str1))
				{
					FileStream fileStream = new FileStream(str1, FileMode.Create, FileAccess.Write);
					fileStream.Write(numArray, 0, (int)numArray.Length);
					fileStream.Close();
					fileStream.Dispose();
				}
			}
			catch (Exception exception)
			{
			}
			return str1;
		}

		public ActionResult FaxList()
		{
			List<localInbox> localInboxes = new List<localInbox>();
			localInboxes = WebSessionManager.getRejectedInboxList((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"]);
			return base.View(localInboxes);
		}

		public static byte[] GetFileContents(string fileName)
		{
			byte[] numArray = null;
			try
			{
				FileStream fileStream = new FileStream(fileName, FileMode.Open, FileAccess.Read);
				try
				{
					try
					{
						BinaryReader binaryReader = new BinaryReader(fileStream);
						long length = (new FileInfo(fileName)).Length;
						numArray = binaryReader.ReadBytes((int)length);
						binaryReader.Close();
					}
					catch (Exception exception)
					{
					}
				}
				finally
				{
					fileStream.Close();
					fileStream.Dispose();
				}
			}
			catch (Exception exception1)
			{
			}
			return numArray;
		}

		public ActionResult NewFax()
		{
			return base.View();
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
			base.OnActionExecuting(filterContext);
		}

		public ActionResult PDFFile(int Id)
		{
			MemoryStream memoryStream = new MemoryStream();
			List<string> pDFFileContentsByIndex = WebSessionManager.getPDFFileContentsByIndex(Id);
			if (pDFFileContentsByIndex.Count > 0)
			{
				FileInfo fileInfo = new FileInfo(pDFFileContentsByIndex[0]);
				byte[] fileContents = FaxController.GetFileContents(fileInfo.FullName);
				memoryStream.Write(fileContents, 0, (int)fileContents.Length);
				memoryStream.Position = (long)0;
				base.HttpContext.Response.AddHeader("content-disposition", string.Concat("attachment; filename=", fileInfo.Name));
			}
			return new FileStreamResult(memoryStream, "application/pdf");
		}

		public ActionResult ShowPDF(int fileID)
		{
			return null;
		}
	}
}