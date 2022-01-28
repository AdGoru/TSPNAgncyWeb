using com.rti.appcommon;
using com.rti.tailspinnew.Models;
using com.rti.tailspinnew.Models.WcfAppService;
using com.rti.tailspinnew.web.Models;
using com.rti.tailspinnew.web.Models.Common;
using Microsoft.CSharp.RuntimeBinder;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace com.rti.tailspinnew.web
{
	[HandleError]
	public class CAFController : Controller
	{
		public CAFController()
		{
		}

		[HttpGet]
		public ActionResult Attach()
		{
			return base.RedirectToAction("AttachDocsTCAF", "CAF");
		}

		public ActionResult AttachDocsTCAF(int Id)
		{
			localCAF _localCAF = new localCAF();
			if (base.Request.RequestType.ToUpper() != "POST")
			{
				return base.View(_localCAF);
			}
			string[] str = new string[5];
			if (base.Request.Form["AttachmentType1"] != null)
			{
				str[0] = base.Request.Form["AttachmentType1"].ToString();
			}
			if (base.Request.Form["AttachmentType2"] != null)
			{
				str[1] = base.Request.Form["AttachmentType2"].ToString();
			}
			if (base.Request.Form["AttachmentType3"] != null)
			{
				str[2] = base.Request.Form["AttachmentType3"].ToString();
			}
			if (base.Request.Form["AttachmentType4"] != null)
			{
				str[3] = base.Request.Form["AttachmentType4"].ToString();
			}
			//if (base.Request.Form["AttachmentType5"] != null)
			//{
			//	str[4] = base.Request.Form["AttachmentType5"].ToString();
			//}
			for (int i = 0; i < base.Request.Files.Count; i++)
			{
				if (base.Request.Files[i].ContentLength > 0 && base.Request.Files[i].ContentType.ToLower().Contains("pdf"))
				{
					string str1 = base.Request.Files[i].ContentType.Substring(base.Request.Files[i].ContentType.Length - 3);
					Stream inputStream = base.Request.Files[i].InputStream;
					string fileName = Path.GetFileName(base.Request.Files[i].FileName);
					int contentLength = base.Request.Files[i].ContentLength;
					byte[] numArray = new byte[contentLength];
					inputStream.Read(numArray, 0, contentLength);
					WebSessionManager.AddAttachmentToCAF((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], Id, fileName, str1, numArray, str[i]);
				}
			}
			return base.RedirectToAction("TCAF", "CAF", new { Id = Id });
		}

		public ViewResult CAFList(string id)
		{
			List<localCAFListItem> localCAFListItems = new List<localCAFListItem>();
			localCAFListItems = WebSessionManager.getCAFList((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"]);
			if (!string.IsNullOrEmpty(id))
			{
				if (id == "Child")
				{
					localCAFListItems = localCAFListItems.OrderBy(x => x.ChildName).ToList();
				}
				if (id == "Camp")
				{
					localCAFListItems = localCAFListItems.OrderBy(x => x.CampTitle).ToList();
				}
				if (id == "Referral")
				{
					localCAFListItems = localCAFListItems.OrderBy(x => x.CafReference).ToList();
				}
			}

			return base.View(localCAFListItems);
		}

		public ViewResult CampCAFList() // JHF new 10/7/20
		{
			List<localCampCAFListItem> localCampCAFListItems = new List<localCampCAFListItem>();
			localCampCAFListItems = WebSessionManager.getCampCAFList((int)base.Session["usertoken"], (int)base.Session["campcontactAppId"], (int)base.Session["campsiteAppId"]);

			
			return base.View(localCampCAFListItems);
		}

		[HttpPost]
		public ActionResult CAFList(string searchtxt, bool chname, bool caname, bool caphone, bool refname, bool agtname, bool status, bool reference)
		{
			string lower = searchtxt;
			List<localCAFListItem> localCAFListItems = new List<localCAFListItem>();
			localCAFListItems = WebSessionManager.getCAFList((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"]);
			if (lower == null || lower == string.Empty)
			{
				return base.View(localCAFListItems);
			}
			lower = lower.Trim().ToLower();
			IEnumerable<localCAFListItem> localCAFListItems1 = localCAFListItems.Where<localCAFListItem>((localCAFListItem a) => {
				if (reference && a.CafReference.ToLower().Contains(lower) || chname && a.ChildName.ToLower().Contains(lower) || caname && a.CampTitle.ToLower().Contains(lower) || caphone && a.CampPhone.ToLower().Contains(lower) || refname && a.ReferralName.ToLower().Contains(lower) || agtname && a.AgentName.ToLower().Contains(lower))
				{
					return true;
				}
				if (!status)
				{
					return false;
				}
				return a.CAFStatusDisplay.ToLower().Contains(lower);
			});
			localCAFListItems = localCAFListItems1.ToList<localCAFListItem>();
			return base.View(localCAFListItems);
		}

		//[HttpPost] // JHF new 10/7/20
		public ActionResult CampCAFList(string searchtxt, bool chname, bool caname, bool caphone, bool refname, bool cmpusrname, bool status, bool reference)
		{
			string lower = searchtxt;
			List<localCampCAFListItem> localCampCAFListItems = new List<localCampCAFListItem>();
			localCampCAFListItems = WebSessionManager.getCampCAFList((int)base.Session["usertoken"], (int)base.Session["campcontactAppId"], (int)base.Session["campsiteAppId"]);
			if (lower == null || lower == string.Empty)
			{
				return base.View(localCampCAFListItems);
			}
			lower = lower.Trim().ToLower();
			IEnumerable<localCampCAFListItem> localCampCAFListItems1 = localCampCAFListItems.Where<localCampCAFListItem>((localCampCAFListItem a) => {
				if (reference && a.CafReference.ToLower().Contains(lower) || chname && a.ChildName.ToLower().Contains(lower) || caname && a.CampTitle.ToLower().Contains(lower) || caphone && a.CampPhone.ToLower().Contains(lower) || refname && a.ReferralName.ToLower().Contains(lower))
				{
					return true;
				}
				if (!status)
				{
					return false;
				}
				return a.CAFStatusDisplay.ToLower().Contains(lower);
			});
			localCampCAFListItems = localCampCAFListItems1.ToList<localCampCAFListItem>();
			return base.View(localCampCAFListItems);
		}

		[HttpPost]
		public ActionResult Cancel()
		{
			return base.View();
		}

		[ActionName("AttachDocsTCAF")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="CancelAttach")]
		public ActionResult CancelAttachDocs(int Id)
		{
			return base.RedirectToAction("TCAF", "CAF", new { Id = Id });
		}

		public void ClearCAF()
		{
		}

		private void copylocalCAF2Model(ref localCAF model, localCAF source)
		{
			model.Reference = source.Reference;
			model.Status = source.Status;
			model.StatusAgencyStr = source.StatusAgencyStr;
			model.AppID = source.AppID;
			model.CAFAppID = source.CAFAppID;
			model.CampSiteAppID = source.CampSiteAppID;
			model.AgencyReferralAppID = source.AgencyReferralAppID;
			model.CampContactAppID = source.CampContactAppID;
			model.Agency = source.Agency;
			model.AgencyAddress = source.AgencyAddress;
			model.AgencyContactEmail = source.AgencyContactEmail;
			model.AgencyContactPhone = source.AgencyContactPhone;
			model.CAFSubmitedOn = source.CAFSubmitedOn;
			model.ChildFirstName = source.ChildFirstName;
			model.ChildMiddleName = source.ChildMiddleName;
			model.ChildLastName = source.ChildLastName;
			model.ParentFirstName = source.ParentFirstName;
			model.ParentMiddleName = source.ParentMiddleName;
			model.ParentLastName = source.ParentLastName;
			model.ChildDOB = source.ChildDOB;
			model.AxisI = source.AxisI;
			model.AxisII = source.AxisII;
			model.ChildAddressLine1 = source.ChildAddressLine1;
			model.ChildCity = source.ChildCity;
			model.ChildState = source.ChildState;
			model.ChildZip = source.ChildZip;
			model.ChildPhone = source.ChildPhone;
			model.ChildEmail = source.ChildEmail;
			model.IsChildApplicationSigned = source.IsChildApplicationSigned;
			model.AgencyReferral = source.AgencyReferral;
			model.ReferralFirstName = source.ReferralFirstName;
			model.ReferralMiddleName = source.ReferralMiddleName;
			model.ReferralLastName = source.ReferralLastName;
			model.AgencyLine1 = source.AgencyLine1;
			model.AgencyLine2 = source.AgencyLine2;
			model.AgencyCity = source.AgencyCity;
			model.AgencyState = source.AgencyState;
			model.AgencyZip = source.AgencyZip;
			model.ReferralOrganization = source.ReferralOrganization;
			model.ReferralLine1 = source.ReferralLine1;
			model.ReferralLine2 = source.ReferralLine2;
			model.ReferralCity = source.ReferralCity;
			model.ReferralState = source.ReferralState;
			model.ReferralZip = source.ReferralZip;
			model.ReferralPhone = source.ReferralPhone;
			model.ReferralFax = source.ReferralFax;
			model.ReferralEmailAddress = source.ReferralEmailAddress;
			model.MembershipFee = source.MembershipFee;
			model.RegistrationFee = source.RegistrationFee;
			model.MembershipFee = source.MembershipFee;
			model.SessionType = source.SessionType;
			model.PerSessionFee = source.PerSessionFee;
			model.NumberOfsessions = source.NumberOfsessions;
			model.Tshirt = source.Tshirt;
			model.Trips = source.Trips;
			model.Transportation = source.Transportation;
			model.Meals = source.Meals;
			model.BeforeCare = source.BeforeCare;
			model.AfterCare = source.AfterCare;
			model.Other = source.Other;
			model.OtherDescription = source.OtherDescription;
			model.MembershipFee = source.MembershipFee;
			model.TotalCost = source.TotalCost;
			model.EncampDateList = source.EncampDateList;
			model.EncampmentDateFrom1 = source.EncampmentDateFrom1;
			model.EncampmentDateFrom2 = source.EncampmentDateFrom2;
			model.EncampmentDateFrom3 = source.EncampmentDateFrom3;
			model.EncampmentDateFrom4 = source.EncampmentDateFrom4;
			model.EncampmentDateTo1 = source.EncampmentDateTo1;
			model.EncampmentDateTo2 = source.EncampmentDateTo2;
			model.EncampmentDateTo3 = source.EncampmentDateTo3;
			model.EncampmentDateTo4 = source.EncampmentDateTo4;
			model.AmountRequested = source.AmountRequested;
			model.ExcessFeesOwnership = source.ExcessFeesOwnership;
			model.IsSigned = source.IsSigned;
			model.SignedBy = source.SignedBy;
			model.Title = source.Title;
			model.SignedOn = source.SignedOn;
			model.IOBoxRecs = source.IOBoxRecs;
			model.Camp = (source.Camp == null ? string.Empty : source.Camp);
			model.CampInfo = source.CampInfo;
		}

		private void copylocalcamp2Model(ref CampSite model, localCampSite source)
		{
			string empty;
			string str;
			string empty1;
			string str1;
			model.StatusStr = source.Statusstr;
			model.Status = source.Status;
			model.AppID = source.AppID;
			//model.Title = source.Title;
			model.Line1 = source.Line1;
			model.Line2 = source.Line2;
			model.City = source.City;
			model.State = source.State;
			model.Zip = source.Zip;
			CampSite camp = model;
			if (source.Phones == null)
			{
				empty = string.Empty;
			}
			else
			{
				empty = (source.Phones[0].Number == null ? string.Empty : source.Phones[0].Number);
			}
			camp.Phone = empty;
			CampSite camp1 = model;
			if (source.Emails == null)
			{
				str = string.Empty;
			}
			else
			{
				str = (source.Emails[0].EmailAddress == null ? string.Empty : source.Emails[0].EmailAddress);
			}
			camp1.Email = str;
			CampSite camp2 = model;
			if (source.Faxes == null)
			{
				empty1 = string.Empty;
			}
			else
			{
				empty1 = (source.Faxes[0].Number == null ? string.Empty : source.Faxes[0].Number);
			}
			camp2.Fax = empty1;
			CampSite camp3 = model;
			if (source.Weblink == null)
			{
				str1 = string.Empty;
			}
			else
			{
				str1 = (source.Weblink[0].WWW == null ? string.Empty : source.Weblink[0].WWW);
			}
			camp3.Website = str1;
		}

		private void copyModel2localCAF(localCAF model, ref localCAF dest)
		{
			dest.Reference = model.Reference;
			dest.AppID = model.AppID;
			dest.CAFAppID = model.CAFAppID;
			dest.CampSiteAppID = model.CampSiteAppID;
			dest.Agency = model.Agency; // JHF 10/15/20
			dest.AgencyReferralAppID = model.AgencyReferralAppID;
			dest.CampContactAppID = model.CampContactAppID;
			dest.ChildFirstName = model.ChildFirstName;
			dest.ChildMiddleName = model.ChildMiddleName;
			dest.ChildLastName = model.ChildLastName;
			dest.ParentFirstName = model.ParentFirstName;
			dest.ParentMiddleName = model.ParentMiddleName;
			dest.ParentLastName = model.ParentLastName;
			dest.ChildDOB = model.ChildDOB;
			dest.AxisI = model.AxisI;
			dest.AxisII = model.AxisII;
			dest.ChildAddressLine1 = model.ChildAddressLine1;
			dest.ChildAddressLine2 = model.ChildAddressLine2;
			dest.ChildCity = model.ChildCity;
			dest.ChildState = model.ChildState;
			dest.ChildZip = model.ChildZip;
			dest.ChildPhone = model.ChildPhone;
			dest.ChildEmail = model.ChildEmail;
			dest.IsChildApplicationSigned = model.IsChildApplicationSigned;
			dest.AgencyReferral = model.AgencyReferral;
			dest.ReferralFirstName = model.ReferralFirstName;
			dest.ReferralMiddleName = model.ReferralMiddleName;
			dest.ReferralLastName = model.ReferralLastName;
			dest.ReferralLine1 = model.ReferralLine1;
			dest.ReferralLine2 = model.ReferralLine2;
			dest.ReferralCity = model.ReferralCity;
			dest.ReferralState = model.ReferralState;
			dest.ReferralZip = model.ReferralZip;
			dest.ReferralOrganization = model.ReferralOrganization;
			dest.ReferralPhone = model.ReferralPhone;
			dest.ReferralFax = model.ReferralFax;
			dest.ReferralEmailAddress = model.ReferralEmailAddress;
			dest.MembershipFee = model.MembershipFee;
			dest.RegistrationFee = model.RegistrationFee;
			dest.MembershipFee = model.MembershipFee;
			dest.SessionType = model.SessionType;
			dest.PerSessionFee = model.PerSessionFee;
			dest.NumberOfsessions = model.NumberOfsessions;
			dest.Tshirt = model.Tshirt;
			dest.Trips = model.Trips;
			dest.Transportation = model.Transportation;
			dest.Meals = model.Meals;
			dest.BeforeCare = model.BeforeCare;
			dest.AfterCare = model.AfterCare;
			dest.Other = model.Other;
			dest.OtherDescription = model.OtherDescription;
			dest.MembershipFee = model.MembershipFee;
			dest.TotalCost = model.TotalCost;
			dest.EncampDateList = model.EncampDateList;
			dest.EncampmentDateFrom1 = model.EncampmentDateFrom1;
			dest.EncampmentDateFrom2 = model.EncampmentDateFrom2;
			dest.EncampmentDateFrom3 = model.EncampmentDateFrom3;
			dest.EncampmentDateFrom4 = model.EncampmentDateFrom4;
			dest.EncampmentDateTo1 = model.EncampmentDateTo1;
			dest.EncampmentDateTo2 = model.EncampmentDateTo2;
			dest.EncampmentDateTo3 = model.EncampmentDateTo3;
			dest.EncampmentDateTo4 = model.EncampmentDateTo4;
			dest.AmountRequested = model.AmountRequested;
			dest.ExcessFeesOwnership = model.ExcessFeesOwnership;
			dest.IsSigned = model.IsSigned;
			dest.SignedBy = model.SignedBy;
			dest.Title = model.Title;
			dest.SignedOn = model.SignedOn;
		}

		private void copyModel2localcamp(CampSite model, ref localCampSite destination)
		{
			destination.Statusstr = model.StatusStr;
			destination.Status = model.Status;
			destination.AppID = model.AppID;
			//destination.Title = model.Title;
			destination.Line1 = model.Line1;
			destination.Line2 = model.Line2;
			destination.City = model.City;
			destination.State = model.State;
			destination.Zip = model.Zip;
			localCampSite _localCamp = destination;
			com.rti.appcommon.Telephone[] telephoneArray = new com.rti.appcommon.Telephone[1];
			com.rti.appcommon.Telephone[] telephoneArray1 = telephoneArray;
			com.rti.appcommon.Telephone telephone = new com.rti.appcommon.Telephone()
			{
				Number = (model.Phone == null ? string.Empty : model.Phone),
				Index = 1,
				Type = "Main"
			};
			telephoneArray1[0] = telephone;
			_localCamp.Phones = telephoneArray;
			localCampSite _localCamp1 = destination;
			com.rti.appcommon.Email[] emailArray = new com.rti.appcommon.Email[1];
			com.rti.appcommon.Email[] emailArray1 = emailArray;
			com.rti.appcommon.Email email = new com.rti.appcommon.Email()
			{
				EmailAddress = (model.Email == null ? string.Empty : model.Email)
			};
			emailArray1[0] = email;
			_localCamp1.Emails = emailArray;
			localCampSite _localCamp2 = destination;
			com.rti.appcommon.Fax[] faxArray = new com.rti.appcommon.Fax[1];
			com.rti.appcommon.Fax[] faxArray1 = faxArray;
			com.rti.appcommon.Fax fax = new com.rti.appcommon.Fax()
			{
				Number = (model.Fax == null ? string.Empty : model.Fax),
				Index = 1,
				Type = "Main"
			};
			faxArray1[0] = fax;
			_localCamp2.Faxes = faxArray;
            localCampSite _localCamp3 = destination;
			com.rti.appcommon.URIweb[] uRIwebArray = new com.rti.appcommon.URIweb[1];
			com.rti.appcommon.URIweb[] uRIwebArray1 = uRIwebArray;
			com.rti.appcommon.URIweb uRIweb = new com.rti.appcommon.URIweb()
			{
				WWW = (model.Website == null ? string.Empty : model.Website)
			};
			uRIwebArray1[0] = uRIweb;
			_localCamp3.Weblink = uRIwebArray;
		}

		public ActionResult Create()
		{
			return base.View();
		}

		public static string CreateFileFromByteArray(byte[] bytFileContents, string strFileName)
		{
			string str = System.Web.HttpContext.Current.Server.MapPath("../../PDF");
			DirectoryInfo directoryInfo = new DirectoryInfo(str);
			if (!directoryInfo.Exists)
			{
				directoryInfo.Create();
			}
			string str1 = string.Concat(str, "\\", strFileName);
			if (str1.IndexOf(".pdf") == -1)
			{
				str1 = string.Concat(str1, ".pdf");
			}
			try
			{
				byte[] numArray = bytFileContents;
				if (System.IO.File.Exists(str1))
				{
                    System.IO.File.Delete(str1);
				}
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

		public ActionResult DeleteAcc(int id, int cafAppID, string ioRecType)
		{
			WebSessionManager.deleteAttachment(base.Session["usertoken"].ToString(), id, cafAppID, ioRecType);
			return base.RedirectToAction("TCAF", "CAF", new { Id = cafAppID });
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

		public List<localCampSiteListItem> GetRecordsPerPage(int currentPage, int recordsPerPage, string sortCriteria, List<localCampSiteListItem> model)
		{
			List<localCampSiteListItem> list;
			if (currentPage < 1)
			{
				currentPage = 1;
			}
			try
			{
				list = (
					from o in model
					orderby o.Title
					select o).Skip<localCampSiteListItem>((currentPage - 1) * recordsPerPage).Take<localCampSiteListItem>(recordsPerPage).ToList<localCampSiteListItem>();
			}
			catch
			{
				list = null;
			}
			return list;
		}

		public ActionResult ListOfCamps(string Id, int page = 1)
		{
			int num = 0;
			int num1 = 10;
			string empty = string.Empty;
			if (base.TempData["searchtext"] != null && base.Request.Url.ToString().Contains<char>('&'))
			{
				empty = base.TempData["searchtext"].ToString();
				base.TempData["searchtext"] =  empty;
				base.ViewData["searchtext"] =  empty;
			}
			if (!string.IsNullOrEmpty(Id))
			{
				localCampSite _localCamp = new localCampSite();
				_localCamp = WebSessionManager.getCampRecord((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], Convert.ToInt32(Id));
				base.Session["Camp"] = _localCamp;
				return this.PartialView("SelectedCamp", _localCamp);
			}
			localCampSite _localCamp1 = new localCampSite();
			List<localCampSiteListItem> campList = WebSessionManager.getCampList((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"]);
			num = campList.Count<localCampSiteListItem>();
			if (base.Session["Camp"] != null)
			{
				object item = base.Session["Camp"];
			}
			if (!string.IsNullOrEmpty(empty))
			{
				base.TempData["searchtext"] =  empty;
				string lower = empty.Trim().ToLower();
				IEnumerable<localCampSiteListItem> localCampListItems = campList.Where<localCampSiteListItem>((localCampSiteListItem a) => {
					if (a.Title.ToLower().Contains(lower))
					{
						return true;
					}
					return a.Address.ToLower().Contains(lower);
				});
				campList = localCampListItems.ToList<localCampSiteListItem>();
				num = campList.Count<localCampSiteListItem>();
			}
			campList = this.GetRecordsPerPage(page, num1, "", campList);
			PagedCAMPList cAFList = (new PagedCAMPList(num1, page, num, campList)).GetCAFList();
			base.Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
			base.Response.Cache.SetCacheability(HttpCacheability.NoCache);
			base.Response.Cache.SetNoStore();
			return base.PartialView(cAFList);
		}

		[HttpPost]
		public ActionResult ListOfCamps(localCampSite camp, string txtSearchCampff)
		{
			int num = 0;
			int num1 = 1;
			int num2 = 10;
			base.ViewData["searchtext"] =  txtSearchCampff;
			List<localCampSiteListItem> campList = WebSessionManager.getCampList((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"]);
			num = campList.Count<localCampSiteListItem>();
			if (string.IsNullOrEmpty(txtSearchCampff))
			{
				base.TempData["searchtext"] =  "";
			}
			else
			{
				base.TempData["searchtext"] =  txtSearchCampff;
				string lower = txtSearchCampff.Trim().ToLower();
				IEnumerable<localCampSiteListItem> localCampListItems = campList.Where<localCampSiteListItem>((localCampSiteListItem a) => {
					if (a.Title.ToLower().Contains(lower))
					{
						return true;
					}
					return a.Address.ToLower().Contains(lower);
				});
				campList = localCampListItems.ToList<localCampSiteListItem>();
				num = campList.Count<localCampSiteListItem>();
			}
			campList = this.GetRecordsPerPage(num1, num2, "", campList);
			PagedCAMPList cAFList = (new PagedCAMPList(num2, num1, num, campList)).GetCAFList();
			base.Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
			base.Response.Cache.SetCacheability(HttpCacheability.NoCache);
			base.Response.Cache.SetNoStore();
			return base.View(cAFList);
		}

		public ViewResult NewCAF()
		{
			string newCAFReference = WebSessionManager.getNewCAFReference((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"]);
			base.ViewData["CafRefNum"] =  newCAFReference;
			return base.View();
		}

		[HttpPost]
		public ActionResult NewCAF(localCAF caf)
		{
			string str = "save";
			if (base.Request.Form["hdnCtrlId"] != null)
			{
				str = base.Request.Form["hdnCtrlId"].ToString();
			}
			if (base.Request.Form["CafRefNum"] != null)
			{
				base.Request.Form["CafRefNum"].ToString();
			}
			string newCAFReference = WebSessionManager.getNewCAFReference((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"]);
			base.ViewData["CafRefNum"] =  newCAFReference;
			if (base.Session["agent"] != null)
			{
				localAgencyContact _localAgencyContact = new localAgencyContact();
				WebSessionManager.getAgencyContactRecord((int)base.Session["usertoken"], caf.AgencyContactAppID);
			}
			if (base.Session["agency"] != null)
			{
				localAgency _localAgency = new localAgency();
				WebSessionManager.getAgencyRecord((int)base.Session["usertoken"], (int)base.Session["agentAppID"], caf.AgencyAppID);
			}
			if (str.ToLower() == "submit")
			{
				if (base.Session["Camp"] != null)
				{
				}
				return base.View();
			}
			object item = base.Session["Camp"];
			return base.RedirectToAction("NewCAF", "CAF", new { Id = caf.AppID });
		}

		public ActionResult NewCamp()
		{
			CampSite camp = new CampSite();
			base.Session["newCampSiteAppID"] = 0;
			base.ViewData["newCampSiteAppIDvd"] =  0;
			base.ViewData["CampInserted"] =  "22";
			return base.View(camp);
		}

		[HttpPost]
		public ActionResult NewCamp(CampSite model)
		{
			localCampSite _localCamp = new localCampSite();
			int item = (int)base.Session["newCampSiteAppID"];
			if (item != 0)
			{
				model.AppID = item;
				model.Status = (int)base.Session["campStatus"];
			}
			try
			{
				this.copyModel2localcamp(model, ref _localCamp);
				int num = WebSessionManager.saveCampRecord((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], _localCamp);
				if (num > 0)
				{
					_localCamp = WebSessionManager.getCampRecord((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], num);
					this.copylocalcamp2Model(ref model, _localCamp);
					base.Session["newCampSiteAppID"] = num;
					base.ViewData["newCampSideAppIDvd"] =  num;
					base.Session["campStatus"] = model.Status;
					if ((string)base.ViewData["CampInserted"] != "1")
					{
						base.ViewData["CampInserted"] =  "1";
					}
					else
					{
						base.ViewData["CampInserted"] =  "-1";
					}
				}
				else
				{
					model.AppID = 0;
					base.ViewData["CampInserted"] =  "-1";
				}
			}
			catch (Exception exception)
			{
				base.ViewData["CampInserted"] =  "2";
			}
			return base.View("NewCamp", model);
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
				byte[] fileContents = CAFController.GetFileContents(fileInfo.FullName);
				memoryStream.Write(fileContents, 0, (int)fileContents.Length);
				memoryStream.Position = (long)0;
				base.HttpContext.Response.AddHeader("content-disposition", string.Concat("attachment; filename=", fileInfo.Name));
			}
			return new FileStreamResult(memoryStream, "application/pdf");
		}

		public int saveCAF(ref localCAF model, int id)
		{
			localCAF _localCAF = new localCAF();
			localCampSite item = (localCampSite)base.Session["Camp"];
			if (id <= 0)
			{
				this.copyModel2localCAF(model, ref _localCAF);
				int num = WebSessionManager.saveNewCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], _localCAF);
				if (num == -1)
				{
					base.ViewData["CafRefNum3"] =  "-";
					base.Session["SessionCafRefNum"] = "-";
					base.ViewData["CAFStatusT"] =  "*";
					return model.AppID;
				}
				_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], num);
				string.Concat("New CAF with Reference # ", _localCAF.Reference, " created");
				this.copylocalCAF2Model(ref model, _localCAF);
				base.ViewData["CafRefNum3"] =  _localCAF.Reference;
				base.Session["SessionCafRefNum"] = _localCAF.Reference;
				base.ViewData["CAFStatusT"] =  _localCAF.Status;
				return num;
			}
			_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
			if (_localCAF.StatusInt == 10 || _localCAF.StatusInt == 30)
			{
				this.copyModel2localCAF(model, ref _localCAF);
				if (!WebSessionManager.saveCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], _localCAF))
				{
					base.ViewData["CafRefNum3"] =  "-";
					base.Session["SessionCafRefNum"] = "-";
					base.ViewData["CAFStatusT"] =  "*";
				}
				else
				{
					_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
					string.Concat(_localCAF.Reference, " saved");
					this.copylocalCAF2Model(ref model, _localCAF);
					base.ViewData["CafRefNum3"] =  _localCAF.Reference;
					base.Session["SessionCafRefNum"] = _localCAF.Reference;
					base.ViewData["CAFStatusT"] =  _localCAF.Status;
				}
			}
			else
			{
				base.ViewData["CafRefNum3"] =  "-";
				base.Session["SessionCafRefNum"] = "-";
				base.ViewData["CAFStatusT"] =  "*";
			}
			return id;
		}

		[ChildActionOnly]
		public ActionResult SelectedCamp(int Id)
		{
			localCampSite campRecord = WebSessionManager.getCampRecord((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], Id);
			base.ViewData["objCamp"] =  campRecord;
			base.Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
			base.Response.Cache.SetCacheability(HttpCacheability.NoCache);
			base.Response.Cache.SetNoStore();
			return base.PartialView(campRecord);
		}

		public ViewResult TCAF(int id, localCAF model, string reason)
		{
			//reason = "testingJHF"; // JHF 04162021
			if (reason != null)
			{
				if (!reason.Contains<char>('\n'))
				{
					base.ModelState.AddModelError("", reason);
				}
				else
				{
					string[] strArrays = reason.Split(new char[] { '\n' });
					for (int i = 0; i < (int)strArrays.Length; i++)
					{
						string str = strArrays[i];
						base.ModelState.AddModelError("", str);
					}
				}
			}
			localCAF _localCAF = new localCAF();
			if (model == null)
			{
				model = new localCAF();
			}
			if (id > 0)
			{
				_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
				this.copylocalCAF2Model(ref model, _localCAF);
				string reference = model.Reference;
				base.ViewData["CafRefNum3"] =  reference.Trim();
				base.Session["SessionCafRefNum"] = reference.Trim();
				string statusAgencyStr = model.StatusAgencyStr;
				base.ViewData["CAFStatusT"] =  statusAgencyStr;
				List<string> strs = new List<string>();
				List<int> nums = new List<int>();
				localIOBox[] oBoxRecs = model.IOBoxRecs;
				for (int j = 0; j < (int)oBoxRecs.Length; j++)
				{
					nums.AddRange(oBoxRecs[j].DocAppIDs);
				}
				foreach (int num in nums)
				{
					strs.AddRange(WebSessionManager.getPDFFileContentsByIndex(num));
				}
				((dynamic)base.ViewBag).Message = string.Empty;
				if (strs.Count <= 0)
				{
					((dynamic)base.ViewBag).Message = "../../PCamp/Empty.pdf";
				}
				else
				{
					FileInfo fileInfo = new FileInfo(strs[0]);
					((dynamic)base.ViewBag).Message = string.Concat("../../PDF/", fileInfo.Name);
				}
				bool hideSubmitForNewCAFFlag = WebSessionManager.getHideSubmitForNewCAFFlag();
				base.ViewData["HideSubmit"] =  hideSubmitForNewCAFFlag;
				return base.View(model);
			}
			if (id != 0)
			{
				localCAF cAFrec = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
				string reference1 = cAFrec.Reference;
				base.ViewData["CafRefNum3"] =  reference1;
				((dynamic)base.ViewBag).Message = "../../PCamp/Empty.pdf";
				bool flag = WebSessionManager.getHideSubmitForNewCAFFlag();
				base.ViewData["HideSubmit"] =  flag;
				return base.View();
			}
			_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
			string empty = string.Empty;
			empty = WebSessionManager.getNewCAFReference((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"]);
			base.ViewData["CafRefNum3"] =  empty;
			base.Session["SessionCafRefNum"] = empty.Trim();
			base.ViewData["CAFStatusT"] =  "New";
			_localCAF.Reference = empty;
			((dynamic)base.ViewBag).Message = "../../PCamp/Empty.pdf";
			bool hideSubmitForNewCAFFlag1 = WebSessionManager.getHideSubmitForNewCAFFlag();
			base.ViewData["HideSubmit"] =  hideSubmitForNewCAFFlag1;
			return base.View(_localCAF);
		}

		[ActionName("TCAF")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="AttachTcaf")]
		public ActionResult TCAFAttachBtn(localCAF model, int id)
		{
			id = this.saveCAF(ref model, id);
			return base.RedirectToAction("AttachDocsTCAF", "CAF", new { Id = id });
		}

		[ActionName("TCAF")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="PrintTcaf")]
		public ActionResult TCAFPrintBtn(localCAF model, int id)
		{
			id = this.saveCAF(ref model, id);
			return base.RedirectToAction("PrintCAF", "print", new { id = model.AppID });
		}

		[ActionName("TCAF")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="PrintLettersTcaf")]
		public ActionResult TCAFPrintLettersBtn(localCAF model, int id)
		{
			return base.View();
		}

		[ActionName("TCAF")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="SaveTcaf")]
		public ActionResult TCAFSaveBtn(localCAF model, int id)
		{
			id = this.saveCAF(ref model, id);
			return base.RedirectToAction("TCAF", "CAF", new { Id = id, model = model });
		}

		public ActionResult TCAFSaveBtn_old(localCAF model, int id)
		{
			localCAF _localCAF = new localCAF();
			localCampSite item = (localCampSite)base.Session["Camp"];
			if (id <= 0)
			{
				this.copyModel2localCAF(model, ref _localCAF);
				int num = WebSessionManager.saveNewCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], _localCAF);
				if (num == -1)
				{
					base.ViewData["CafRefNum3"] =  "-";
					base.Session["SessionCafRefNum"] = "-";
					base.ViewData["CAFStatusT"] =  "*";
					return base.RedirectToAction("TCAF", "CAF", new { id = model.AppID, model = model });
				}
				_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], num);
				string.Concat("New CAF with Reference # ", _localCAF.Reference, " created");
				this.copylocalCAF2Model(ref model, _localCAF);
				base.ViewData["CafRefNum3"] =  _localCAF.Reference;
				base.Session["SessionCafRefNum"] = _localCAF.Reference;
				base.ViewData["CAFStatusT"] =  _localCAF.Status;
				return base.RedirectToAction("TCAF", "CAF", new { id = num, model = model });
			}
			_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
			if (_localCAF.StatusInt == 10 || _localCAF.StatusInt == 30)
			{
				this.copyModel2localCAF(model, ref _localCAF);
				if (!WebSessionManager.saveCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], _localCAF))
				{
					base.ViewData["CafRefNum3"] =  "-";
					base.Session["SessionCafRefNum"] = "-";
					base.ViewData["CAFStatusT"] =  "*";
				}
				else
				{
					_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
					string.Concat(_localCAF.Reference, " saved");
					this.copylocalCAF2Model(ref model, _localCAF);
					base.ViewData["CafRefNum3"] =  _localCAF.Reference;
					base.Session["SessionCafRefNum"] = _localCAF.Reference;
					base.ViewData["CAFStatusT"] =  _localCAF.Status;
				}
			}
			else
			{
				base.ViewData["CafRefNum3"] =  "-";
				base.Session["SessionCafRefNum"] = "-";
				base.ViewData["CAFStatusT"] =  "*";
			}
			return base.RedirectToAction("TCAF", "CAF", new { Id = id });
		}

		[ActionName("TCAF")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="SubmitTcaf")]
		public ActionResult TCAFSubmitBtn(localCAF model, int id)
		{
			localCAF _localCAF = new localCAF();
			string str = "";
			if (id <= 0)
			{
				this.copyModel2localCAF(model, ref _localCAF);
				int num = WebSessionManager.saveNewCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], _localCAF);
				if (num != -1)
				{
					_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], num);
					string.Concat("New CAF with Reference # ", _localCAF.Reference, " created");
					this.copylocalCAF2Model(ref model, _localCAF);
					base.ViewData["CafRefNum3"] =  _localCAF.Reference;
					base.Session["SessionCafRefNum"] = _localCAF.Reference;
					base.ViewData["CAFStatusT"] =  _localCAF.Status;
					if (WebSessionManager.setSubmitFlag((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], num, out str))
					{
						_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], num);
						string.Concat(_localCAF.Reference, " submitted");
						this.copylocalCAF2Model(ref model, _localCAF);
						base.ViewData["CafRefNum3"] =  _localCAF.Reference;
						base.Session["SessionCafRefNum"] = _localCAF.Reference;
						base.ViewData["CAFStatusT"] =  _localCAF.Status;
						return base.RedirectToAction("CoverSheet", "Print", new { Id = num, target = "_blank" });
					}
					_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], num);
					this.copylocalCAF2Model(ref model, _localCAF);
					base.ViewData["CafRefNum3"] =  _localCAF.Reference;
					base.Session["SessionCafRefNum"] = _localCAF.Reference;
					base.ViewData["CAFStatusT"] =  _localCAF.Status;
					if (!str.Contains<char>('\n'))
					{
						base.ModelState.AddModelError("", str);
					}
					else
					{
						string[] strArrays = str.Split(new char[] { '\n' });
						for (int i = 0; i < (int)strArrays.Length; i++)
						{
							string str1 = strArrays[i];
							base.ModelState.AddModelError("", str1);
						}
					}
				}
				else
				{
					base.ViewData["CafRefNum3"] =  "-";
					base.Session["SessionCafRefNum"] = "-";
					base.ViewData["CAFStatusT"] =  "*";
				}
				return base.RedirectToAction("TCAF", "CAF", new { Id = num, reason = str });
			}
			_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
			if (_localCAF.StatusInt == 10 || _localCAF.StatusInt == 30)
			{
				this.copyModel2localCAF(model, ref _localCAF);
				if (!WebSessionManager.saveCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], _localCAF))
				{
					base.ViewData["CafRefNum3"] = "-";
					base.Session["SessionCafRefNum"] = "-";
					base.ViewData["CAFStatusT"] = "*";
				}
				else
				{
					_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
					string.Concat(_localCAF.Reference, " saved");
					this.copylocalCAF2Model(ref model, _localCAF);
					base.ViewData["CafRefNum3"] = _localCAF.Reference;
					base.Session["SessionCafRefNum"] = _localCAF.Reference;
					base.ViewData["CAFStatusT"] = _localCAF.Status;
					if (WebSessionManager.setSubmitFlag((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id, out str))
					{
						_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
						string.Concat(_localCAF.Reference, " submitted");
						this.copylocalCAF2Model(ref model, _localCAF);
						base.ViewData["CafRefNum3"] = _localCAF.Reference;
						base.Session["SessionCafRefNum"] = _localCAF.Reference;
						base.ViewData["CAFStatusT"] =  _localCAF.Status;
						return base.RedirectToAction("CoverSheet", "Print", new { Id = id, target = "_blank" });
					}
					_localCAF = WebSessionManager.getCAFrec((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], id);
					this.copylocalCAF2Model(ref model, _localCAF);
					base.ViewData["CafRefNum3"] = _localCAF.Reference;
					base.Session["SessionCafRefNum"] = _localCAF.Reference;
					base.ViewData["CAFStatusT"] = _localCAF.Status;
					if (!str.Contains<char>('\n'))
					{
						base.ModelState.AddModelError("", str);
					}
					else
					{
						string[] strArrays1 = str.Split(new char[] { '\n' });
						for (int j = 0; j < (int)strArrays1.Length; j++)
						{
							string str2 = strArrays1[j];
							base.ModelState.AddModelError("", str2);
						}
					}
				}
			}
			else
			{
				base.ViewData["CafRefNum3"] = "-";
				base.Session["SessionCafRefNum"] = "-";
				base.ViewData["CAFStatusT"] = "*";
			}
			return base.RedirectToAction("TCAF", "CAF", new { Id = id, reason = str });
		}

		public ActionResult UploadFiles()
		{
			return base.View();
		}
	}
}