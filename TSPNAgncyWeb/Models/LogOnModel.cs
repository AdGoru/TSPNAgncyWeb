using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;

namespace com.rti.tailspinnew.web.Models
{
	public class LogOnModel
	{
		[DataType(DataType.Password)]
		[Display(Name="Password")]
		[Required]
		public string Password
		{
			get;
			set;
		}

		[Display(Name="Remember me")]
		public bool RememberMe
		{
			get;
			set;
		}

		[Display(Name="User name")]
		[Required]
		[StringLength(50, ErrorMessage="String must be less than 50 characters")]
		public string UserName
		{
			get;
			set;
		}

		public LogOnModel()
		{
		}
	}
}