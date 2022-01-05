using System;
using System.ComponentModel.DataAnnotations;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class Address
	{
		public string line1 = "";

		public string line2 = "";

		[Required]
		public string city = "";

		[Required]
		public string state = "";

		[Required]
		public string country = "";

		[Required]
		public string zip = "";

		public Address()
		{
		}

		public Address(string Line1, string Line2, string City, string State, string Zip)
		{
			this.line1 = Line1;
			this.line2 = Line2;
			this.city = City;
			this.state = State;
			this.zip = Zip;
		}

		public override bool Equals(object obj)
		{
			if (obj == null || this.GetType() != obj.GetType())
			{
				return false;
			}
			Address address = (Address)obj;
			if (!(this.line1 == address.line1) || !(this.line1 == address.line1) || !(this.city == address.city) || !(this.state == address.state))
			{
				return false;
			}
			return this.zip == address.zip;
		}

		public string getAddress()
		{
			string[] strArrays = new string[] { (this.line1.Length == 0 ? "" : string.Concat(this.line1, ", ")), (this.line2.Length == 0 ? "" : string.Concat(this.line2, ", ")), (this.city.Length == 0 ? "" : string.Concat(this.city, ", ")), (this.state.Length == 0 ? "" : string.Concat(this.state, " - ")), (this.zip.Length == 0 ? "" : this.zip) };
			return string.Concat(strArrays);
		}

		public override int GetHashCode()
		{
			return this.city.GetHashCode();
		}
	}
}