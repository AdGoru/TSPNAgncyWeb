using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;

namespace com.rti.tailspinnew.web.Models
{
	public class Address1
	{
		[DataType(DataType.MultilineText)]
		[Display(Name="Address 2")]
		[StringLength(500, ErrorMessage="String must be less than 500 characters")]
		public string Address2
		{
			get;
			set;
		}

		[DataType(DataType.MultilineText)]
		[Display(Name="Address")]
		public string AddressLine1
		{
			get;
			set;
		}

		[DataType(DataType.Text)]
		[Display(Name="City")]
		[RegularExpression("^[a-zA-Z ]+$", ErrorMessage="Only alphabets are allowed.")]
		[Required]
		[StringLength(50, ErrorMessage="String must be less than 50 characters")]
		public string City
		{
			get;
			set;
		}

		[DataType(DataType.Text)]
		[Display(Name="Country")]
		[RegularExpression("^[a-zA-Z ]+$", ErrorMessage="Only alphabets are allowed.")]
		[Required]
		[StringLength(50, ErrorMessage="String must be less than 50 characters")]
		public string Country
		{
			get;
			set;
		}

		[DataType(DataType.EmailAddress)]
		[Display(Name="Email1")]
		[Required]
		[StringLength(500, ErrorMessage="String must be less than 500 characters")]
		public string Email1
		{
			get;
			set;
		}

		[DataType(DataType.EmailAddress)]
		[Display(Name="Email2")]
		[StringLength(500, ErrorMessage="String must be less than 500 characters")]
		public string Email2
		{
			get;
			set;
		}

		[DataType(DataType.PhoneNumber)]
		[Display(Name="Phone1")]
		[Required]
		[StringLength(15, ErrorMessage="String must be less than 15 characters")]
		public string Phone1
		{
			get;
			set;
		}

		[DataType(DataType.PhoneNumber)]
		[Display(Name="Phone2")]
		[StringLength(15, ErrorMessage="String must be less than 15 characters")]
		public string Phone2
		{
			get;
			set;
		}

		[DataType(DataType.Text)]
		[Display(Name="State")]
		[RegularExpression("^[a-zA-Z ]+$", ErrorMessage="Only alphabets are allowed.")]
		[Required]
		[StringLength(50, ErrorMessage="String must be less than 50 characters")]
		public string State
		{
			get;
			set;
		}

		[Display(Name="Zip/Postal Code")]
		[RegularExpression("^[0-9]+$", ErrorMessage="Only numbers are allowed.")]
		[StringLength(10, ErrorMessage="String must be less than 10 characters")]
		public int Zip
		{
			get;
			set;
		}

		public Address1()
		{
		}
	}
}