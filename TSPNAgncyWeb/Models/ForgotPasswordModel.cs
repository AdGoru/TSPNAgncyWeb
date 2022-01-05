using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;

namespace com.rti.tailspinnew.web.Models
{
	public class ForgotPasswordModel
	{
		[DataType(DataType.EmailAddress)]
		[Display(Name="Email id specified at registration time")]
		[Required]
		[StringLength(100, ErrorMessage="String must be less than 100 characters")]
		public string Email
		{
			get;
			set;
		}

		[Display(Name="Email Id")]
		[StringLength(50, ErrorMessage="String must be less than 50 characters")]
		public string UserID
		{
			get;
			set;
		}

		public ForgotPasswordModel()
		{
		}
	}
}