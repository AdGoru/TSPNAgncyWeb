using System;
using System.Collections.Generic;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class Organization
	{
		private string title;

		private com.rti.tailspinnew.web.Models.Common.Address address;

		private List<URIweb> website = new List<URIweb>();

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

		public string Title
		{
			get
			{
				return this.title;
			}
			set
			{
				this.title = value;
			}
		}

		public List<URIweb> Website
		{
			get
			{
				return this.website;
			}
			set
			{
				this.website = value;
			}
		}

		public Organization()
		{
		}
	}
}