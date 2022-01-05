using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;
using System.Web.Mvc;
using CompareAttribute = System.Web.Mvc.CompareAttribute;

namespace com.rti.tailspinnew.web.Models // JHF
{
    public class CampRegisterModel
    {
        // begin Corp fields section
        [Display(Name = "Business Name")]
        public string CorpName
        {
            get;
            set;
        }

        [Display(Name = "Address Line 1")]
        public string Corpline1
        {
            get;
            set;
        }

        [Display(Name = "Address Line 2")]
        [StringLength(100, ErrorMessage = "String must be less than 100 characters")]
        public string Corpline2
        {
            get;
            set;
        }

        [Display(Name = "City")]
        [StringLength(50, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 2)]
        public string CorpCity
        {
            get;
            set;
        }

        [Display(Name = "*State")]
        [StringLength(2, ErrorMessage = "The {0} must be {2} characters long.", MinimumLength = 2)]
        public string CorpState
        {
            get;
            set;
        }

        [Display(Name = "Zip")]
        public string CorpZip
        {
            get;
            set;
        }

        //[DataType(DataType.Text, ErrorMessage = "Invalid name")]
        [Display(Name = "Business Contact")]
        public string CorpContact
        {
            get;
            set;
        }

        [DataType(DataType.PhoneNumber, ErrorMessage = "Invalid phone number")]
        [Display(Name = "Business Phone")]
        [RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage = "Invalid Phone Number")]
        public string CorpPhone
        {
            get;
            set;
        }

        //[DataType(DataType.Custom, ErrorMessage = "Invalid phone extension")]
        [Display(Name = "Ext.")]
        [RegularExpression("^[0-9]{0,5}?$", ErrorMessage = "Invalid Phone Extension")]
        public string CorpPhoneExt
        {
            get;
            set;
        }

        [DataType(DataType.PhoneNumber, ErrorMessage = "Invalid fax number")]
        [Display(Name = "Business Fax")]
        [RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage = "Invalid Fax Number")]
        public string CorpFax
        {
            get;
            set;
        }

        [DataType(DataType.EmailAddress, ErrorMessage = "Invalid e-mail address")]
        [Display(Name = "Business Email")]
        public string CorpEmail
        {
            get;
            set;
        }

        [DataType(DataType.Url, ErrorMessage = "Invalid website address")]
        [Display(Name = "Business Website")]
        public string CorpWebsite
        {
            get;
            set;
        }


        // begin Site fields section
        [Display(Name = "*Site Name")]
        [Required(ErrorMessage = "Please enter the name of your camp site.")]
        public string SiteName
        {
            get;
            set;
        }

        [Display(Name = "*Address Line 1")]
        [Required(ErrorMessage = "Site address is required.")]
        public string Siteline1
        {
            get;
            set;
        }

        [Display(Name = "Address Line 2")]
        [StringLength(100, ErrorMessage = "String must be less than 100 characters")]
        public string Siteline2
        {
            get;
            set;
        }

        [Display(Name = "*City")]
        [Required(ErrorMessage = "City is required.")]
        [StringLength(50, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 2)]
        public string SiteCity
        {
            get;
            set;
        }

        [Display(Name = "*State")]
        [Required(ErrorMessage = "State is required.")]
        [StringLength(2, ErrorMessage = "The {0} must be {2} characters long.", MinimumLength = 2)]
        public string SiteState
        {
            get;
            set;
        }

        [Display(Name = "*Zip")]
        [Required(ErrorMessage = " Zip is required.")]
        public string SiteZip
        {
            get;
            set;
        }

        [DataType(DataType.PhoneNumber, ErrorMessage = "Invalid phone number")]
        [Display(Name = "*Site Phone 1")]
        [RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage = "Invalid Phone Number")]
        [Required(ErrorMessage = "Site Phone is required.")]
        public string SitePhone1
        {
            get;
            set;
        }

        //[DataType(DataType.Custom, ErrorMessage = "Invalid phone extension")]
        [Display(Name = "Ext.")]
        [RegularExpression("^[0-9]{0,5}?$", ErrorMessage = "Invalid Phone Extension")]
        public string SitePhoneExt1
        {
            get;
            set;
        }

        [DataType(DataType.PhoneNumber, ErrorMessage = "Invalid phone number")]
        [Display(Name = "Site Phone 2")]
        [RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage = "Invalid Phone Number")]
        public string SitePhone2
        {
            get;
            set;
        }

        //[DataType(DataType.Custom, ErrorMessage = "Invalid phone extension")]
        [Display(Name = "Ext.")]
        [RegularExpression("^[0-9]{0,5}?$", ErrorMessage = "Invalid Phone Extension")]
        public string SitePhoneExt2
        {
            get;
            set;
        }

        [DataType(DataType.PhoneNumber, ErrorMessage = "Invalid fax number")]
        [Display(Name = "Camp Site Fax")]
        [RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage = "Invalid Fax Number")]
        public string SiteFax
        {
            get;
            set;
        }

        [DataType(DataType.EmailAddress, ErrorMessage = "Invalid e-mail address")]
        [Display(Name = "Site Email")]
        public string SiteEmail
        {
            get;
            set;
        }

        [DataType(DataType.Url, ErrorMessage = "Invalid website address")]
        [Display(Name = "Site Website")]
        public string SiteWebsite
        {
            get;
            set;
        }

        //[DataType(DataType.Text, ErrorMessage = "Invalid name")]
        [Display(Name = "Who signed agreement")]
        public string WhoSignedAgreement
        {
            get;
            set;
        }

        //[DataType(DataType.Text, ErrorMessage = "Invalid title")]
        [Display(Name = "Title of who signed agreement")]
        public string TitleOfWhoSignedAgreement
        {
            get;
            set;
        }

        // begin super admin fields section
        [Display(Name = "*First name", Description = "Super Admin's first name.")]
        [Required(ErrorMessage = "First name is required.")]
        public string SA_FirstName
        {
            get;
            set;
        }

        [Display(Name = "*Last name", Description = "Super Admin's last name.")]
        [Required(ErrorMessage = "Last name is required.")]
        public string SA_LastName
        {
            get;
            set;
        }

        [Display(Name = "Middle Initial", Description = "Super Admin's middle inital.")]
        public string SA_MiddleInitial
        {
            get;
            set;
        }

        [DataType(DataType.EmailAddress, ErrorMessage = "Invalid Email Address")]
        [Display(Name = "*Email (Login Id)", Description = "Email address will be used as login id. Personal emails like hotmail, yahoo, comcast, gmail, etc., are not allowed.")]
        [Key]
        [Required(ErrorMessage = "Email is required.")]
        public string SA_Email
        {
            get;
            set;
        }

        [DataType(DataType.Password)]
        [Display(Name = "*Password", Description = "At least 6 characters that is hard to guess and easy to remember.")]
        [Required(ErrorMessage = "Password is required.")]
        [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
        public string Password
        {
            get;
            set;
        }

        [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
        [DataType(DataType.Password)]
        [Display(Name = "*Confirm password")]
        public string ConfirmPassword
        {
            get;
            set;
        }

        [DataType(DataType.PhoneNumber, ErrorMessage = "Invalid Phone Number")]
        [Display(Name = "*Primary Phone")]
        [RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage = "Invalid Phone Number")]
        [Required(ErrorMessage = "Camp contact's phone is required.")]
        public string SA_Phone1
        {
            get;
            set;
        }

        [Display(Name = "Ext.")]
        public string SA_Extension1
        {
            get;
            set;
        }

        [DataType(DataType.PhoneNumber, ErrorMessage = "Invalid Phone Number")]
        [Display(Name = "Secondary Phone")]
        [RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage = "Invalid Phone Number")]
        public string SA_Phone2
        {
            get;
            set;
        }

        [Display(Name = "Ext.")]
        public string SA_Extension2
        {
            get;
            set;
        }

        [Display(Name = "Fax")]
        public string SA_Fax
        {
            get;
            set;
        }


        public int UserType
        {
            get
            {
                return 2;
            }
            //set
            //{
            //    UserType = value;
            //}
        }

        public CampRegisterModel()
        {
        }
    }
}

//  dbo.tblCamp
//  [ID] [int] IDENTITY(1,1) NOT NULL,
//  [AppID] [int] NOT NULL,
//  [createdOn] [datetime] NULL,
//	[createdBy] [xml] NULL,
//	[modifiedOn] [datetime] NULL,
//	[modifiedBy] [xml] NULL,
//	[readOnly] [bit] NULL,
//	[syncOperation] [smallint] NULL,
//	[syncStateIsSynced] [bit] NULL,
//	[recState] [smallint] NULL,
//	[camp_state] [smallint] NULL,
//	[name] [nvarchar] (100) NULL,
//	[line1] [nvarchar] (100) NULL,
//	[line2] [nvarchar] (100) NULL,
//	[city] [nvarchar] (50) NULL,
//	[state] [nvarchar] (50) NULL,
//	[zip] [nvarchar] (15) NULL,
//	[phone] [xml] NULL,
//	[fax] [xml] NULL,
//	[emailAddress] [xml] NULL,
//	[website] [xml] NULL,
//	[isActive] [bit] NULL,
//	[vendorID] [nvarchar] (15) NULL,
//	[notes] [xml] NULL,