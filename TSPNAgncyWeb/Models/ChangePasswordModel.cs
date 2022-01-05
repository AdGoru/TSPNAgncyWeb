using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;
using System.Web.Mvc;
using CompareAttribute = System.Web.Mvc.CompareAttribute; 


namespace com.rti.tailspinnew.web.Models
{
	public class ChangePasswordModel
	{
		[Compare("NewPassword", ErrorMessage="The new password and confirmation password do not match.")]
		[DataType(DataType.Password)]
		[Display(Name="Confirm New Password")]
		public string ConfirmNewPassword
		{
			get;
			set;
		}

		[DataType(DataType.Password)]
		[Display(Name="New Password")]
		[Required]
		[StringLength(100, ErrorMessage="The {0} must be at least {2} characters long.", MinimumLength=6)]
		public string NewPassword
		{
			get;
			set;
		}

		[DataType(DataType.Password)]
		[Display(Name="Old password")]
		[Required]
		[StringLength(100, ErrorMessage="The {0} must be at least {2} characters long.", MinimumLength=6)]
		public string OldPassword
		{
			get;
			set;
		}

		public ChangePasswordModel()
		{
		}
	}
}