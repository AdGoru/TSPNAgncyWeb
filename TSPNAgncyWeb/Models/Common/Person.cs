using System;
using System.Collections.Generic;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class Person
	{
		private com.rti.tailspinnew.web.Models.Common.Name name = new com.rti.tailspinnew.web.Models.Common.Name();

		private com.rti.tailspinnew.web.Models.Common.Address address;

		private List<Telephone> phones = new List<Telephone>();

		private List<Fax> faxes = new List<Fax>();

		private List<Email> emails = new List<Email>();

		public com.rti.tailspinnew.web.Models.Common.Address Address
		{
			get
			{
				return this.address;
			}
			set
			{
				this.address = value;
			}
		}

		public List<Email> Emails
		{
			get
			{
				return this.emails;
			}
			set
			{
				this.emails = value;
			}
		}

		public List<Fax> Faxes
		{
			get
			{
				return this.faxes;
			}
			set
			{
				this.faxes = value;
			}
		}

		public com.rti.tailspinnew.web.Models.Common.Name Name
		{
			get
			{
				return this.name;
			}
			set
			{
				this.name = value;
			}
		}

		public List<Telephone> Phones
		{
			get
			{
				return this.phones;
			}
			set
			{
				this.phones = value;
			}
		}

		public Person()
		{
		}

		public override string ToString()
		{
			return this.name.ToString();
		}
	}
}