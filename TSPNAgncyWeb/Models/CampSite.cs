using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;
using System.Web.Mvc;

namespace com.rti.tailspinnew.web.Models
{
	public class CampSite
	{
		[HiddenInput]
		public int AppID
		{
			get;
			set;
		}

		[Display(Name="City")]
		[Required(ErrorMessage="* Required")]
		[StringLength(100, ErrorMessage="The {0} must be at least {2} characters long.", MinimumLength=2)]
		public string City
		{
			get;
			set;
		}

		[DataType(DataType.EmailAddress, ErrorMessage="Invalid e-mail address")]
		[Display(Name="Email")]
		public string Email
		{
			get;
			set;
		}

		[DataType(DataType.PhoneNumber, ErrorMessage="Invalid fax number")]
		[Display(Name="Fax")]
		[RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage="Invalid Fax Number")]
		[Required(ErrorMessage="* Required")]
		public string Fax
		{
			get;
			set;
		}

		public int Id
		{
			get;
			set;
		}

		[Display(Name="Address Line 1")]
		[Required(ErrorMessage="* Required")]
		public string Line1
		{
			get;
			set;
		}

		[Display(Name="Address Line 2")]
		public string Line2
		{
			get;
			set;
		}

		[DataType(DataType.PhoneNumber, ErrorMessage="Invalid phone number")]
		[Display(Name="Phone")]
		[RegularExpression("^(1?)(-| ?)(\\()?([0-9]{3})(\\)|-| |\\)-|\\) )?([0-9]{3})(-| )?([0-9]{4}|[0-9]{4})$", ErrorMessage="Invalid Phone Number")]
		[Required(ErrorMessage="* Required")]
		public string Phone
		{
			get;
			set;
		}

		[Display(Name="State")]
		[Required(ErrorMessage="* Required")]
		[StringLength(100, ErrorMessage="The {0} must be at least {2} characters long.", MinimumLength=2)]
		public string State
		{
			get;
			set;
		}

		[HiddenInput]
		public int Status
		{
			get;
			set;
		}

		[HiddenInput]
		public string StatusStr
		{
			get;
			set;
		}

		[Display(Name="Camp Name")]
		[Required(ErrorMessage="* Required")]
		[StringLength(50)]
		public string Title
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
		[Required(ErrorMessage="* Required")]
		public string Zip
		{
			get;
			set;
		}

		public CampSite()
		{
		}
	}
}