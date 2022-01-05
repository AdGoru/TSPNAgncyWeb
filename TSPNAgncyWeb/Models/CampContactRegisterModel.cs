using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;
using System.Web.Mvc;
using CompareAttribute = System.Web.Mvc.CompareAttribute; 

namespace com.rti.tailspinnew.web.Models
{
	public class CampContactRegisterModel
	{
		public com.rti.tailspinnew.web.Models.Address1 objAddress = new com.rti.tailspinnew.web.Models.Address1();

		public Name1 objName = new Name1();

		public IEnumerable<com.rti.tailspinnew.web.Models.Address1> Address1
		{
			get;
			set;
		}

		public Name1 CampContactName
		{
			get;
			set;
		}

		[Compare("Password", ErrorMessage="The password and confirmation password do not match.")]
		[DataType(DataType.Password)]
		[Display(Name="Confirm password")]
		[StringLength(100, ErrorMessage="The {0} must be at least {2} characters long.", MinimumLength=6)]
		public string ConfirmPassword
		{
			get;
			set;
		}

		[DataType(DataType.Password)]
		[Display(Name="Password")]
		[Required]
		[StringLength(100, ErrorMessage="The {0} must be at least {2} characters long.", MinimumLength=6)]
		public string Password
		{
			get;
			set;
		}

		[Display(Name="User ID")]
		[Required]
		[StringLength(50, ErrorMessage="String must be less than 50 characters")]
		public string UserID
		{
			get;
			set;
		}

		[DataType(DataType.Text)]
		[Display(Name="User Role")]
		[Required]
		[StringLength(100, ErrorMessage="The {0} must be at below {1} characters long.")]
		public string UserRole
		{
			get;
			set;
		}

		public CampContactRegisterModel()
		{
		}
	}
}