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
using System.Net;
using System.Net.Mail;
using System.Runtime.CompilerServices;
using System.Security.Principal;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace com.rti.tailspinnew.web
{
	[HandleError]
	public class AccountController : Controller
	{
		private static string preloginMessage;

		private RegistrationManager context = new RegistrationManager();

		public RegisterModel registrationviewmodel
		{
			get;
			set;
		}

		public string returnUrl
		{
			get;
			set;
		}

		static AccountController()
		{
			AccountController.preloginMessage = "";
		}

		public AccountController()
		{
		}

		public ViewResult AgencyContactRegistration(int? id, string screenMessage, string formtitle)
		{
			ClearCache.ClearAllCache();
			localAgencyContact _localAgencyContact = new localAgencyContact();
			localAgencyContact _localAgencyContact1 = new localAgencyContact();
			if (!id.HasValue)
			{
				id = new int?(0);
			}
			int? nullable = id;
			if ((nullable.GetValueOrDefault() != 0 ? true : !nullable.HasValue))
			{
				_localAgencyContact = WebSessionManager.getAgencyContactRecord((int)base.Session["usertoken"], id.Value);
				this.copylocalAgencyContact2Model(ref _localAgencyContact1, _localAgencyContact);
				if (screenMessage != null)
				{
					base.ViewData["Messages"] =  screenMessage;
					((dynamic)base.ViewBag).Message = formtitle;
				}
				else
				{
					base.ViewData["Messages"] =  " ";
					((dynamic)base.ViewBag).Message = "Update User";
				}
			}
			else
			{
				base.ViewData["Messages"] =  " ";
				((dynamic)base.ViewBag).Message = "Add User";
			}
            return base.View("AgencyContactRegistration", _localAgencyContact1);
            //return base.View("AgencyUsersList", _localAgencyContact1); // JHF test 02232021
        }

        //[HttpGet]
        //public ActionResult Attach() // JHF 10/20/20
        //{
        //    return base.RedirectToAction("CampSiteAttachments", "Account");
        //}

        [ActionName("AttachToCampSite")]
        [HttpPost]
        [LinkActionToButtonName(SubmitButtonName = "CancelAttach")]
        public ActionResult CancelAttachDocs(int Id)
        {
            return base.RedirectToAction("CampSiteAttachmnts", "Account", new { Id = Id });
        }

        [ActionName("CampSiteAttachmnts")]
        [HttpPost]
        [LinkActionToButtonName(SubmitButtonName = "AttachToCmpSite")]
        public ActionResult AttachToCmpSite(localCampSite model, int id)
        {
            //id = this.saveCAF(ref model, id);
            return base.RedirectToAction("AttachToCampSite", "Account", new { Id = id });
        }

        public ActionResult AttachToCampSite(int Id) // JHF 10/20/20
        {
            localCampSite _localCampSite = new localCampSite();
            if (base.Request.RequestType.ToUpper() != "POST")
            {
                return base.View(_localCampSite);
            }
            string[] str = new string[3];
            string[] str2 = new string[3];
            if (base.Request.Form["AttachmentType1"] != null)
            {
                str[0] = base.Request.Form["AttachmentType1"].ToString();
                str2[0] = base.Request.Form["expirdate1"].ToString(); // JHF 10/23/20 temporary
            }
            if (base.Request.Form["AttachmentType2"] != null)
            {
                str[1] = base.Request.Form["AttachmentType2"].ToString();
                str2[1] = base.Request.Form["expirdate2"].ToString();
            }
            if (base.Request.Form["AttachmentType3"] != null)
            {
                str[2] = base.Request.Form["AttachmentType3"].ToString();
                str2[2] = base.Request.Form["expirdate3"].ToString();
            }
            //if (base.Request.Form["AttachmentType4"] != null)
            //{
            //    str[3] = base.Request.Form["AttachmentType4"].ToString();
            //}
            //if (base.Request.Form["AttachmentType5"] != null)
            //{
            //    str[4] = base.Request.Form["AttachmentType5"].ToString();
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
                    WebSessionManager.AddAttachmentToCampSite((int)base.Session["usertoken"], (int)base.Session["CampSiteAppId"], fileName, str1, numArray, str[i], DateTime.Parse(str2[i])); // JHF 10/21/20
                }
            }
            //return base.RedirectToAction("TCAF", "CAF", new { Id = Id });
            //return base.RedirectToAction("CampSitesList", "Account"); // JHF 10/20/20
            return base.RedirectToAction("CampSiteAttachmnts", "Account", new { Id = Id });
        }



        public ViewResult CampContactRegistration(int? id, string screenMessage, string formtitle)
        {
            ClearCache.ClearAllCache();
            localCampContact _localCampContact = new localCampContact();
            localCampContact _localCampContact1 = new localCampContact();
            if (!id.HasValue)
            {
                id = new int?(0);
            }
            int? nullable = id;
            if ((nullable.GetValueOrDefault() != 0 ? true : !nullable.HasValue))
            {
                _localCampContact = WebSessionManager.getCampContactRecord((int)base.Session["usertoken"], id.Value);
                this.copylocalCampContact2Model(ref _localCampContact1, _localCampContact);
                if (screenMessage != null)
                {
                    base.ViewData["Messages"] = screenMessage;
                    ((dynamic)base.ViewBag).Message = formtitle;
                }
                else
                {
                    base.ViewData["Messages"] = " ";
                    ((dynamic)base.ViewBag).Message = "Update User";
                }
            }
            else
            {
                base.ViewData["Messages"] = " ";
                ((dynamic)base.ViewBag).Message = "Add User";
            }
            return base.View("CampContactRegistration", _localCampContact1);
        }

        public ViewResult CampSiteAttachmnts(int id, localCampSite model, string reason) // JHF 10/26/20 still in progress...
        {
            //if (reason != null)
            //{
            //    if (!reason.Contains<char>('\n'))
            //    {
            //        base.ModelState.AddModelError("", reason);
            //    }
            //    else
            //    {
            //        string[] strArrays = reason.Split(new char[] { '\n' });
            //        for (int i = 0; i < (int)strArrays.Length; i++)
            //        {
            //            string str = strArrays[i];
            //            base.ModelState.AddModelError("", str);
            //        }
            //    }
            //}
            base.Session["campsiteAppId"] = id; // JHF 12/7/20
            localCampSite _localCampSite = new localCampSite();
            if (model == null)
            {
                model = new localCampSite();
            }
            if (id > 0)
            {
                _localCampSite = WebSessionManager.getCampSiterec((int)base.Session["campsiteAppId"]);
                this.copylocalCampSite2Model(ref model, _localCampSite);
                base.ViewData["CampSiteName"] = model.SiteName;
                base.ViewData["CampSiteStatus"] = model.Status;
                //string reference = model.Reference;
                //base.ViewData["CafRefNum3"] = reference.Trim();
                //base.Session["SessionCafRefNum"] = reference.Trim();
                //string statusAgencyStr = model.StatusAgencyStr;
                //base.ViewData["CAFStatusT"] = statusAgencyStr;
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
                //bool hideSubmitForNewCAFFlag = WebSessionManager.getHideSubmitForNewCAFFlag();
                //base.ViewData["HideSubmit"] = hideSubmitForNewCAFFlag;
                return base.View(model);
            }
            if (id != 0)
            {
                localCampSite campSiterec = WebSessionManager.getCampSiterec((int)base.Session["campsiteAppId"]);
                //string reference1 = cAFrec.Reference;
                //base.ViewData["CafRefNum3"] = reference1;
                ((dynamic)base.ViewBag).Message = "../../PCamp/Empty.pdf";
                //bool flag = WebSessionManager.getHideSubmitForNewCAFFlag();
                //base.ViewData["HideSubmit"] = flag;
                return base.View();
            }
            _localCampSite = WebSessionManager.getCampSiterec((int)base.Session["campsiteAppId"]);
            //string empty = string.Empty;
            //empty = WebSessionManager.getNewCAFReference((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"]);
            //base.ViewData["CafRefNum3"] = empty;
            //base.Session["SessionCafRefNum"] = empty.Trim();
            //base.ViewData["CAFStatusT"] = "New";
            //_localCAF.Reference = empty;
            ((dynamic)base.ViewBag).Message = "../../PCamp/Empty.pdf";
            //bool hideSubmitForNewCAFFlag1 = WebSessionManager.getHideSubmitForNewCAFFlag();
            //base.ViewData["HideSubmit"] = hideSubmitForNewCAFFlag1;
            return base.View(_localCampSite);
        }

        public ViewResult CampSiteRegistration(int? id, string screenMessage, string formtitle) // JHF
        {
            //id = 988848; // JHF test 9/23/20
            ClearCache.ClearAllCache();
            localCampSite _localCampSite = new localCampSite();
            localCampSite _localCampSite1 = new localCampSite();
            _localCampSite1.CampCorpAppID = (int)base.Session["campcorpAppId"]; // JHF new 9/30/20
            if (!id.HasValue)
            {
                id = new int?(0);
            }
            int? nullable = id;
            if ((nullable.GetValueOrDefault() != 0 ? true : !nullable.HasValue))
            {
                _localCampSite = WebSessionManager.getCampSiteRecord((int)base.Session["usertoken"], id.Value);
                this.copylocalCampSite2Model(ref _localCampSite1, _localCampSite); // JHF fills new camp site form after creation
                if (screenMessage != null)
                {
                    base.ViewData["Messages"] = screenMessage;
                    ((dynamic)base.ViewBag).Message = formtitle;
                }
                else
                {
                    base.ViewData["Messages"] = " ";
                    ((dynamic)base.ViewBag).Message = "Update Site";
                }
            }
            else
            {
                base.ViewData["Messages"] = " ";
                ((dynamic)base.ViewBag).Message = "Add Site";
            }
            return base.View("CampSiteRegistration", _localCampSite1);
        }

        [ActionName("CampSiteRegistration")] //JHF
        [HttpPost]
        [LinkActionToButtonName(SubmitButtonName = "CampSiteRegistration")]
        public ActionResult CampSiteRegistration(localCampSite model) //localCampSite model)
        {
            bool flag;
            string str;
            ClearCache.ClearAllCache();
            model.CampCorpAppID = (int)Session["campcorpAppId"]; // JHF new 9/30/20
            string str1 = " ";
            string str2 = " ";
            if (base.ModelState.IsValid)
            {
                bool flag1 = false;
                if (model.AppID == 0)
                {
                    flag1 = true;
                }
                if (!flag1)
                {
                    flag = this.updatelocalCampSiteProfile(ref model);
                }
                else
                {
                    flag = this.createNewlocalCampSiteProfile(ref model, out str);
                    if (!flag)
                    {
                        ((dynamic)base.ViewBag).Message = " ";
                        base.ModelState.AddModelError("", str);
                        return base.View(model);
                    }
                }
                if (flag)
                {
                    if (!flag1)
                    {
                        str2 = "Update Camp Site";
                        str1 = "Camp site profile updated successfully";
                    }
                    else
                    {
                        str2 = "Add Camp Site";
                        str1 = "Camp site profile created successfully"; // JHF 9/30/20
                        //string[] firstName = new string[] { model.FirstName, " ", model.LastName, " added successfully. An email with temporary password has been sent to ", model.Emails[0].EmailAddress };
                        //str1 = string.Concat(firstName);
                    }
                }
                else if (!flag1)
                {
                    str2 = "Update Camp Site";
                    str1 = "Sorry, there was a problem when updating the site profile. Please try again.";
                }
                else
                {
                    str2 = "Add Camp Site";
                    str1 = "Sorry, there was a problem when adding the site profile. Please try again.";
                }
            }
            //return base.RedirectToAction("CampSiteRegistration", "Account", new { id = 6, screenMessage = str1, formtitle = str2 }); //model.AppID, screenMessage = str1, formtitle = str2 });
            return base.RedirectToAction("CampSiteRegistration", "Account", new { id = model.AppID, screenMessage = str1, formtitle = str2 });
        }

        public ViewResult UpdateCampCorpProfile(int? id, string screenMessage, string formtitle)
        {
            ClearCache.ClearAllCache();
            localCampCorp _localCampCorp = new localCampCorp();
            localCampCorp _localCampCorp1 = new localCampCorp();
            if (!id.HasValue)
            {
                id = new int?(0);
            }
            int? nullable = id;
            //if ((nullable.GetValueOrDefault() != 0 ? true : !nullable.HasValue))
            //{
            //    _localCampCorp = WebSessionManager.getCampCorpRecord((int)base.Session["usertoken"], id.Value);
            //    this.copylocalCampCorp2Model(ref _localCampCorp1, _localCampCorp);
            //    if (screenMessage != null)
            //    {
            //        base.ViewData["Messages"] = screenMessage;
            //        ((dynamic)base.ViewBag).Message = formtitle;
            //    }
            //    else
            //    {
            //        base.ViewData["Messages"] = " ";
            //        ((dynamic)base.ViewBag).Message = "Update User";
            //    }
            //}
            //else
            //{
            //    base.ViewData["Messages"] = " ";
            //    ((dynamic)base.ViewBag).Message = "Add User";
            //}
            return base.View("UpdateCampCorpProfile", _localCampCorp1);
        }

        [ActionName("AgencyContactRegistration")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="UpdateAgencyContact")]
		public ActionResult AgencyContactRegistration(localAgencyContact model)
		{
			bool flag;
			string str;
			ClearCache.ClearAllCache();
			string str1 = " ";
			string str2 = " ";
			if (base.ModelState.IsValid)
			{
				bool flag1 = false;
				if (model.AppID == 0)
				{
					flag1 = true;
				}
				if (!flag1)
				{
					flag = this.updatelocalAgencyUserProfile(ref model);
				}
				else
				{
					flag = this.createNewlocalAgencyUserProfile(ref model, out str);
					if (!flag)
					{
						((dynamic)base.ViewBag).Message = " ";
						base.ModelState.AddModelError("", str);
						return base.View(model);
					}
				}
				if (flag)
				{
					if (!flag1)
					{
						str2 = "Update User";
						str1 = "User profile updated successfully";
					}
					else
					{
						str2 = "Add User";
						string[] firstName = new string[] { model.FirstName, " ", model.LastName, " added successfully. An email with temporary password has been sent to ", model.Emails[0].EmailAddress };
						str1 = string.Concat(firstName);
					}
				}
				else if (!flag1)
				{
					str2 = "Update User";
					str1 = "Sorry, there was a problem when updating the profile. Please try again.";
				}
				else
				{
					str2 = "Add User";
					str1 = "Sorry, there was a problem when adding the profile. Please try again.";
				}
			}
            //return base.RedirectToAction("AgencyContactRegistration", "Account", new { id = model.AppID, screenMessage = str1, formtitle = str2 });
            return base.RedirectToAction("AgencyUsersList", "Account"); // JHF test 02232021

        }

        [ActionName("CampContactRegistration")]
        [HttpPost]
        [LinkActionToButtonName(SubmitButtonName = "UpdateCampContact")]
        public ActionResult CampContactRegistration(localCampContact model)
        {
            bool flag;
            string str;
            ClearCache.ClearAllCache();
            string str1 = " ";
            string str2 = " ";
            if (base.ModelState.IsValid)
            {
                bool flag1 = false;
                if (model.AppID == 0)
                {
                    flag1 = true;
                }
                if (!flag1)
                {
                    flag = this.updatelocalCampContactProfile(ref model);
                }
                else
                {
                    flag = this.createNewlocalCampContactProfile(ref model, out str);
                    if (!flag)
                    {
                        ((dynamic)base.ViewBag).Message = " ";
                        base.ModelState.AddModelError("", str);
                        return base.View(model);
                    }
                }
                if (flag)
                {
                    if (!flag1)
                    {
                        str2 = "Update Camp User";
                        str1 = "Camp User profile updated successfully";
                    }
                    else
                    {
                        str2 = "Add Camp User";
                        string[] firstName = new string[] { model.FirstName, " ", model.LastName, " added successfully. An email with temporary password has been sent to ", model.Emails[0].EmailAddress };
                        str1 = string.Concat(firstName);
                    }
                }
                else if (!flag1)
                {
                    str2 = "Update Camp User";
                    str1 = "Sorry, there was a problem when updating the profile. Please try again.";
                }
                else
                {
                    str2 = "Add Camp User";
                    str1 = "Sorry, there was a problem when adding the profile. Please try again.";
                }
            }
            return base.RedirectToAction("CampContactRegistration", "Account", new { id = model.AppID, screenMessage = str1, formtitle = str2 });
        }

        public ActionResult AgencyUsersList()
		{
			ClearCache.ClearAllCache();
			List<localAgencyContactListItem> localAgencyContactListItems = new List<localAgencyContactListItem>();
			localAgencyContactListItems = WebSessionManager.getAgencyContactList((int)base.Session["usertoken"], (int)base.Session["agencyAppId"]);
			return base.View(localAgencyContactListItems);
		}

        public ActionResult CampContactsList() // JHF 11/1/19
        {
            ClearCache.ClearAllCache();
            List<localCampContactListItem> localCampContactListItems = new List<localCampContactListItem>();
            localCampContactListItems = WebSessionManager.getCampContactList2((int)base.Session["usertoken"], (int)base.Session["campSiteAppId"]);
            return base.View(localCampContactListItems);
        }

        public ActionResult CampSitesList() // JHF 11/13/19
        {
            ClearCache.ClearAllCache();
            List<localCampSiteListItem> localCampSiteListItems = new List<localCampSiteListItem>();
            localCampSiteListItems = WebSessionManager.getCampSiteList((int)base.Session["usertoken"], (int)base.Session["campSiteAppId"]);
            return base.View(localCampSiteListItems);
        }

        public ActionResult ManageCampSites() // JHF 11/1/19
        {
            ClearCache.ClearAllCache();
            List<localCampSiteListItem> localCampSiteListItems = new List<localCampSiteListItem>();
            localCampSiteListItems = WebSessionManager.getCampSiteList((int)base.Session["usertoken"], (int)base.Session["campcorpAppId"]);
            return base.View(localCampSiteListItems);
        }

        [ActionName("Account")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="CancelAgencyContact")]
		public ActionResult cancelAgencyContactRegistration(localAgencyContact model)
		{
			ClearCache.ClearAllCache();
			return base.View(model);
		}

        [ActionName("CampAccount")]
        [HttpPost]
        [LinkActionToButtonName(SubmitButtonName = "CancelCampContact")]
        public ActionResult cancelCampContactRegistration(localCampContact model)
        {
            ClearCache.ClearAllCache();
            return base.View(model);
        }

        [ActionName("Confirmation")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="CancelDelete")]
		public ActionResult CancelDelete(localAgencyContact model)
		{
			ClearCache.ClearAllCache();
			return base.RedirectToAction("AgencyUsersList", "Account");
		}

        [ActionName("CampConfirmation")]
        [HttpPost]
        [LinkActionToButtonName(SubmitButtonName = "CancelDelete")]
        public ActionResult CancelCampDelete(localCampContact model)
        {
            ClearCache.ClearAllCache();
            return base.RedirectToAction(" CampContactsList", "Account");
        }

        [ActionName("MyProfile")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="CancelMyProfile")]
		public ActionResult cancelMyProfile(localAgencyContact model)
		{
			ClearCache.ClearAllCache();
			return base.View(model);
		}

        [ActionName("MyCampProfile")]
        [HttpPost]
        [LinkActionToButtonName(SubmitButtonName = "CancelMyCampProfile")]
        public ActionResult cancelMyCampProfile(localCampContact model)
        {
            ClearCache.ClearAllCache();
            return base.View(model);
        }

        [Authorize]
		[HttpGet]
		public ActionResult ChangePassword(string Id)
		{
			base.Session["pwdchangestatus"] = Id;
			return base.View();
		}

		[Authorize]
		[HttpPost]
		public ActionResult ChangePassword(ChangePasswordModel model, string id)
		{
			ActionResult action;
			if (base.ModelState.IsValid)
			{
				bool flag = false;
				try
				{
					if (!Membership.ValidateUser(base.User.Identity.Name, model.OldPassword))
					{
						base.ModelState.AddModelError("", "Login failed with old password. Please try again. Code 90400");
					}
					else if (!Membership.GetUser(base.User.Identity.Name, true).ChangePassword(model.OldPassword, model.NewPassword))
					{
						base.ModelState.AddModelError("", "Changing the password did not succeed. Please try again. Code 90300");
					}
					else
					{
						action = base.RedirectToAction("Info", "Account", new { Id = "changePasswordSuccessful" });
						return action;
					}
					return base.View(model);
				}
				catch (Exception exception)
				{
					flag = false;
					base.ModelState.AddModelError("", "Sorry, but changing the password did not succeed. Please try again. Code 90500");
					return base.View(model);
				}
				return action;
			}
			return base.View(model);
		}

		public ActionResult ChangePasswordSuccess()
		{
			return base.View();
		}

		public ViewResult Confirmation(int? id, string screenMessage, string formtitle)
		{
			ClearCache.ClearAllCache();
			localAgencyContact _localAgencyContact = new localAgencyContact();
			localAgencyContact _localAgencyContact1 = new localAgencyContact();
			if (!id.HasValue)
			{
				id = new int?(0);
			}
			int? nullable = id;
			if ((nullable.GetValueOrDefault() != 0 ? true : !nullable.HasValue))
			{
				_localAgencyContact = WebSessionManager.getAgencyContactRecord((int)base.Session["usertoken"], id.Value);
				this.copylocalAgencyContact2Model(ref _localAgencyContact1, _localAgencyContact);
				if (screenMessage != null)
				{
					base.ViewData["Messages"] =  screenMessage;
					((dynamic)base.ViewBag).Message = formtitle;
				}
				else
				{
					base.ViewData["Messages"] =  " ";
					((dynamic)base.ViewBag).Message = "Update User";
				}
			}
			else
			{
				base.ViewData["Messages"] =  " ";
				((dynamic)base.ViewBag).Message = "Add User";
			}
			return base.View("Confirmation", _localAgencyContact1);
		}

		private void copylocalAgency2Model(ref localAgency model, localAgency tmpagnt)
		{
			model.AppID = tmpagnt.AppID;
			model.Title = tmpagnt.Title;
			model.AddressLine1 = tmpagnt.AddressLine1;
			model.AddressLine2 = tmpagnt.AddressLine2;
			model.City = tmpagnt.City;
			model.State = tmpagnt.State;
			model.Zip = tmpagnt.Zip;
			model.ProviderID = tmpagnt.ProviderID;
			localAgency _localAgency = model;
			com.rti.appcommon.Telephone[] telephone = new com.rti.appcommon.Telephone[] { new com.rti.appcommon.Telephone(((int)tmpagnt.Phones.Length == 0 ? " " : tmpagnt.Phones[0].Number)) };
			_localAgency.Phones = telephone;
			localAgency _localAgency1 = model;
			com.rti.appcommon.Fax[] fax = new com.rti.appcommon.Fax[] { new com.rti.appcommon.Fax(((int)tmpagnt.Faxes.Length == 0 ? " " : "main"), "notes", 0, tmpagnt.Faxes[0].Number) };
			_localAgency1.Faxes = fax;
			localAgency _localAgency2 = model;
			com.rti.appcommon.Email[] email = new com.rti.appcommon.Email[] { new com.rti.appcommon.Email(((int)tmpagnt.Emails.Length == 0 ? " " : tmpagnt.Emails[0].EmailAddress), "email") };
			_localAgency2.Emails = email;
			localAgency _localAgency3 = model;
			com.rti.appcommon.URIweb[] uRIweb = new com.rti.appcommon.URIweb[] { new com.rti.appcommon.URIweb(((int)tmpagnt.Weblink.Length == 0 ? " " : tmpagnt.Weblink[0].WWW), "www") };
			_localAgency3.Weblink = uRIweb;
		}

		private void copylocalAgencyContact2Model(ref localAgencyContact model, localAgencyContact tmpagnt)
		{
			model.AgencyAppID = tmpagnt.AgencyAppID;
			model.AppID = tmpagnt.AppID;
			model.FirstName = tmpagnt.FirstName;
			model.MiddleName = tmpagnt.MiddleName;
			model.LastName = tmpagnt.LastName;
			localAgencyContact _localAgencyContact = model;
			com.rti.appcommon.Telephone[] telephone = new com.rti.appcommon.Telephone[] { new com.rti.appcommon.Telephone(((int)tmpagnt.Phones.Length == 0 ? " " : tmpagnt.Phones[0].Number)) };
			_localAgencyContact.Phones = telephone;
			localAgencyContact _localAgencyContact1 = model;
			com.rti.appcommon.Fax[] fax = new com.rti.appcommon.Fax[] { new com.rti.appcommon.Fax(((int)tmpagnt.Faxes.Length == 0 ? " " : "main"), "notes", 0, tmpagnt.Faxes[0].Number) };
			_localAgencyContact1.Faxes = fax;
			localAgencyContact _localAgencyContact2 = model;
			com.rti.appcommon.Email[] email = new com.rti.appcommon.Email[] { new com.rti.appcommon.Email(((int)tmpagnt.Emails.Length == 0 ? " " : tmpagnt.Emails[0].EmailAddress), "email") };
			_localAgencyContact2.Emails = email;
			model.Role = tmpagnt.Role;
		}

        private void copylocalCampContact2Model(ref localCampContact model, localCampContact tmpcmpcntct)
        {
            model.CampSiteAppID = tmpcmpcntct.CampSiteAppID;
            model.AppID = tmpcmpcntct.AppID;
            model.FirstName = tmpcmpcntct.FirstName;
            model.MiddleName = tmpcmpcntct.MiddleName;
            model.LastName = tmpcmpcntct.LastName;
            localCampContact _localCampContact = model;
            com.rti.appcommon.Telephone[] telephone = new com.rti.appcommon.Telephone[] { new com.rti.appcommon.Telephone(((int)tmpcmpcntct.Phones.Length == 0 ? " " : tmpcmpcntct.Phones[0].Number)) };
            _localCampContact.Phones = telephone;
            localCampContact _localCampContact1 = model;
            com.rti.appcommon.Fax[] fax = new com.rti.appcommon.Fax[] { new com.rti.appcommon.Fax(((int)tmpcmpcntct.Faxes.Length == 0 ? " " : "main"), "notes", 0, tmpcmpcntct.Faxes[0].Number) };
            _localCampContact1.Faxes = fax;
            localCampContact _localCampContact2 = model;
            com.rti.appcommon.Email[] email = new com.rti.appcommon.Email[] { new com.rti.appcommon.Email(((int)tmpcmpcntct.Emails.Length == 0 ? " " : tmpcmpcntct.Emails[0].EmailAddress), "email") };
            _localCampContact2.Emails = email;
            model.Role = tmpcmpcntct.Role;
        }

        private void copylocalCampSite2Model(ref localCampSite model, localCampSite tmpcmpsite)
        {
            model.CampCorpAppID = tmpcmpsite.CampCorpAppID;
            model.AppID = tmpcmpsite.AppID;
            model.SiteName = tmpcmpsite.SiteName; // uncommented JHF 9/8/20
            model.Address = tmpcmpsite.Address;
            model.City = tmpcmpsite.City;
            model.State = tmpcmpsite.State;
            model.Country = tmpcmpsite.Country;
            model.Isactive = tmpcmpsite.Isactive;
            model.IsPreferred = tmpcmpsite.IsPreferred;
            model.Line1 = tmpcmpsite.Line1;
            model.Line2 = tmpcmpsite.Line2;
            //model.CampState = tmpcmpsite.CampState;
            model.CampState = tmpcmpsite.State; // JHF 10/2/20 State & CampState redundant?
            model.Status = tmpcmpsite.Status;
            model.Zip = tmpcmpsite.Zip;
            model.WhoSignedAgreement = tmpcmpsite.WhoSignedAgreement;
            model.TitleOfWhoSignedAgrmnt = tmpcmpsite.TitleOfWhoSignedAgrmnt;
            model.IOBoxRecs = tmpcmpsite.IOBoxRecs; // JHF 10/27/20
            localCampSite _localCampSite = model;
            com.rti.appcommon.Telephone[] telephone = new com.rti.appcommon.Telephone[] { new com.rti.appcommon.Telephone(((int)tmpcmpsite.Phones.Length == 0 ? " " : tmpcmpsite.Phones[0].Number)) };
            _localCampSite.Phones = telephone;
            localCampSite _localCampSite1 = model;
            com.rti.appcommon.Fax[] fax = new com.rti.appcommon.Fax[] { new com.rti.appcommon.Fax(((int)tmpcmpsite.Faxes.Length == 0 ? " " : "main"), "notes", 0, tmpcmpsite.Faxes[0].Number) };
            _localCampSite1.Faxes = fax;
            localCampSite _localCampSite2 = model;
            com.rti.appcommon.Email[] email = new com.rti.appcommon.Email[] { new com.rti.appcommon.Email(((int)tmpcmpsite.Emails.Length == 0 ? " " : tmpcmpsite.Emails[0].EmailAddress), "email") };
            _localCampSite2.Emails = email;
            localCampSite _localCampSite3 = model;
            com.rti.appcommon.URIweb[] uRIweb = new com.rti.appcommon.URIweb[] { new com.rti.appcommon.URIweb(((int)tmpcmpsite.Weblink.Length == 0 ? " " : tmpcmpsite.Weblink[0].WWW), "www") };
            _localCampSite3.Weblink = uRIweb;



            //localAgency _localAgency3 = tmpagnt;
            //com.rti.appcommon.URIweb[] uRIweb = new com.rti.appcommon.URIweb[] { new com.rti.appcommon.URIweb(((int)model.Weblink.Length == 0 ? " " : model.Weblink[0].WWW), "www") };
            //_localAgency3.Weblink = uRIweb;


        }

        //private void copylocalCampSiteListItem2Model(ref localCampSiteListItem model, localCampSiteListItem tmpcmpsite)
        //{           
        //    model.AppID = tmpcmpsite.AppID;           
        //    model.Address = tmpcmpsite.Address;           
        //    model.Contacts = tmpcmpsite.Contacts;
        //    model.IsPreferred = tmpcmpsite.IsPreferred;
        //    //model.IOBoxRecs = tmpcmpsite.IOBoxRecs;
        //    model.Status = tmpcmpsite.Status;
        //    model.Statusstr = tmpcmpsite.Statusstr;
        //    model.Title = tmpcmpsite.Title;
        //    //localCampSite _localCampSite = model;
        //    //com.rti.appcommon.Telephone[] telephone = new com.rti.appcommon.Telephone[] { new com.rti.appcommon.Telephone(((int)tmpcmpsite.Phones.Length == 0 ? " " : tmpcmpsite.Phones[0].Number)) };
        //    //_localCampSite.Phones = telephone;
        //    //localCampSite _localCampSite1 = model;
        //    //com.rti.appcommon.Fax[] fax = new com.rti.appcommon.Fax[] { new com.rti.appcommon.Fax(((int)tmpcmpsite.Faxes.Length == 0 ? " " : "main"), "notes", 0, tmpcmpsite.Faxes[0].Number) };
        //    //_localCampSite1.Faxes = fax;
        //    //localCampSite _localCampSite2 = model;
        //    //com.rti.appcommon.Email[] email = new com.rti.appcommon.Email[] { new com.rti.appcommon.Email(((int)tmpcmpsite.Emailaddresses.Length == 0 ? " " : tmpcmpsite.Emailaddresses[0]), "email") };
        //    //_localCampSite2.Emails = email;
        //}



        private void copyModel2localAgency(localAgency model, ref localAgency tmpagnt)
		{
			tmpagnt.Title = model.Title;
			tmpagnt.AddressLine1 = model.AddressLine1;
			tmpagnt.AddressLine2 = model.AddressLine2;
			tmpagnt.City = model.City;
			tmpagnt.State = model.State;
			tmpagnt.Zip = model.Zip;
			tmpagnt.ProviderID = model.ProviderID;
			localAgency _localAgency = tmpagnt;
			com.rti.appcommon.Telephone[] telephone = new com.rti.appcommon.Telephone[] { new com.rti.appcommon.Telephone(((int)model.Phones.Length == 0 ? " " : model.Phones[0].Number)) };
			_localAgency.Phones = telephone;
			localAgency _localAgency1 = tmpagnt;
			com.rti.appcommon.Fax[] fax = new com.rti.appcommon.Fax[] { new com.rti.appcommon.Fax(((int)model.Faxes.Length == 0 ? " " : "main"), "notes", 0, model.Faxes[0].Number) };
			_localAgency1.Faxes = fax;
			localAgency _localAgency2 = tmpagnt;
			com.rti.appcommon.Email[] email = new com.rti.appcommon.Email[] { new com.rti.appcommon.Email(((int)model.Emails.Length == 0 ? " " : model.Emails[0].EmailAddress), "email") };
			_localAgency2.Emails = email;
			localAgency _localAgency3 = tmpagnt;
			com.rti.appcommon.URIweb[] uRIweb = new com.rti.appcommon.URIweb[] { new com.rti.appcommon.URIweb(((int)model.Weblink.Length == 0 ? " " : model.Weblink[0].WWW), "www") };
			_localAgency3.Weblink = uRIweb;
		}

		private void copyModel2localAgencyContact(localAgencyContact model, ref localAgencyContact tmpagnt)
		{
			tmpagnt.FirstName = model.FirstName;
			tmpagnt.MiddleName = model.MiddleName;
			tmpagnt.LastName = model.LastName;
			localAgencyContact _localAgencyContact = tmpagnt;
			com.rti.appcommon.Telephone[] telephone = new com.rti.appcommon.Telephone[] { new com.rti.appcommon.Telephone(((int)model.Phones.Length == 0 ? " " : model.Phones[0].Number)) };
			_localAgencyContact.Phones = telephone;
			localAgencyContact _localAgencyContact1 = tmpagnt;
			com.rti.appcommon.Fax[] fax = new com.rti.appcommon.Fax[] { new com.rti.appcommon.Fax(((int)model.Faxes.Length == 0 ? " " : "main"), "notes", 0, model.Faxes[0].Number) };
			_localAgencyContact1.Faxes = fax;
			localAgencyContact _localAgencyContact2 = tmpagnt;
			com.rti.appcommon.Email[] email = new com.rti.appcommon.Email[] { new com.rti.appcommon.Email(((int)model.Emails.Length == 0 ? " " : model.Emails[0].EmailAddress), "email") };
			_localAgencyContact2.Emails = email;
			tmpagnt.Role = model.Role;
		}

        private void copyModel2localCampContact(localCampContact model, ref localCampContact tmpcmpctct)
        {
            tmpcmpctct.FirstName = model.FirstName;
            tmpcmpctct.MiddleName = model.MiddleName;
            tmpcmpctct.LastName = model.LastName;
            localCampContact _localCampContact = tmpcmpctct;
            com.rti.appcommon.Telephone[] telephone = new com.rti.appcommon.Telephone[] { new com.rti.appcommon.Telephone(((int)model.Phones.Length == 0 ? " " : model.Phones[0].Number)) };
            _localCampContact.Phones = telephone;
            localCampContact _localCampContact1 = tmpcmpctct;
            com.rti.appcommon.Fax[] fax = new com.rti.appcommon.Fax[] { new com.rti.appcommon.Fax(((int)model.Faxes.Length == 0 ? " " : "main"), "notes", 0, model.Faxes[0].Number) };
            _localCampContact1.Faxes = fax;
            localCampContact _localCampContact2 = tmpcmpctct;
            com.rti.appcommon.Email[] email = new com.rti.appcommon.Email[] { new com.rti.appcommon.Email(((int)model.Emails.Length == 0 ? " " : model.Emails[0].EmailAddress), "email") };
            _localCampContact2.Emails = email;
            tmpcmpctct.Role = model.Role;
        }

        private void copyModel2localCampSite(localCampSite model, ref localCampSite tmpcmpsite)
        {
            tmpcmpsite.CampCorpAppID = model.CampCorpAppID; // JHF 9/30/20
            tmpcmpsite.SiteName = model.SiteName;
            tmpcmpsite.AppID = model.AppID;
            tmpcmpsite.Line1 = model.Line1;
            tmpcmpsite.Line2 = model.Line2;
            tmpcmpsite.City = model.City;
            tmpcmpsite.State = model.State; // JHF 10/2/20 test this
            tmpcmpsite.Zip = model.Zip;
            tmpcmpsite.WhoSignedAgreement = model.WhoSignedAgreement;
            tmpcmpsite.TitleOfWhoSignedAgrmnt = model.TitleOfWhoSignedAgrmnt;

            localCampSite _localCampSite = tmpcmpsite;
            com.rti.appcommon.Telephone[] telephone = new com.rti.appcommon.Telephone[] { new com.rti.appcommon.Telephone(((int)model.Phones.Length == 0 ? " " : model.Phones[0].Number)) };
            _localCampSite.Phones = telephone;
            localCampSite _localCampSite1 = tmpcmpsite;
            com.rti.appcommon.Fax[] fax = new com.rti.appcommon.Fax[] { new com.rti.appcommon.Fax(((int)model.Faxes.Length == 0 ? " " : "main"), "notes", 0, model.Faxes[0].Number) };
            _localCampSite1.Faxes = fax;
            localCampSite _localCampSite2 = tmpcmpsite;
            com.rti.appcommon.Email[] email = new com.rti.appcommon.Email[] { new com.rti.appcommon.Email(((int)model.Emails.Length == 0 ? " " : model.Emails[0].EmailAddress), "email") };
            _localCampSite2.Emails = email;
            localCampSite _localCampSite3 = tmpcmpsite;
            com.rti.appcommon.URIweb[] uRIweb = new com.rti.appcommon.URIweb[] { new com.rti.appcommon.URIweb(((int)model.Weblink.Length == 0 ? " " : model.Weblink[0].WWW), "www") };
            _localCampSite3.Weblink = uRIweb;
        }

        //private void copyModel2localCampSite(CampSiteRegisterModel model, ref CampSiteRegisterModel tmpcmpsite)
        //{
        //    //tmpcmpsite.CampCorpAppID = model.CampCorpAppID;
        //    tmpcmpsite.CampSiteName = model.CampSiteName;
        //    //tmpcmpsite.AppID = model.AppID;
        //    CampSiteRegisterModel _localCampSite = tmpcmpsite;
        //    com.rti.appcommon.Telephone[] telephone = new com.rti.appcommon.Telephone[] { new com.rti.appcommon.Telephone(((int)model.CampSitePhone.Length == 0 ? " " : model.CampSitePhone[0].Number)) };
        //    _localCampSite.CampSitePhone = telephone;
        //    CampSiteRegisterModel _localCampContact1 = tmpcmpsite;
        //    com.rti.appcommon.Fax[] fax = new com.rti.appcommon.Fax[] { new com.rti.appcommon.Fax(((int)model.CampSiteFax.Length == 0 ? " " : "main"), "notes", 0, model.CampSiteFax[0].Number) };
        //    _localCampContact1.Faxes = fax;
        //    CampSiteRegisterModel _localCampContact2 = tmpcmpsite;
        //    com.rti.appcommon.Email[] email = new com.rti.appcommon.Email[] { new com.rti.appcommon.Email(((int)model.CampSiteEmail.Length == 0 ? " " : model.CampSiteEmail[0].EmailAddress), "email") };
        //    _localCampContact2.Emails = email;
        //    //tmpcmpctct.Role = model.Role;
        //}

        private void copyRegModel2localAgency(RegisterModel regmodel, ref localAgency tmpagency)
		{
			tmpagency.Title = string.Concat(regmodel.AgencyName, " - ", regmodel.AgencyDepartment);
			tmpagency.ProviderID = regmodel.AgencyProviderID;
			tmpagency.AddressLine1 = regmodel.Address;
			tmpagency.City = regmodel.City;
			tmpagency.State = regmodel.State;
			tmpagency.Zip = regmodel.Zip;
			com.rti.appcommon.Telephone[] telephoneArray = new com.rti.appcommon.Telephone[1];
			com.rti.appcommon.Telephone telephone = new com.rti.appcommon.Telephone()
			{
				Number = regmodel.MainPhone,
				Index = 1,
				Type = "Agency"
			};
			telephoneArray[0] = telephone;
			tmpagency.Phones = telephoneArray;
			com.rti.appcommon.Email[] emailArray = new com.rti.appcommon.Email[1];
			com.rti.appcommon.Email email = new com.rti.appcommon.Email()
			{
				EmailAddress = regmodel.AgencyEmail
			};
			emailArray[0] = email;
			tmpagency.Emails = emailArray;
			com.rti.appcommon.Fax[] faxArray = new com.rti.appcommon.Fax[1];
			com.rti.appcommon.Fax fax = new com.rti.appcommon.Fax()
			{
				Number = regmodel.MainFax,
				Index = 1,
				Type = "Agency"
			};
			faxArray[0] = fax;
			tmpagency.Faxes = faxArray;
			com.rti.appcommon.URIweb[] uRIwebArray = new com.rti.appcommon.URIweb[1];
			com.rti.appcommon.URIweb uRIweb = new com.rti.appcommon.URIweb()
			{
				WWW = regmodel.Website
			};
			uRIwebArray[0] = uRIweb;
			tmpagency.Weblink = uRIwebArray;
		}

        private void copyCampRegModel2localCampSite(CampRegisterModel campregmodel, ref localCampSite tmpcampsite) // JHF
        {
            tmpcampsite.SiteName = campregmodel.SiteName; //string.Concat(campregmodel.CampName, " - "); //, campregmodel.CampDepartment);
            // tmpcamp.Address ? JHF 11/22/2019
            tmpcampsite.Line1 = campregmodel.Siteline1;
            tmpcampsite.Line2 = campregmodel.Siteline2;

            tmpcampsite.City = campregmodel.SiteCity;
            tmpcampsite.State = campregmodel.SiteState;
            tmpcampsite.Zip = campregmodel.SiteZip;
            com.rti.appcommon.Telephone[] telephoneArray = new com.rti.appcommon.Telephone[2];
            com.rti.appcommon.Telephone telephone1 = new com.rti.appcommon.Telephone()
            {
                Number = campregmodel.SitePhone1,
                Index = 1,
                Ext = campregmodel.SitePhoneExt1,
                Type = "CampSite"
            };
            telephoneArray[0] = telephone1;
            //tmpcampsite.Phones = telephoneArray;

            com.rti.appcommon.Telephone telephone2 = new com.rti.appcommon.Telephone() // 2nd phone JHF 11/25/19
            {
                Number = campregmodel.SitePhone2,
                Index = 2,
                Ext = campregmodel.SitePhoneExt2,
                Type = "CampSite"
            };
            telephoneArray[1] = telephone2;
            tmpcampsite.Phones = telephoneArray;




            com.rti.appcommon.Email[] emailArray = new com.rti.appcommon.Email[1];
            com.rti.appcommon.Email email = new com.rti.appcommon.Email()
            {
                EmailAddress = campregmodel.SiteEmail
            };
            
            // Site Phone #2 ? Ext?
            emailArray[0] = email;
            tmpcampsite.Emails = emailArray;
            com.rti.appcommon.Fax[] faxArray = new com.rti.appcommon.Fax[1];
            com.rti.appcommon.Fax fax = new com.rti.appcommon.Fax()
            {
                Number = campregmodel.SiteFax,
                Index = 1,
                Type = "CampSite"
            };
            faxArray[0] = fax;
            tmpcampsite.Faxes = faxArray;
            com.rti.appcommon.URIweb[] uRIwebArray = new com.rti.appcommon.URIweb[1];
            com.rti.appcommon.URIweb uRIweb = new com.rti.appcommon.URIweb()
            {
                WWW = campregmodel.SiteWebsite
            };
            uRIwebArray[0] = uRIweb;
            tmpcampsite.Weblink = uRIwebArray;
            tmpcampsite.WhoSignedAgreement = campregmodel.WhoSignedAgreement; // JHF 11/22/19
            tmpcampsite.TitleOfWhoSignedAgrmnt = campregmodel.TitleOfWhoSignedAgreement;
        }

        private void copyCampRegModel2localCampCorp(CampRegisterModel campregmodel, ref localCampCorp tmpcrp) // JHF 11/18/19
        {
            tmpcrp.Title = campregmodel.CorpName; //string.Concat(campregmodel.CampName, " - "); //, campregmodel.CampDepartment);

            tmpcrp.Line1 = campregmodel.Corpline1;
            tmpcrp.Line2 = campregmodel.Corpline2;

            tmpcrp.City = campregmodel.CorpCity;
            tmpcrp.State = campregmodel.CorpState;
            tmpcrp.Zip = campregmodel.CorpZip;
            tmpcrp.CorpContact = campregmodel.CorpContact;
            com.rti.appcommon.Telephone[] telephoneArray = new com.rti.appcommon.Telephone[1];
            com.rti.appcommon.Telephone telephone = new com.rti.appcommon.Telephone()
            {
                Number = campregmodel.CorpPhone,
                Index = 1,
                Ext = campregmodel.CorpPhoneExt,
                Type = "CampCorp"
            };
            telephoneArray[0] = telephone;
            tmpcrp.Phones = telephoneArray;
            // Phone extension? JHF 11/22/2019
            com.rti.appcommon.Email[] emailArray = new com.rti.appcommon.Email[1];
            com.rti.appcommon.Email email = new com.rti.appcommon.Email()
            {
                    EmailAddress = campregmodel.CorpEmail
            };
            emailArray[0] = email;
            tmpcrp.Emails = emailArray;
            com.rti.appcommon.Fax[] faxArray = new com.rti.appcommon.Fax[1];
            com.rti.appcommon.Fax fax = new com.rti.appcommon.Fax()
            {
                Number = campregmodel.CorpFax,
                Index = 1,
                Type = "CampCorp"
            };
            faxArray[0] = fax;
            tmpcrp.Faxes = faxArray;
            com.rti.appcommon.URIweb[] uRIwebArray = new com.rti.appcommon.URIweb[1];
            com.rti.appcommon.URIweb uRIweb = new com.rti.appcommon.URIweb()
            {
                WWW = campregmodel.CorpWebsite
            };
            uRIwebArray[0] = uRIweb;
            tmpcrp.Weblink = uRIwebArray;
        }

        private void copyRegModel2localAgencyContact(RegisterModel regmodel, ref localAgencyContact tmpagencycon)
		{
			tmpagencycon.FirstName = regmodel.FirstName;
			tmpagencycon.MiddleName = regmodel.MiddleInitial;
			tmpagencycon.LastName = regmodel.LastName;
			com.rti.appcommon.Email[] emailArray = new com.rti.appcommon.Email[1];
			com.rti.appcommon.Email email = new com.rti.appcommon.Email()
			{
				EmailAddress = regmodel.Email
			};
			emailArray[0] = email;
			tmpagencycon.Emails = emailArray;
			com.rti.appcommon.Telephone[] telephoneArray = new com.rti.appcommon.Telephone[1];
			com.rti.appcommon.Telephone telephone = new com.rti.appcommon.Telephone()
			{
				Number = regmodel.Phone,
				Index = 1,
				Ext = regmodel.Extension,
				Type = "AgencyUser"
			};
			telephoneArray[0] = telephone;
			tmpagencycon.Phones = telephoneArray;
			com.rti.appcommon.Fax[] faxArray = new com.rti.appcommon.Fax[1];
			com.rti.appcommon.Fax fax = new com.rti.appcommon.Fax()
			{
				Number = regmodel.Fax,
				Index = 1,
				Type = "Agent"
			};
			faxArray[0] = fax;
			tmpagencycon.Faxes = faxArray;
		}

        private void copyCampRegModel2localCampContact(CampRegisterModel regmodel, ref localCampContact tmpcampcon) // JHF
        {
            tmpcampcon.FirstName = regmodel.SA_FirstName;
            tmpcampcon.MiddleName = regmodel.SA_MiddleInitial;
            tmpcampcon.LastName = regmodel.SA_LastName;
            com.rti.appcommon.Email[] emailArray = new com.rti.appcommon.Email[1];
            com.rti.appcommon.Email email = new com.rti.appcommon.Email()
            {
                EmailAddress = regmodel.SA_Email
            };
            emailArray[0] = email;
            tmpcampcon.Emails = emailArray;
            com.rti.appcommon.Telephone[] telephoneArray = new com.rti.appcommon.Telephone[1];
            com.rti.appcommon.Telephone telephone = new com.rti.appcommon.Telephone()
            {
                Number = regmodel.SA_Phone1,
                Index = 1,
                Ext = regmodel.SA_Extension1,
                Type = "CampContact"
            };
            telephoneArray[0] = telephone;
            tmpcampcon.Phones = telephoneArray;
            // Phone #2 and extension? JHF 11/22/19
            com.rti.appcommon.Fax[] faxArray = new com.rti.appcommon.Fax[1];
            com.rti.appcommon.Fax fax = new com.rti.appcommon.Fax()
            {
                Number = regmodel.SA_Fax,
                Index = 1,
                Type = "CampContact"
            };
            faxArray[0] = fax;
            tmpcampcon.Faxes = faxArray;
            //tmpcampcon.SCUserTypeID = regmodel.UserType; // JHF
        }

        private bool createNewlocalAgencyUserProfile(ref localAgencyContact model, out string failureReason)
		{
			MembershipCreateStatus membershipCreateStatu;
			localAgencyContact _localAgencyContact = new localAgencyContact();
			this.copyModel2localAgencyContact(model, ref _localAgencyContact);
			if (_localAgencyContact.FirstName == null && _localAgencyContact.LastName == null)
			{
				failureReason = "Firstname and Lastname fields are mandatory.";
				return false;
			}
			if (_localAgencyContact.FirstName == null)
			{
				failureReason = "Firstname field is mandatory.";
				return false;
			}
			if (_localAgencyContact.LastName == null)
			{
				failureReason = "Lastname field is mandatory.";
				return false;
			}
			string emailAddress = _localAgencyContact.Emails[0].EmailAddress;
			if (emailAddress == null || emailAddress == "")
			{
				_localAgencyContact.Emails[0].EmailAddress = "";
				failureReason = "Email address is required as it will be used as login id";
				return false;
			}
			emailAddress = emailAddress.Trim();
			if (Membership.FindUsersByEmail(emailAddress).Count != 0)
			{
				failureReason = "The given email address is already registered.";
				return false;
			}
			_localAgencyContact.ResetPassword = true;
			_localAgencyContact.IsActive = true;
			_localAgencyContact.HasWebAccess = true;
			int num = WebSessionManager.registerNewAgencyContact((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], _localAgencyContact);
			if (num == -1 || num == 0)
			{
				failureReason = "There was a problem registering the user profile. Please check all values and try again.\n Please contact Administrator if problem persists.";
				return false;
			}
			model.AppID = num;
			string str = num.ToString("D32");
			string str1 = Membership.GeneratePassword(10, 3);
			Membership.CreateUser(emailAddress, str1, emailAddress, null, null, true, new Guid(str), out membershipCreateStatu);
			if (membershipCreateStatu != MembershipCreateStatus.Success)
			{
				failureReason = "Critical Error: Contact Administrator and please provide all the information used in creating the user profile.";
				return false;
			}
			this.SendTmpPwdEmail(_localAgencyContact.Emails[0].EmailAddress, str1);
			failureReason = "success";
			return true;
		}

        private bool createNewlocalCampContactProfile(ref localCampContact model, out string failureReason)
        {
            MembershipCreateStatus membershipCreateStatu;
            localCampContact _localCampContact = new localCampContact();
            this.copyModel2localCampContact(model, ref _localCampContact);
            if (_localCampContact.FirstName == null && _localCampContact.LastName == null) // JHF bug both said firstname
            {
                failureReason = "Firstname and Lastname fields are mandatory.";
                return false;
            }
            if (_localCampContact.FirstName == null)
            {
                failureReason = "Firstname field is mandatory.";
                return false;
            }
            if (_localCampContact.LastName == null)
            {
                failureReason = "Lastname field is mandatory.";
                return false;
            }
            string emailAddress = _localCampContact.Emails[0].EmailAddress;
            if (emailAddress == null || emailAddress == "")
            {
                _localCampContact.Emails[0].EmailAddress = "";
                failureReason = "Email address is required as it will be used as login id";
                return false;
            }
            emailAddress = emailAddress.Trim();
            if (Membership.FindUsersByEmail(emailAddress).Count != 0)
            {
                failureReason = "The given email address is already registered.";
                return false;
            }
            _localCampContact.ResetPassword = true;
            _localCampContact.IsActive = true;
            _localCampContact.HasWebAccess = true;
            int num = WebSessionManager.registerNewCampContact((int)base.Session["usertoken"], (int)base.Session["campcontactAppId"], (int)base.Session["campSiteAppId"], _localCampContact);
            if (num == -1 || num == 0)
            {
                failureReason = "There was a problem registering the user profile. Please check all values and try again.\n Please contact Administrator if problem persists.";
                return false;
            }
            model.AppID = num;
            string str = num.ToString("D32");
            string str1 = Membership.GeneratePassword(10, 3);
            Membership.CreateUser(emailAddress, str1, emailAddress, null, null, true, new Guid(str), out membershipCreateStatu);
            if (membershipCreateStatu != MembershipCreateStatus.Success)
            {
                failureReason = "Critical Error: Contact Administrator and please provide all the information used in creating the user profile.";
                return false;
            }
            this.SendTmpPwdEmail(_localCampContact.Emails[0].EmailAddress, str1);
            failureReason = "success";
            return true;
        }

        private bool createNewlocalCampSiteProfile(ref localCampSite model, out string failureReason)
        {
            //MembershipCreateStatus membershipCreateStatu;
            localCampSite _localCampSite = new localCampSite();
            this.copyModel2localCampSite(model, ref _localCampSite);
            //if (_localCampSite.SiteName == null) // && _localCampSite.FirstName == null)
            //{
            //    failureReason = "Site name field is mandatory.";
            //    return false;
            //}
            //if (_localCampSite.FirstName == null)
            //{
            //    failureReason = "Firstname field is mandatory.";
            //    return false;
            //}
            //if (_localCampSite.LastName == null)
            //{
            //    failureReason = "Lastname field is mandatory.";
            //    return false;
            //}
            string emailAddress = _localCampSite.Emails[0].EmailAddress;
            if (emailAddress == null || emailAddress == "")
            {
                _localCampSite.Emails[0].EmailAddress = "";
                failureReason = "Email address is required";
                return false;
            }
            //emailAddress = emailAddress.Trim();
            //if (Membership.FindUsersByEmail(emailAddress).Count != 0)
            //{
            //    failureReason = "The given email address is already registered.";
            //    return false;
            //}
            //_localCampContact.ResetPassword = true;
            _localCampSite.Isactive = true;
            _localCampSite.IsPreferred = true; //JHF 11/22/19
            int num = WebSessionManager.registerNewCampSite((int)base.Session["usertoken"], _localCampSite);
            if (num == -1 || num == 0)
            {
                failureReason = "There was a problem creating the camp site. Please check all values and try again.\n Please contact Administrator if problem persists.";
                return false;
            }
            model.AppID = num;
            string str = num.ToString("D32");
            //string str1 = Membership.GeneratePassword(10, 3);
            //Membership.CreateUser(emailAddress, str1, emailAddress, null, null, true, new Guid(str), out membershipCreateStatu);
            //if (membershipCreateStatu != MembershipCreateStatus.Success)
            //{
            //    failureReason = "Critical Error: Contact Administrator and please provide all the information used in creating the user profile.";
            //    return false;
            //}
            //this.SendTmpPwdEmail(_localCampContact.Emails[0].EmailAddress, str1);
            failureReason = "success";
            return true;
        }

        private string CreateTmpPwdandUpdatePwd(string strEmailID)
		{
			return Membership.GetUser(strEmailID).ResetPassword();
		}

		[ActionName("Confirmation")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="DeleteProfile")]
		public ActionResult DeleteProfile(localAgencyContact model)
		{
			string emailAddress = model.Emails[0].EmailAddress;
			WebSessionManager.deleteAgencyuser((int)base.Session["usertoken"], model.AppID);
			Membership.DeleteUser(emailAddress);
			return base.RedirectToAction("AgencyUsersList", "Account");
		}

		private static string ErrorCodeToString(MembershipCreateStatus createStatus)
		{
			switch (createStatus)
			{
				case MembershipCreateStatus.InvalidUserName:
				{
					return "The user name provided is invalid. Please check the value and try again.";
				}
				case MembershipCreateStatus.InvalidPassword:
				{
					return "The password provided is invalid. Please enter a valid password value.";
				}
				case MembershipCreateStatus.InvalidQuestion:
				{
					return "The password retrieval question provided is invalid. Please check the value and try again.";
				}
				case MembershipCreateStatus.InvalidAnswer:
				{
					return "The password retrieval answer provided is invalid. Please check the value and try again.";
				}
				case MembershipCreateStatus.InvalidEmail:
				{
					return "The e-mail address provided is invalid. Please check the value and try again.";
				}
				case MembershipCreateStatus.DuplicateUserName:
				{
					return "User name already exists. Please enter a different user name.";
				}
				case MembershipCreateStatus.DuplicateEmail:
				{
					return "A user name for that e-mail address already exists. Please enter a different e-mail address.";
				}
				case MembershipCreateStatus.UserRejected:
				{
					return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
				}
				case MembershipCreateStatus.InvalidProviderUserKey:
				case MembershipCreateStatus.DuplicateProviderUserKey:
				{
					return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
				}
				case MembershipCreateStatus.ProviderError:
				{
					return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
				}
				default:
				{
					return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
				}
			}
		}

		public ActionResult ForgotPassword()
		{
			return base.View();
		}

		[HttpPost]
		public ActionResult ForgotPassword(ForgotPasswordModel model)
		{
			int num;
			if (base.ModelState.IsValid && this.UserExists(model.Email))
			{
				Guid providerUserKey = (Guid)Membership.GetUser(model.Email).ProviderUserKey;
				string str = providerUserKey.ToString("N");
				int.TryParse(str, out num);
				retToken token = WebSessionManager.getToken("webt", num);
				if (token.AgentAppID == 0 || token.RequestFailed)
				{
					return base.RedirectToAction("LogOn", "Account");
				}
				localAgencyContact agencyContactRecord = WebSessionManager.getAgencyContactRecord(token.Token, num);
				if (agencyContactRecord != null)
				{
					agencyContactRecord.ResetPassword = true;
					WebSessionManager.saveAgencyContactRecord(token.Token, num, token.AgencyAppID, agencyContactRecord);
					string str1 = this.CreateTmpPwdandUpdatePwd(model.Email);
					if (this.SendTmpPwdEmail(model.Email, str1))
					{
						return base.RedirectToAction("Info", "Account", new { Id = "forgot" });
					}
				}
			}
			return base.View(model);
		}

		public ActionResult Info(string id)
		{
			if (id.ToLower() == "forgot")
			{
				((dynamic)base.ViewBag).Message = "Please check your email for information to reset your password.";
			}
			else if (id.ToLower() == "register")
			{
				((dynamic)base.ViewBag).Message = "Thank you for registering your Agency in the SummerCamp online system. <br/> <br/>Please expect to receive an email from DBHIDS with approval status. <br/> <br/>Once approved, you may use the email login id and password to access the system.";
			}
			else if (id.ToLower() == "mps")
			{
				((dynamic)base.ViewBag).Message = "Your profile was updated successfully";
			}
			else if (id.ToLower() == "mpf")
			{
				((dynamic)base.ViewBag).Message = "Sorry, there was a problem in updating your profile. <br/> <br/> Please try again later or email support if you continue to have problems with profile update.";
			}
			else if (id.ToLower() == "changepasswordsuccessful")
			{
				((dynamic)base.ViewBag).Message = "Your password has been updated successfully. Please login using your new password.";
			}
			return base.View();
		}

		public ActionResult LogOff()
		{
			base.Session["loginid"] = "";
			base.Session["agentAppID"] = -1;
			base.Session["agencyAppID"] = -1;
			base.Session["agent"] = new retRecordoflocalAgencyContact();
			base.Session.Abandon();
			FormsAuthentication.SignOut();
			ClearCache.ClearAllCache();
			WebSessionManager.logout("wt", (int)base.Session["usertoken"]);
			base.Session["usertoken"] = -1;
			return base.RedirectToAction("LogOn", "Account");
		}

		public ActionResult LogOn()
		{
            AccountController.preloginMessage = WebSessionManager.getPreLoginMessage();
            base.ViewData["PreLogin"] = AccountController.preloginMessage;
            return base.View();
		}

		[HttpPost]
		public ActionResult LogOn(LogOnModel model, string returnUr)
		{
			int num;
			if (!base.ModelState.IsValid)
			{
				return base.RedirectToAction("LogOn", "Account");
			}
			if (!Membership.ValidateUser(model.UserName, model.Password))
			{
				base.ModelState.AddModelError(string.Empty, "The user name or password provided is incorrect");
				base.ViewData["PreLogin"] =  AccountController.preloginMessage;
				return base.View();
			}
			base.Session["loginid"] = model.UserName;
			Guid providerUserKey = (Guid)Membership.GetUser(model.UserName).ProviderUserKey;
			string str = providerUserKey.ToString("N");
			int.TryParse(str, out num);

            int usrAppID = num;
            
            retUserToken utoken = WebSessionManager.getUserToken("webt", usrAppID); // WSM: 306

            utoken.UserTypeID = 1; // <=== JHF change here rather than wcf (retrieve from usertype table via who is logging in ; 1 = agency, 2 = camp

            if(utoken.UserTypeID == 0)
            {
                base.ModelState.AddModelError(string.Empty, "There is no user type for the given login. Please contact your administrator.");
                base.ViewData["PreLogin"] = AccountController.preloginMessage;
                return base.View();
            }
            if (utoken.RequestFailed)
            {
                base.ModelState.AddModelError(string.Empty, "The user type request has failed. Please contact your administrator.");
                base.ViewData["PreLogin"] = AccountController.preloginMessage;
                return base.View();
            }
            if(utoken.UserTypeID == 1) // JHF 1 or 2 hardcoding for testing
            {
                // 1 == agency JHF
                base.Session["agentAppID"] = num;
                base.Session["usertoken"] = -1;
                base.Session["agencyAppID"] = -1;
                base.Session["agent"] = new localAgencyContact();
                retToken token = WebSessionManager.getToken("webt", (int)base.Session["agentAppID"]);
                if (token.AgentAppID == 0)
                {
                    base.ModelState.AddModelError(string.Empty, "There is no registered profile for the given login. Please contact your agency contact for an account.");
                    base.ViewData["PreLogin"] = AccountController.preloginMessage;
                    return base.View();
                }
                if (!token.RequestFailed)
                {
                    base.Session["usertoken"] = token.Token;
                    base.Session["agencyAppID"] = token.AgencyAppID;
                    retRecordoflocalAgencyContact agencyContactretRecord = WebSessionManager.getAgencyContactretRecord((int)base.Session["usertoken"], (int)base.Session["agentAppID"]);
                    if (!agencyContactretRecord.RequestFailed)
                    {
                        base.Session["agent"] = agencyContactretRecord.Item;
                    }
                    else
                    {
                        base.Session["agent"] = new localAgencyContact();
                    }
                    if (WebSessionManager.getAgencyRecord((int)base.Session["usertoken"], (int)base.Session["agentAppID"], (int)base.Session["agencyAppID"]).Status != 50)
                    {
                        base.ModelState.AddModelError(string.Empty, "Your agency has not yet been approved for submitting Camp Applications. Please await approval or contact your agency contact.");
                        base.ViewData["PreLogin"] = AccountController.preloginMessage;
                        return base.View();
                    }
                }
                if (!((localAgencyContact)base.Session["agent"]).HasWebAccess)
                {
                    base.ModelState.AddModelError(string.Empty, "Sorry, you currently do not have permission to login to the system. Please await approval or ask your agency contact.");
                    base.ViewData["PreLogin"] = AccountController.preloginMessage;
                    return base.View();
                }
                FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                if (base.Url.IsLocalUrl(this.returnUrl) && this.returnUrl.Length > 1 && this.returnUrl.StartsWith("/") && !this.returnUrl.StartsWith("//") && !this.returnUrl.StartsWith("/\\"))
                {
                    return this.Redirect(this.returnUrl);
                }
                if (((localAgencyContact)base.Session["agent"]).ResetPassword)
                {
                    return base.RedirectToAction("ResetTempPassword", "Account", new { tempPwd = model.Password });
                }
                base.Session["UserRole"] = (AGENT_ROLE)((localAgencyContact)base.Session["agent"]).Role;
                return base.RedirectToAction("PostLoginHome", "Home");
            }
            else if (utoken.UserTypeID == 2)
            {
                // 2 == camp JHF

                base.Session["campcontactAppID"] = num;
                base.Session["usertoken"] = -1;
                base.Session["campSiteAppID"] = -1;
                base.Session["campcorpAppID"] = -1; // JHF 9/29/20
                base.Session["campcontact"] = new localCampContact();
                retNewCampToken token = WebSessionManager.getCampToken("webt", (int)base.Session["campcontactAppID"]);
                if (token.CampContactAppID == 0)
                {
                    base.ModelState.AddModelError(string.Empty, "There is no registered profile for the given login. Please contact your camp administrator for an account.");
                    base.ViewData["PreLogin"] = AccountController.preloginMessage;
                    return base.View();
                }
                if (!token.RequestFailed)
                {
                    base.Session["usertoken"] = token.Token;
                    base.Session["campSiteAppID"] = token.CampSiteAppID;
                    retRecordoflocalCampContact campContactretRecord = WebSessionManager.getCampContactretRecord((int)base.Session["usertoken"], (int)base.Session["campcontactAppID"]);
                    if (!campContactretRecord.RequestFailed)
                    {
                        base.Session["campcontact"] = campContactretRecord.Item;
                    }
                    else
                    {
                        base.Session["campcontact"] = new localCampContact();
                    }

                    // get the camp record
                    // store campcorpappid in session
                    // if camprecord.status != 50...

                    localCampSite lcs = WebSessionManager.getCampRecord2((int)base.Session["usertoken"], (int)base.Session["campcontactAppID"], (int)base.Session["campSiteAppID"]);
                    base.Session["campcorpAppID"] = lcs.CampCorpAppID;
                    if(lcs.Status != 50)

                    //if (WebSessionManager.getCampRecord2((int)base.Session["usertoken"], (int)base.Session["campcontactAppID"], (int)base.Session["campSiteAppID"]).Status != 50) // JHF 10/25/19
                    {
                        base.ModelState.AddModelError(string.Empty, "Your camp has not yet been approved for submitting Camp Applications. Please await approval or contact your camp contact.");
                        base.ViewData["PreLogin"] = AccountController.preloginMessage;
                        return base.View();
                    }
                }
                if (!((localCampContact)base.Session["campcontact"]).HasWebAccess)
                {
                    base.ModelState.AddModelError(string.Empty, "Sorry, you currently do not have permission to login to the system. Please await approval or ask your camp contact.");
                    base.ViewData["PreLogin"] = AccountController.preloginMessage;
                    return base.View();
                }
                FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                if (base.Url.IsLocalUrl(this.returnUrl) && this.returnUrl.Length > 1 && this.returnUrl.StartsWith("/") && !this.returnUrl.StartsWith("//") && !this.returnUrl.StartsWith("/\\"))
                {
                    return this.Redirect(this.returnUrl);
                }
                if (((localCampContact)base.Session["campcontact"]).ResetPassword)
                {
                    return base.RedirectToAction("ResetTempPassword", "Account", new { tempPwd = model.Password });
                }
                base.Session["UserRole"] = (CAMPCONTACT_ROLE)((localCampContact)base.Session["campcontact"]).Role;
                return base.RedirectToAction("PostLoginCampHome", "Home");
            }
            else
            {
                // neither camp user nor agency user
                base.ModelState.AddModelError(string.Empty, "Sorry, you currently do not have camp permission to login to the system. Please await approval or ask your camp administrator.");
                base.ViewData["PreLogin"] = AccountController.preloginMessage;
                return base.View();
            }
            //
            //  if 1, proceed logging in as Agent
            //
            //else if 2
            //
            //  Proceed logging in as CampContact
            //




            
		}

		public ActionResult Logout()
		{
			ClearCache.ClearAllCache();
			return base.View();
		}

		public ViewResult MyProfile(string Id)
		{
			int num;
			ClearCache.ClearAllCache();
			localAgencyContact _localAgencyContact = new localAgencyContact();
			if (!int.TryParse(Id, out num))
			{
				((dynamic)base.ViewBag).Message = "My Profile";
				localAgencyContact item = new localAgencyContact();
				if (base.Session["agent"] != null)
				{
					item = (localAgencyContact)base.Session["agent"];
				}
				if (Id == "mps")
				{
					base.ViewData["Messages"] =  "Your profile updated successfully";
				}
				else if (Id != "mpf")
				{
					base.ViewData["Messages"] =  "";
				}
				else
				{
					base.ViewData["Messages"] = "Sorry, there was a problem in updating your profile. Please try again later or contact administrator if problem persists. ";
				}
				return base.View(item);
			}
			localAgencyContact agencyContactRecord = WebSessionManager.getAgencyContactRecord((int)base.Session["usertoken"], (int)base.Session["agentAppId"]);
			this.copylocalAgencyContact2Model(ref _localAgencyContact, agencyContactRecord);
			if (num != (int)base.Session["agentAppID"])
			{
				((dynamic)base.ViewBag).Message = _localAgencyContact.Name;
			}
			else
			{
				((dynamic)base.ViewBag).Message = "My Profile";
			}
			return base.View(_localAgencyContact);
		}




        public ViewResult MyCampContactProfile(string Id)
        {
            int num;
            //Id = "502410"; // JHF testing 9/10/20
            ClearCache.ClearAllCache();
            localCampContact _localCampContact = new localCampContact();
            if (!int.TryParse(Id, out num))
            {
                ((dynamic)base.ViewBag).Message = "My Camp Contact Profile";
                localCampContact item = new localCampContact();
                if (base.Session["campcontact"] != null)
                {
                    item = (localCampContact)base.Session["campcontact"];
                }
                if (Id == "mps")
                {
                    base.ViewData["Messages"] = "Your camp user profile updated successfully";
                }
                else if (Id != "mpf")
                {
                    base.ViewData["Messages"] = "";
                }
                else
                {
                    base.ViewData["Messages"] = "Sorry, there was a problem in updating your camp user profile. Please try again later or contact administrator if problem persists. ";
                }
                return base.View(item);
            }
            localCampContact campContactRecord = WebSessionManager.getCampContactRecord((int)base.Session["usertoken"], (int)base.Session["campcontactAppId"]);
            this.copylocalCampContact2Model(ref _localCampContact, campContactRecord);
            if (num != (int)base.Session["campcontactAppID"])
            {
                ((dynamic)base.ViewBag).Message = _localCampContact.Name;
                base.ViewData["Messages"] = ""; // testing JHF 9/10/20
            }
            else
            {
                ((dynamic)base.ViewBag).Message = "My Camp Contact Profile";
                base.ViewData["Messages"] = ""; // testing JHF 9/10/20
            }
            return base.View(_localCampContact);
        }




        public ViewResult CampMenuList(string Id)
        {
            int num;
            ClearCache.ClearAllCache();
            localCampContact _localCampContact = new localCampContact();
            if (!int.TryParse(Id, out num))
            {
                ((dynamic)base.ViewBag).Message = "My Camp Contact Profile";
                localCampContact item = new localCampContact();
                if (base.Session["campcontact"] != null)
                {
                    item = (localCampContact)base.Session["campcontact"];
                }
                if (Id == "mps")
                {
                    base.ViewData["Messages"] = "Your camp user profile updated successfully";
                }
                else if (Id != "mpf")
                {
                    base.ViewData["Messages"] = "";
                }
                else
                {
                    base.ViewData["Messages"] = "Sorry, there was a problem in updating your camp user profile. Please try again later or contact administrator if problem persists. ";
                }
                return base.View(item);
            }
            localCampContact campContactRecord = WebSessionManager.getCampContactRecord((int)base.Session["usertoken"], (int)base.Session["campcontactAppId"]);
            this.copylocalCampContact2Model(ref _localCampContact, campContactRecord);
            if (num != (int)base.Session["campcontactAppID"])
            {
                ((dynamic)base.ViewBag).Message = _localCampContact.Name;
            }
            else
            {
                ((dynamic)base.ViewBag).Message = "My Camp Contact Profile";
            }
            return base.View(_localCampContact);
        }

        public ViewResult ListAttachmentsForSite(string Id)
        {
            int num;
            ClearCache.ClearAllCache();
            localCampSiteListItem _localCampSiteListItem = new localCampSiteListItem();
            if (!int.TryParse(Id, out num))
            {
                ((dynamic)base.ViewBag).Message = "Camp Site Attachments List";
                localCampSiteListItem item = new localCampSiteListItem();
                if (base.Session["campsite"] != null)
                {
                    item = (localCampSiteListItem)base.Session["campsitelistitem"];
                }
                if (Id == "mps")
                {
                    base.ViewData["Messages"] = "Attachment list retrieved successfully";
                }
                else if (Id != "mpf")
                {
                    base.ViewData["Messages"] = "";
                }
                else
                {
                    base.ViewData["Messages"] = "Sorry, there was a problem in retrieving the attachments list. Please try again later or contact administrator if problem persists. ";
                }
                return base.View(item);
            }
            retRecordoflocalCampSiteListItem campSiteListItemRecord = WebSessionManager.getCampSiteListItemRecord((int)base.Session["campsiteAppId"]);
            //int campSiteListItemRecord = WebSessionManager.getCampSiteListItemRecord((int)base.Session["campsiteAppId"]);
            //this.copylocalCampSiteListItem2Model(ref _localCampSiteListItem, campSiteListItemRecord.Item); // JHF 1/9/20 fix this...............
            if (num != (int)base.Session["campsiteAppID"])
            {
                ((dynamic)base.ViewBag).Message = _localCampSiteListItem.Title;
            }
            else
            {
                ((dynamic)base.ViewBag).Message = "My Camp Site Profile";
            }
            return base.View(_localCampSiteListItem);
        }

        [ActionName("MyProfile")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="SubmitMyProfile")]
		public ActionResult MyProfile(localAgencyContact model)
		{
			if (!this.updateMylocalAgencyUserProfile(ref model))
			{
				return base.RedirectToAction("MyProfile", "Account", new { Id = "mpf" });
			}
			base.Session["agent"] = model;
			return base.RedirectToAction("MyProfile", "Account", new { Id = "mps" });
		}

        [ActionName("MyCampContactProfile")]
        [HttpPost]
        [LinkActionToButtonName(SubmitButtonName = "SubmitMyCampContactProfile")]
        public ActionResult MyCampContactProfile(localCampContact model)
        {
            if (!this.updateMylocalCampContactProfile(ref model))
            {
                return base.RedirectToAction("MyCampContactProfile", "Account", new { Id = "mpf" });
            }
            base.Session["campcontact"] = model;
            return base.RedirectToAction("MyCampContactProfile", "Account", new { Id = "mps" });
        }

        [ActionName("CampMenuList")]
        [HttpPost]
        [LinkActionToButtonName(SubmitButtonName = "SubmitCampMenuList")]
        public ActionResult CampMenuList(localCampContact model)
        {
            //if (!this.updateMylocalCampUserProfile(ref model))
            //{
            //    return base.RedirectToAction("MyProfile", "Account", new { Id = "mpf" });
            //}
            base.Session["agent"] = model;
            return base.RedirectToAction("CampMenuList", "Account", new { Id = "mps" });
        }

        public ActionResult NewCamp()
		{
			return base.View();
		}

		protected override void OnActionExecuted(ActionExecutedContext filterContext)
		{
			base.OnActionExecuted(filterContext);
		}

		protected override void OnActionExecuting(ActionExecutingContext filterContext)
		{
			if (!System.Web.HttpContext.Current.User.Identity.IsAuthenticated || base.Session["UserRole"] == null) // JHF - added ...!= "registercamp" &&...below
			{
				if (filterContext.ActionDescriptor.ActionName.ToLower() != "register" && filterContext.ActionDescriptor.ActionName.ToLower() != "registercamp" && filterContext.ActionDescriptor.ActionName.ToLower() != "logon" && filterContext.ActionDescriptor.ActionName.ToLower() != "info" && filterContext.ActionDescriptor.ActionName.ToLower() != "forgotpassword" && filterContext.ActionDescriptor.ActionName.ToLower() != "changepassword" && filterContext.ActionDescriptor.ActionName.ToLower() != "resettemppassword" && filterContext.ActionDescriptor.ActionName.ToLower() != "logout")
				{
					filterContext.Result = new RedirectResult(base.Url.Action("LogOn", "Account"));
				}
				if (filterContext.ActionDescriptor.ActionName.ToLower() == "logon")
				{
					HttpRequestBase request = filterContext.HttpContext.Request;
					HttpResponseBase response = filterContext.HttpContext.Response;
					if (!request.IsSecureConnection && !request.IsLocal)
					{
						string str = request.Url.ToString().ToLower().Replace("http:", "https:");
						response.Redirect(str);
					}
				}
			}
			if (base.Session["UserRole"] != null)
			{
				HttpRequestBase httpRequestBase = filterContext.HttpContext.Request;
				HttpResponseBase httpResponseBase = filterContext.HttpContext.Response;
				if (base.Session["UserRole"].ToString().ToLower() == "user" && (filterContext.ActionDescriptor.ActionName.ToLower() == "localAgencyuserslist" || filterContext.ActionDescriptor.ActionName.ToLower() == "updatelocalAgencyprofile" || filterContext.ActionDescriptor.ActionName.ToLower() == "AgencyContactRegistration" || filterContext.ActionDescriptor.ActionName.ToLower() == "reports"))
				{
					httpResponseBase.Redirect(base.Url.Action("PostLoginHome", "Home"));
				}
			}
			base.OnActionExecuting(filterContext);
		}

		public ActionResult Register()
		{
			RegisterModel registerModel = new RegisterModel()
			{
				City = "Philadelphia",
				State = "PA"
			};
			return base.View(registerModel);
		}

        public ActionResult RegisterCamp()
        {
            CampRegisterModel campregisterModel = new CampRegisterModel()
            {
                SiteCity = "Philadelphia",
                SiteState = "PA"
            };
            return base.View(campregisterModel);
        }

        [HttpPost]
		public ActionResult Register(RegisterModel regmdl)
		{
			MembershipCreateStatus membershipCreateStatu;
			localAgency _localAgency = new localAgency();
			localAgencyContact _localAgencyContact = new localAgencyContact();
			this.copyRegModel2localAgency(regmdl, ref _localAgency);
			this.copyRegModel2localAgencyContact(regmdl, ref _localAgencyContact);

			if (!WebSessionManager.canAgencyRegister(_localAgency))
			{
				base.ModelState.AddModelError("", "Sorry, there appears to be a problem registering your agency with the given agency provider number. Please correct and try again.");
				return base.View(regmdl);
			}
			if (Membership.FindUsersByEmail(regmdl.Email).Count != 0)
			{
				base.ModelState.AddModelError("", "The given email address is already registered.");
				return base.View(regmdl);
			}
			int num = WebSessionManager.registerNewAgency(_localAgency, _localAgencyContact);
			if (num == -1 || num == 0)
			{
				base.ModelState.AddModelError("", "There was a problem registering your agency. Please check all values and try again.");
				return base.View(regmdl);
			}
			string str = num.ToString("D32");
			Membership.CreateUser(regmdl.Email, regmdl.Password, regmdl.Email, null, null, true, new Guid(str), out membershipCreateStatu);
			if (membershipCreateStatu == MembershipCreateStatus.Success)
			{
				FormsAuthentication.SetAuthCookie(regmdl.Email, false);
				return base.RedirectToAction("Info", "Account", new { Id = "register" });
			}
			base.ModelState.AddModelError("", string.Concat("There was a problem registering your information. Please try again. Error: ", AccountController.ErrorCodeToString(membershipCreateStatu)));
			return base.View(regmdl);
		}

        [HttpPost]
        public ActionResult RegisterCamp(CampRegisterModel campregmdl) // JHF
        {
            MembershipCreateStatus membershipCreateStatu;
            localCampCorp _localCampCorp = new localCampCorp(); // JHF 11/18/19
            localCampSite _localCampSite = new localCampSite(); // JHF
            localCampContact _localCampContact = new localCampContact(); // JHF
            this.copyCampRegModel2localCampCorp(campregmdl, ref _localCampCorp); // JHF 11/18/19
            this.copyCampRegModel2localCampSite(campregmdl, ref _localCampSite);
            this.copyCampRegModel2localCampContact(campregmdl, ref _localCampContact);
            
            if (!WebSessionManager.canCampRegister(_localCampSite))
            {
                base.ModelState.AddModelError("", "Sorry, there appears to be a problem registering your camp with the given agency provider number. Please correct and try again.");
                return base.View(campregmdl);
            }
            if (Membership.FindUsersByEmail(campregmdl.SA_Email).Count != 0)
            {
                base.ModelState.AddModelError("", "The given email address is already registered.");
                return base.View(campregmdl);
            }
            int num = WebSessionManager.registerNewCamp(_localCampSite, _localCampContact, _localCampCorp);
            //int num = WebSessionManager.registerNewCamp(_localCampSite, _localCampContact);
            if (num == -1 || num == 0)
            {
                base.ModelState.AddModelError("", "There was a problem registering your camp. Please check all values and try again.");
                return base.View(campregmdl);
            }
            string str = num.ToString("D32");
            Membership.CreateUser(campregmdl.SA_Email, campregmdl.Password, campregmdl.SA_Email, null, null, true, new Guid(str), out membershipCreateStatu);
            if (membershipCreateStatu == MembershipCreateStatus.Success)
            {
                FormsAuthentication.SetAuthCookie(campregmdl.SA_Email, false);
                return base.RedirectToAction("Info", "Account", new { Id = "register" });
            }
            base.ModelState.AddModelError("", string.Concat("There was a problem registering your camp information. Please try again. Error: ", AccountController.ErrorCodeToString(membershipCreateStatu)));
            return base.View(campregmdl);
        }

        [ActionName("MyProfile")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="ResetPasswordMyProfile")]
		public ActionResult ResetPasswordMyProfile(localAgencyContact model)
		{
			return base.RedirectToAction("ChangePassword", "Account", new { Id = "cpwd" });
		}

		[Authorize]
		[HttpGet]
		public ActionResult ResetTempPassword(string tempPwd)
		{
			base.Session["tempPwd"] = tempPwd;
			return base.View();
		}

		[Authorize]
		[HttpPost]
		public ActionResult ResetTempPassword(ResetTempPasswordModel model, string tempPwd)
		{
			int num;
			ActionResult action;
			if (base.ModelState.IsValid)
			{
				try
				{
					Guid providerUserKey = (Guid)Membership.GetUser(base.User.Identity.Name).ProviderUserKey;
					string str = providerUserKey.ToString("N");
					int.TryParse(str, out num);
					retToken token = WebSessionManager.getToken("webt", num);
					if (token.AgentAppID == 0 || token.RequestFailed)
					{
						base.ModelState.AddModelError("", "Sorry, but the system could not access your profile. Please try again. Code 90400");
					}
					else
					{
						localAgencyContact agencyContactRecord = WebSessionManager.getAgencyContactRecord((int)base.Session["usertoken"], (int)base.Session["agentAppID"]);
						if (agencyContactRecord == null)
						{
							base.ModelState.AddModelError("", "Sorry, but the system could not access your profile. Please try again. Code 90300");
						}
						else
						{
							agencyContactRecord.ResetPassword = false;
							WebSessionManager.saveAgencyContactRecord(token.Token, num, token.AgencyAppID, agencyContactRecord);
							MembershipUser user = Membership.GetUser(base.User.Identity.Name, true);
							user.ChangePassword(tempPwd, model.NewPassword);
							action = base.RedirectToAction("Info", "Account", new { Id = "changePasswordSuccessful" });
							return action;
						}
					}
					return base.View(model);
				}
				catch (Exception exception1)
				{
					Exception exception = exception1;
					base.ModelState.AddModelError("", string.Concat("Sorry, but the system could not access your profile. Please try again. Code 90500. ", exception.Message));
					return base.View(model);
				}
				return action;
			}
			return base.View(model);
		}

		private bool SendTmpPwdEmail(string userEmail, string strTmpPwd)
		{
			bool flag;
			localTmpPwd _localTmpPwd = new localTmpPwd();
			try
			{
				_localTmpPwd = WebSessionManager.getlocalTmpPwd();
				string from = _localTmpPwd.From;
				string bCC = _localTmpPwd.BCC;
				string str = userEmail;
				int num = int.Parse(_localTmpPwd.Port);
				SmtpClient smtpClient = new SmtpClient(_localTmpPwd.Host, num)
				{
					EnableSsl = false,
					Credentials = new NetworkCredential(_localTmpPwd.UserID, _localTmpPwd.Password)
				};
				MailMessage mailMessage = new MailMessage()
				{
					From = new MailAddress(from)
				};
				mailMessage.To.Add(str);
				mailMessage.Bcc.Add(bCC);
				mailMessage.Subject = "SummerCamp login";
				mailMessage.BodyEncoding = Encoding.UTF8;
				mailMessage.IsBodyHtml = true;
				StringBuilder stringBuilder = new StringBuilder();
				stringBuilder.Append(string.Concat(userEmail, ", <br/><br/>"));
				stringBuilder.Append(string.Concat(_localTmpPwd.Line1, "<br/><br/>"));
				stringBuilder.Append(string.Concat(strTmpPwd, "<br/><br/>"));
				stringBuilder.Append(string.Concat(_localTmpPwd.Line2, "<br/><br/>"));
				stringBuilder.Append(string.Concat(_localTmpPwd.Line3, "<br/><br/>"));
				mailMessage.Body = stringBuilder.ToString();
				smtpClient.Send(mailMessage);
				flag = true;
			}
			catch (SmtpFailedRecipientException smtpFailedRecipientException)
			{
				flag = false;
			}
			catch (Exception exception)
			{
				flag = false;
			}
			return flag;
		}

		private bool SendTmpPwdEmail_old(string userEmail, string strTmpPwd) // JHF
		{
            //string str = "summercamp@dbhids.org";
            //string str1 = "prakashgovind@realtechinc.com";
            string str = "jeffrey.fisher@phila.gov";
            string str1 = "jeffrey.fisher@phila.gov";
            string str2 = userEmail;
			SmtpClient smtpClient = new SmtpClient("relay.city.phila.local", 25)
			{
				EnableSsl = false,
				Credentials = new NetworkCredential("lns243", "nealo315")
			};
			MailMessage mailMessage = new MailMessage()
			{
				From = new MailAddress(str)
			};
            mailMessage.To.Add(str2);
            mailMessage.Bcc.Add(str1);
            mailMessage.Subject = "[secure] SummerCamp login"; // JHF 2/16/22
            mailMessage.BodyEncoding = Encoding.UTF8;
            mailMessage.IsBodyHtml = true;
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(userEmail, ", <br/><br/>"));
            stringBuilder.Append("Please use this temporary password to login to SummerCamp application:<br/><br/>");
            stringBuilder.Append(string.Concat(strTmpPwd, "<br/><br/>"));
            stringBuilder.Append("Once you login you may reset your password.<br/><br/>"); // JHF 2/16/22
            stringBuilder.Append("Please click <a href=\"https://dbhidsapps1qa.phila.gov/SCagency/SummerCamp/Account/LogOn\">here</a> to access SummerCamp.<br/><br/>");
            mailMessage.Body = stringBuilder.ToString();
            smtpClient.Send(mailMessage);
			return true;
		}

		public ActionResult UpdateAgencyProfile(string Id)
		{
			ClearCache.ClearAllCache();
			localAgency _localAgency = new localAgency();
			localAgency agencyRecord = new localAgency();
			agencyRecord = WebSessionManager.getAgencyRecord((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"]);
			this.copylocalAgency2Model(ref _localAgency, agencyRecord);
			if (Id == "ups")
			{
				base.ViewData["Messages"] =  "localAgency profile updated successfully";
			}
			else if (Id != "upf")
			{
				base.ViewData["Messages"] = "";
			}
			else
			{
				base.ViewData["Messages"] =  "Sorry, there was a problem in updating localAgency profile. Please try again later or contact administrator if problem persists. ";
			}
			return base.View(_localAgency);
		}

		[ActionName("UpdateAgencyProfile")]
		[HttpPost]
		[LinkActionToButtonName(SubmitButtonName="UpdateAgency")]
		public ActionResult UpdateAgencyProfile(localAgency model)
		{
			ClearCache.ClearAllCache();
			if (!base.ModelState.IsValid)
			{
				return base.View(model);
			}
			localAgency _localAgency = new localAgency();
			string[] allKeys = base.Request.Form.AllKeys;
			_localAgency = WebSessionManager.getAgencyRecord((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"]);
			this.copyModel2localAgency(model, ref _localAgency);
			bool flag = WebSessionManager.saveAgencyRecord((int)base.Session["usertoken"], _localAgency);
			model = WebSessionManager.getAgencyRecord((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"]);
			if (!flag)
			{
				return base.RedirectToAction("UpdateAgencyProfile", "Account", new { Id = "upf" });
			}
			base.Session["localAgency"] = model;
			return base.RedirectToAction("UpdateAgencyProfile", "Account", new { Id = "ups" });
		}

        public ActionResult CampSiteProfile(string Id) // JHF ups means success; upf means fail.
        {
            int i = -1;
            ClearCache.ClearAllCache();
            localCampSite _localCampSite = new localCampSite();
            localCampSite campsiteRecord = new localCampSite();
            if(!Id.Equals("ups") && !Id.Equals("upf")) // JHF 10/2/20
            { 
                i = int.Parse(Id); // JHF 10/2/20
                base.Session["campsiteAppId"] = i; // JHF 10/2/20
            }
            campsiteRecord = WebSessionManager.getCampSiteRecord((int)base.Session["usertoken"], (int)base.Session["campsiteAppId"]); // JHF test
            this.copylocalCampSite2Model(ref _localCampSite, campsiteRecord);
            if (Id == "ups")
            {
                base.ViewData["Messages"] = "localCampSite profile updated successfully";
            }
            else if (Id != "upf")
            {
                base.ViewData["Messages"] = "";
            }
            else
            {
                base.ViewData["Messages"] = "Sorry, there was a problem in updating localCampSite profile. Please try again later or contact administrator if problem persists. ";
            }
            return base.View(_localCampSite);
        }

        [ActionName("CampSiteProfile")]
        [HttpPost]
        [LinkActionToButtonName(SubmitButtonName = "UpdateCampSite")]
        public ActionResult CampSiteProfile(localCampSite model)
        {
            ClearCache.ClearAllCache();
            if (!base.ModelState.IsValid)
            {
                return base.View(model);
            }
            localCampSite _localCampSite = new localCampSite();
            string[] allKeys = base.Request.Form.AllKeys;
            //_localCampSite = WebSessionManager.getCampSiteRecord((int)base.Session["usertoken"], (int)base.Session["campcontactAppId"], (int)base.Session["campsiteAppId"]);
            _localCampSite = WebSessionManager.getCampSiteRecord((int)base.Session["usertoken"], Convert.ToInt32(base.Session["campsiteAppId"])); // JHF 10/2/20
            this.copyModel2localCampSite(model, ref _localCampSite);
            bool flag = WebSessionManager.saveCampSiteRecord((int)base.Session["usertoken"], Convert.ToInt32(base.Session["campsiteAppId"]), _localCampSite); // JHF 10/2/20
            model = WebSessionManager.getCampSiteRecord((int)base.Session["usertoken"], Convert.ToInt32(base.Session["campsiteAppId"])); // JHF 10/2/20
            if (!flag)
            {
                return base.RedirectToAction("CampSiteProfile", "Account", new { Id = "upf" });
            }
            base.Session["localCampSite"] = model;
            return base.RedirectToAction("CampSiteProfile", "Account", new { Id = "ups" });
        }

        [ActionName("UpdatelocalAgencyContactRegistration")]
		[HttpGet]
		public ViewResult UpdatelocalAgencyContactRegistration()
		{
			((dynamic)base.ViewBag).Message = "Update localAgency Contact";
			return base.View("AgencyContactRegistration");
		}

        [ActionName("UpdatelocalCampContactRegistration")]
        [HttpGet]
        public ViewResult UpdatelocalCampContactRegistration()
        {
            ((dynamic)base.ViewBag).Message = "Update localCamp Contact";
            return base.View("CampContactRegistration");
        }

        private bool updatelocalAgencyUserProfile(ref localAgencyContact model)
		{
			localAgencyContact agencyContactRecord = WebSessionManager.getAgencyContactRecord((int)base.Session["usertoken"], model.AppID);
			this.copyModel2localAgencyContact(model, ref agencyContactRecord);
			bool flag = WebSessionManager.saveAgencyContactRecord((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], agencyContactRecord);
			if (flag)
			{
				agencyContactRecord = WebSessionManager.getAgencyContactRecord((int)base.Session["usertoken"], model.AppID);
				this.copylocalAgencyContact2Model(ref model, agencyContactRecord);
			}
			return flag;
		}

        private bool updatelocalCampSiteProfile(ref localCampSite model)
        {
            localCampSite campSiteRecord = WebSessionManager.getCampSiteRecord((int)base.Session["usertoken"], model.AppID); // 4 just placeholder JHF 12/2/19
            this.copyModel2localCampSite(model, ref campSiteRecord);
            bool flag = WebSessionManager.saveCampSiteRecord((int)base.Session["usertoken"], (int)base.Session["campSiteAppId"], campSiteRecord);
            if (flag)
            {
                campSiteRecord = WebSessionManager.getCampSiteRecord((int)base.Session["usertoken"], model.AppID); // 5 just placeholder JHF 12/2/19
                this.copylocalCampSite2Model(ref model, campSiteRecord);
            }
            return flag;
        }

        //private bool updatelocalCampSiteProfile(ref CampSiteRegisterModel model)
        //{
        //    CampSiteRegisterModel campSiteRecord = WebSessionManager.getCampSiteRecord((int)base.Session["usertoken"], model.AppID);
        //    this.copyModel2localCampSite(model, ref campSiteRecord);
        //    bool flag = WebSessionManager.saveCampSiteRecord((int)base.Session["usertoken"], (int)base.Session["campsiteAppId"], (int)base.Session["campSiteAppId"], campSiteRecord);
        //    if (flag)
        //    {
        //        campSiteRecord = WebSessionManager.getCampSiteRecord((int)base.Session["usertoken"], model.AppID);
        //        this.copylocalCampSite2Model(ref model, campSiteRecord);
        //    }
        //    return flag;
        //}

        private bool updatelocalCampContactProfile(ref localCampContact model)
        {
            localCampContact campContactRecord = WebSessionManager.getCampContactRecord((int)base.Session["usertoken"], model.AppID);
            this.copyModel2localCampContact(model, ref campContactRecord);
            bool flag = WebSessionManager.saveCampContactRecord((int)base.Session["usertoken"], (int)base.Session["campcontactAppId"], (int)base.Session["campSiteAppId"], campContactRecord);
            if (flag)
            {
                campContactRecord = WebSessionManager.getCampContactRecord((int)base.Session["usertoken"], model.AppID);
                this.copylocalCampContact2Model(ref model, campContactRecord);
            }
            return flag;
        }

        private bool updateMylocalAgencyUserProfile(ref localAgencyContact model)
		{
			localAgencyContact agencyContactRecord = WebSessionManager.getAgencyContactRecord((int)base.Session["usertoken"], (int)base.Session["agentAppId"]);
			this.copyModel2localAgencyContact(model, ref agencyContactRecord);
			bool flag = WebSessionManager.saveAgencyContactRecord((int)base.Session["usertoken"], (int)base.Session["agentAppId"], (int)base.Session["agencyAppId"], agencyContactRecord);
			return flag;
		}

        private bool updateMylocalCampContactProfile(ref localCampContact model)
        {
            localCampContact campContactRecord = WebSessionManager.getCampContactRecord((int)base.Session["usertoken"], (int)base.Session["campcontactAppId"]);
            this.copyModel2localCampContact(model, ref campContactRecord);
            bool flag = WebSessionManager.saveCampContactRecord((int)base.Session["usertoken"], (int)base.Session["campcontactAppId"], (int)base.Session["campSiteAppId"], campContactRecord);
            return flag;
        }

        private bool UserExists(string strEmail)
		{
			if (Membership.GetUser(strEmail) != null)
			{
				return true;
			}
			return false;
		}
	}
}