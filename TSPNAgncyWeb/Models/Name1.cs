using System;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;

namespace com.rti.tailspinnew.web.Models
{
	public class Name1
	{
		[DataType(DataType.Text)]
		[Display(Name="First Name")]
		[RegularExpression("^[a-zA-Z' ]+$", ErrorMessage="Only alphabets and quote(') are allowed.")]
		[Required]
		[StringLength(50, ErrorMessage="String must be less than 50 characters")]
		public string FirstName
		{
			get;
			set;
		}

		[DataType(DataType.Text)]
		[Display(Name="Last Name")]
		[RegularExpression("^[a-zA-Z' ]+$", ErrorMessage="Only alphabets and quote(') are allowed.")]
		[Required]
		[StringLength(50, ErrorMessage="String must be less than 50 characters")]
		public string LastName
		{
			get;
			set;
		}

		[DataType(DataType.Text)]
		[Display(Name="Middle Name")]
		[RegularExpression("^[a-zA-Z' ]+$", ErrorMessage="Only alphabets and quote(') are allowed.")]
		[StringLength(50, ErrorMessage="String must be less than 50 characters")]
		public string MiddleName
		{
			get;
			set;
		}

		public Name1()
		{
		}

		public Name1(string strFirst, string strMiddle, string strLast)
		{
			this.FirstName = strFirst;
			this.MiddleName = strMiddle;
			this.LastName = strLast;
		}
	}
}