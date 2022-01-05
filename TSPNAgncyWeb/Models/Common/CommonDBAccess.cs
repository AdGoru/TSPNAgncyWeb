using System;
using System.Collections.Generic;
using System.Data;
using System.Xml.Linq;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class CommonDBAccess
	{
		private static int version;

		public static int Version
		{
			get
			{
				return CommonDBAccess.version;
			}
			private set
			{
			}
		}

		static CommonDBAccess()
		{
			CommonDBAccess.version = 1;
		}

		public CommonDBAccess()
		{
		}

		public Address CreateAddress(IDataRecord Record)
		{
			Address address = new Address();
			if (Record["line1"] != DBNull.Value)
			{
				address.line1 = (string)Record["line1"];
			}
			if (Record["line2"] != DBNull.Value)
			{
				address.line2 = (string)Record["line2"];
			}
			if (Record["city"] != DBNull.Value)
			{
				address.city = (string)Record["city"];
			}
			if (Record["state"] != DBNull.Value)
			{
				address.state = (string)Record["state"];
			}
			if (Record["zip"] != DBNull.Value)
			{
				address.zip = (string)Record["zip"];
			}
			return address;
		}

		public List<Email> CreateEmail(IDataRecord record)
		{
			XElement2List xElement2List = new XElement2List();
			List<Email> emails = new List<Email>();
			if (record["email"] != DBNull.Value)
			{
				emails = xElement2List.createEmailListFromXML(XElement.Parse(record["email"].ToString()));
			}
			return emails;
		}

		public List<Fax> CreateFax(IDataRecord record)
		{
			XElement2List xElement2List = new XElement2List();
			List<Fax> faxes = new List<Fax>();
			if (record["fax"] != DBNull.Value)
			{
				faxes = xElement2List.createFaxListFromXML(XElement.Parse(record["fax"].ToString()));
			}
			return faxes;
		}

		public Name CreateName(IDataRecord Record)
		{
			Name name = new Name();
			if (Record["firstName"] != DBNull.Value)
			{
				name.First = (string)Record["firstName"];
			}
			if (Record["middleInitial"] != DBNull.Value)
			{
				name.Middle = (string)Record["middleInitial"];
			}
			if (Record["lastName"] != DBNull.Value)
			{
				name.Last = (string)Record["lastName"];
			}
			return name;
		}

		public List<Telephone> CreatePhone(IDataRecord record)
		{
			XElement2List xElement2List = new XElement2List();
			List<Telephone> telephones = new List<Telephone>();
			if (record["phone"] != DBNull.Value)
			{
				telephones = xElement2List.createTelephoneListFromXML(XElement.Parse(record["phone"].ToString()));
			}
			return telephones;
		}

		public List<URIweb> CreateWebsite(IDataRecord record)
		{
			XElement2List xElement2List = new XElement2List();
			List<URIweb> uRIwebs = new List<URIweb>();
			if (record["website"] != DBNull.Value)
			{
				uRIwebs = xElement2List.createWebListFromXML(XElement.Parse(record["website"].ToString()));
			}
			return uRIwebs;
		}
	}
}