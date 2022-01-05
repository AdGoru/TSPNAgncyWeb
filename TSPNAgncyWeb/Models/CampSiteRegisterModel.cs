using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;
using System.Web.Mvc;
using CompareAttribute = System.Web.Mvc.CompareAttribute;

namespace com.rti.tailspinnew.web.Models // JHF
{
    public class CampSiteRegisterModel
    {
        [Display(Name = "Camp Site Address")]
        [Required(ErrorMessage = "Site address is required.")]
        public string Address
        {
            get;
            set;
        }

        [Display(Name = "Camp Business Name")]
        [Required(ErrorMessage = "Please enter the name of your camp.")]
        public string CampSiteName
        {
            get;
            set;
        }

        [Display(Name = "Address Line 1")]
        [Required(ErrorMessage = "Camp address is required.")]
        public string Line1
        {
            get;
            set;
        }

        [Display(Name = "Address Line 2")]
        [StringLength(100, ErrorMessage = "String must be less than 100 characters")]
        public string Line2
        {
            get;
            set;
        }

        [Display(Name = "City")]
        [Required(ErrorMessage = "City is required.")]
        [StringLength(50, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 2)]
        public string City
        {
            get;
            set;
        }

        [Display(Name = "State")]
        [Required(ErrorMessage = "State is required.")]
        [StringLength(2, ErrorMessage = "The {0} must be {2} characters long.", MinimumLength = 2)]
        public string State
        {
            get;
            set;
        }

        [Display(Name = "Zip")]
        [Required(ErrorMessage = " Zip is required.")]
        public string Zip
        {
            get;
            set;
        }

        [DataType(DataType.PhoneNumber, ErrorMessage = "Invalid phone number")]
        [Display(Name = "Camp Site Phone")]
        [RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage = "Invalid Phone Number")]
        [Required(ErrorMessage = "Main Phone is required.")]
        public string CampSitePhone
        {
            get;
            set;
        }

        [DataType(DataType.PhoneNumber, ErrorMessage = "Invalid fax number")]
        [Display(Name = "Camp Site Fax")]
        [RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage = "Invalid Fax Number")]
        [Required(ErrorMessage = "Main Fax is required.")]
        public string CampSiteFax
        {
            get;
            set;
        }

        [DataType(DataType.EmailAddress, ErrorMessage = "Invalid e-mail address")]
        [Display(Name = "Camp Site Email")]
        public string CampSiteEmail
        {
            get;
            set;
        }

        [DataType(DataType.Url, ErrorMessage = "Invalid website address")]
        [Display(Name = "Camp Site Website")]
        public string CampSiteWebsite
        {
            get;
            set;
        }

        [Display(Name = "Who signed agreement")]
        [StringLength(50, ErrorMessage = "Invalid signer name")]
        public string WhoSignedAgreement
        {
            get;
            set;
        }

        [Display(Name = "Title of Who signed agreement")]
        [StringLength(25, ErrorMessage = "Invalid title")]
        public string TitleOfWhoSignedAgreement
        {
            get;
            set;
        }

        public CampSiteRegisterModel()
        {
        }
    }
}

//  [dbo].[tblCampCorporate]
//
//  [ID] [int] IDENTITY(1,1) NOT NULL,
//  [AppID] [int] NOT NULL,
//  [createdOn] [datetime] NULL,
//	[createdBy] [xml] NULL,
//	[modifiedOn] [datetime] NULL,
//	[modifiedBy] [xml] NULL,
//	[corpname] [nvarchar] (100) NULL,
//	[addrline1] [nvarchar] (100) NULL,
//	[addrline2] [nvarchar] (50) NULL,
//	[city] [nvarchar] (50) NULL,
//	[state] [char] (2) NULL,
//	[zip] [nvarchar] (10) NULL,
//	[corpcontact] [nvarchar] (50) NULL,
//	[phone] [xml] NULL,
//	[fax] [xml] NULL,
//	[emailAddress] [xml] NULL,
//	[website] [xml] NULL


//  [dbo].[tblCampUser]
//
//  [CampSiteAppID] [int] NOT NULL,
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
//	[firstName] [nvarchar] (25) NULL,
//	[middleInitial] [nvarchar] (25) NULL,
//	[lastName] [nvarchar] (25) NULL,
//	[phone] [xml] NULL,
//	[fax] [xml] NULL,
//	[emailAddress] [xml] NULL,
//	[isActive] [bit] NULL,
//	[role] [smallint] NULL,
//	[hasWebAccess] [bit] NULL,
//	[resetPassword] [bit] NULL,
//	[Status] [smallint] NULL,


//  [dbo].[tblUserType]
//
//  [UserAppID] [int] NOT NULL,
//  [UserTypeID] [int] NOT NULL,