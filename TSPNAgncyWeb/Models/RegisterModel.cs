using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;
using System.Web.Mvc;
using CompareAttribute = System.Web.Mvc.CompareAttribute; 

namespace com.rti.tailspinnew.web.Models
{
	public class RegisterModel
	{
		[Display(Name="Address")]
		[Required(ErrorMessage="Agency address is required.")]
		public string Address
		{
			get;
			set;
		}

		[Display(Name="Agency Dept/Unit")]
		public string AgencyDepartment
		{
			get;
			set;
		}

		[DataType(DataType.EmailAddress, ErrorMessage="Invalid e-mail address")]
		[Display(Name="Agency Email")]
		public string AgencyEmail
		{
			get;
			set;
		}

		[Display(Name="Agency Name")]
		[Required(ErrorMessage="Please enter the name of your agency.")]
		public string AgencyName
		{
			get;
			set;
		}

		[Display(Name="CBH Provider ID")]
		//[Required(ErrorMessage="Please enter the Provider ID for your agency.")] JHF
		public string AgencyProviderID
		{
			get;
			set;
		}

		[Display(Name="City")]
		[Required(ErrorMessage="City is required.")]
		[StringLength(100, ErrorMessage="The {0} must be at least {2} characters long.", MinimumLength=2)]
		public string City
		{
			get;
			set;
		}

		[Compare("Password", ErrorMessage="The password and confirmation password do not match.")]
		[DataType(DataType.Password)]
		[Display(Name="Confirm password")]
		public string ConfirmPassword
		{
			get;
			set;
		}

		[DataType(DataType.EmailAddress, ErrorMessage="Invalid Email Address")]
		[Display(Name="Email (Login Id)", Description="Primary agency contact's email address which will be used as login id. Personal emails like hotmail, yahoo, comcast, gmail etc are not allowed.")]
		[Key]
		[Required(ErrorMessage="Email is required.")]
		public string Email
		{
			get;
			set;
		}

		[Display(Name="Extension")]
		public string Extension
		{
			get;
			set;
		}

		[Display(Name="Fax")]
		public string Fax
		{
			get;
			set;
		}

		[Display(Name="First name", Description="Primary agency contact's first name.")]
		[Required(ErrorMessage="First name is required.")]
		public string FirstName
		{
			get;
			set;
		}

		[Display(Name="Last name", Description="Primary agency contact's last name.")]
		[Required(ErrorMessage="Last name is required.")]
		public string LastName
		{
			get;
			set;
		}

		[DataType(DataType.PhoneNumber, ErrorMessage="Invalid fax number")]
		[Display(Name="Main Fax")]
		[RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage="Invalid Fax Number")]
		[Required(ErrorMessage="Main Fax is required.")]
		public string MainFax
		{
			get;
			set;
		}

		[DataType(DataType.PhoneNumber, ErrorMessage="Invalid phone number")]
		[Display(Name="Main Phone")]
		[RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage="Invalid Phone Number")]
		[Required(ErrorMessage="Main Phone is required.")]
		public string MainPhone
		{
			get;
			set;
		}

		[Display(Name="Middle Initial", Description="Primary agency contact's middle inital.")]
		public string MiddleInitial
		{
			get;
			set;
		}

		[DataType(DataType.Password)]
		[Display(Name="Password", Description="At least 6 characters that is hard to guess and easy to remember.")]
		[Required(ErrorMessage="Password is required.")]
		[StringLength(100, ErrorMessage="The {0} must be at least {2} characters long.", MinimumLength=6)]
		public string Password
		{
			get;
			set;
		}

		[DataType(DataType.PhoneNumber, ErrorMessage="Invalid Phone Number")]
		[Display(Name="Phone")]
		[RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage="Invalid Phone Number")]
		[Required(ErrorMessage="Agency contact's phone is required.")]
		public string Phone
		{
			get;
			set;
		}

		[Display(Name="State")]
		[Required(ErrorMessage="State is required.")]
		[StringLength(100, ErrorMessage="The {0} must be at least {2} characters long.", MinimumLength=2)]
		public string State
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

		[DataType(DataType.Url, ErrorMessage="Invalid website address")]
		[Display(Name="Website")]
		public string Website
		{
			get;
			set;
		}

		[Display(Name="Zip")]
		[Required(ErrorMessage=" Zip is required.")]
		public string Zip
		{
			get;
			set;
		}

		public RegisterModel()
		{
		}
	}
}