using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Xml.Linq;
using System.Linq;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class XElement2List
	{
		public XElement2List()
		{
		}

		public List<Email> createEmailListFromXML(XElement xml)
		{
			List<Email> emails = new List<Email>();
			if (xml != null)
			{
				IEnumerable<XElement> xElements = 
					from p in xml.Descendants()
					select p;
				foreach (XElement xElement in xElements)
				{
					emails.Add(new Email(xElement.Name.ToString(), xElement.Value));
				}
			}
			return emails;
		}

		public List<Fax> createFaxListFromXML(XElement xml)
		{
			List<Fax> faxes = new List<Fax>();
			if (xml != null)
			{
				IEnumerable<XElement> xElements = 
					from p in xml.Descendants()
					select p;
				foreach (XElement xElement in xElements)
				{
					faxes.Add(new Fax(xElement.Name.ToString(), xElement.Value));
				}
			}
			return faxes;
		}

		public List<Telephone> createTelephoneListFromXML(XElement xml)
		{
			List<Telephone> telephones = new List<Telephone>();
			if (xml != null)
			{
				IEnumerable<XElement> xElements = 
					from p in xml.Descendants()
					select p;
				foreach (XElement xElement in xElements)
				{
					telephones.Add(new Telephone(xElement.FirstAttribute.Value, xElement.LastAttribute.Value, xElement.Name.ToString()));
				}
			}
			return telephones;
		}

		public List<Email> createTestEmailList()
		{
			List<Email> emails = new List<Email>()
			{
				new Email("eml1", "a@gmail.com"),
				new Email("eml2", "b@yahoo.com"),
				new Email("eml3", "c@hotmail.com")
			};
			return emails;
		}

		public List<Fax> createTestFaxList()
		{
			List<Fax> faxes = new List<Fax>()
			{
				new Fax("Fax1", "8523697418"),
				new Fax("Fax2", "9123654785"),
				new Fax("Fax3", "9852147632")
			};
			return faxes;
		}

		public List<Telephone> createTestTelephonesList()
		{
			List<Telephone> telephones = new List<Telephone>()
			{
				new Telephone("8523697418", "USA", "Home1"),
				new Telephone("9632147852", "USA", "Home2"),
				new Telephone("9512347852", "USA", "Cell")
			};
			return telephones;
		}

		public List<URIweb> createTestWebsiteList()
		{
			List<URIweb> uRIwebs = new List<URIweb>()
			{
				new URIweb("website", "www.abc.com"),
				new URIweb("website", "www.xyz.com")
			};
			return uRIwebs;
		}

		public List<URIweb> createWebListFromXML(XElement xml)
		{
			List<URIweb> uRIwebs = new List<URIweb>();
			if (xml != null)
			{
				IEnumerable<XElement> xElements = 
					from p in xml.Descendants()
					select p;
				foreach (XElement xElement in xElements)
				{
					uRIwebs.Add(new URIweb(xElement.Name.ToString(), xElement.Value));
				}
			}
			return uRIwebs;
		}

		public XElement createXMLFromEmailList(List<Email> elist)
		{
			XElement xElement = null;
			if (elist == null)
			{
				return xElement;
			}
			if (elist.Count > 0)
			{
				xElement = new XElement("Emails", 
					from p in elist
					select new XElement(p.desc.ToString(), p.emailAddress));
			}
			return xElement;
		}

		public XElement createXMLFromFaxList(List<Fax> flist)
		{
			XElement xElement = null;
			if (flist == null)
			{
				return xElement;
			}
			if (flist.Count > 0)
			{
				xElement = new XElement("Faxes", 
					from p in flist
					select new XElement(p.desc, p.number));
			}
			return xElement;
		}

		public XElement createXMLFromTelephoneList(List<Telephone> telephones)
		{
			XElement xElement = null;
			if (telephones == null)
			{
				return xElement;
			}
			if (telephones.Count > 0)
			{
				xElement = new XElement("Telephones", 
					from p in telephones
					select new XElement(p.telephoneType, new object[] { new XAttribute("Number", p.number), new XAttribute("Locale", p.locale) }));
			}
			return xElement;
		}

		public XElement createXMLFromWebList(List<URIweb> wlist)
		{
			XElement xElement = null;
			if (wlist == null)
			{
				return xElement;
			}
			if (wlist.Count > 0)
			{
				xElement = new XElement("Websites", 
					from p in wlist
					select new XElement(p.desc, p.www));
			}
			return xElement;
		}

		private static void Main()
		{
			XElement2List.testTelephone();
			XElement2List.testFax();
			XElement2List.testEmailAddress();
			XElement2List.testWebsiteURL();
			List<Telephone> telephones = new List<Telephone>()
			{
				new Telephone("8523697418", "USA", "Home1"),
				new Telephone("9632147852", "USA", "Home2"),
				new Telephone("9512347852", "USA", "Cell")
			};
			Telephone telephone = new Telephone("8523697418", "USA", "Home1");
			Telephone telephone1 = new Telephone("1234567898", "USA", "Home1");
			Console.WriteLine("telephones Contains : {0}", telephones.Contains(telephone));
			Console.WriteLine("telephones Contains : {0}", telephones.Contains(telephone1));
			Console.WriteLine();
			List<Telephone> telephones1 = new List<Telephone>()
			{
				new Telephone("8523697418", "USA", "Home1"),
				new Telephone("9632147852", "USA", "Home2"),
				new Telephone("9512347852", "USA", "Cell")
			};
			List<Telephone> telephones2 = new List<Telephone>()
			{
				new Telephone("1232456789", "USA", "Home1"),
				new Telephone("9632147852", "USA", "Home2"),
				new Telephone(null, "USA", "Cell")
			};
			List<Telephone> telephones3 = new List<Telephone>();
			Console.WriteLine("Is telephones and telephones1 are equal: {0}", Telephone.Compare(telephones, telephones1));
			Console.WriteLine("Is telephones and telephones2 are equal: {0}", Telephone.Compare(telephones, telephones2));
			Console.WriteLine("Is telephones and telephones3 are equal: {0}", Telephone.Compare(telephones, telephones3));
			Console.WriteLine();
			Address address = new Address("Road 1", "HyderNagar", "Hyderabad", "AP", "500020");
			Address address1 = new Address("Road 1", "HyderNagar", "Hyderabad", "AP", "500020");
			Address address2 = new Address("Road 2", "HyderNagar", "Secunderabad", "AP", "500020");
			Address address3 = null;
			Console.WriteLine("Is addr1 and addr2 are equal: {0}", address.Equals(address1));
			Console.WriteLine("Is addr1 and addr3 are equal: {0}", address.Equals(address2));
			Console.WriteLine("Is addr1 and addr4 are equal: {0}", address.Equals(address3));
			Console.Read();
		}

		public static void testEmailAddress()
		{
			XElement2List xElement2List = new XElement2List();
			XElement xElement = null;
			List<Email> emails = xElement2List.createTestEmailList();
			Console.WriteLine("Sample Email list:");
			xElement2List.testPrintEmailList(emails);
			Console.WriteLine();
			xElement = xElement2List.createXMLFromEmailList(emails);
			Console.WriteLine("XML created with sample Email list:");
			Console.WriteLine(xElement);
			List<Email> emails1 = xElement2List.createEmailListFromXML(xElement);
			Console.WriteLine();
			Console.WriteLine("Email list created from xml:");
			xElement2List.testPrintEmailList(emails1);
			Console.WriteLine();
			Console.WriteLine("Expected Email List and Actual Email List are equal: {0}", Email.Compare(emails, emails1));
			Console.WriteLine();
			Console.WriteLine();
		}

		public static void testFax()
		{
			XElement2List xElement2List = new XElement2List();
			XElement xElement = null;
			List<Fax> faxes = xElement2List.createTestFaxList();
			Console.WriteLine("Sample Fax list:");
			xElement2List.testPrintFaxList(faxes);
			Console.WriteLine();
			xElement = xElement2List.createXMLFromFaxList(faxes);
			Console.WriteLine("XML created with sample Fax list:");
			Console.WriteLine(xElement);
			List<Fax> faxes1 = xElement2List.createFaxListFromXML(xElement);
			Console.WriteLine();
			Console.WriteLine("Fax list created from xml:");
			xElement2List.testPrintFaxList(faxes1);
			Console.WriteLine();
			Console.WriteLine("Expected Fax List and Actual Fax List are equal: {0}", Fax.Compare(faxes, faxes1));
			Console.WriteLine();
			Console.WriteLine();
		}

		public void testPrintEmailList(List<Email> emails)
		{
			foreach (Email email in emails)
			{
				Console.WriteLine(string.Concat(email.desc, " ", email.emailAddress));
			}
		}

		public void testPrintFaxList(List<Fax> faxes)
		{
			foreach (Fax faxis in faxes)
			{
				Console.WriteLine(string.Concat(faxis.desc, " ", faxis.number));
			}
		}

		public void testPrintTelephoneList(List<Telephone> telephones)
		{
			foreach (Telephone telephone in telephones)
			{
				string[] strArrays = new string[] { telephone.telephoneType, " ", telephone.number, " ", telephone.locale };
				Console.WriteLine(string.Concat(strArrays));
			}
		}

		public void testPrintWebsiteList(List<URIweb> websites)
		{
			foreach (URIweb website in websites)
			{
				Console.WriteLine(string.Concat(website.desc, " ", website.www));
			}
		}

		public static void testTelephone()
		{
			XElement2List xElement2List = new XElement2List();
			XElement xElement = null;
			List<Telephone> telephones = xElement2List.createTestTelephonesList();
			Console.WriteLine("Sample Telephone list:");
			xElement2List.testPrintTelephoneList(telephones);
			Console.WriteLine();
			xElement = xElement2List.createXMLFromTelephoneList(telephones);
			Console.WriteLine("XML created with sample Telephone list:");
			Console.WriteLine(xElement);
			List<Telephone> telephones1 = xElement2List.createTelephoneListFromXML(xElement);
			Console.WriteLine();
			Console.WriteLine("Telephone list created from xml:");
			xElement2List.testPrintTelephoneList(telephones1);
			Console.WriteLine();
			Console.WriteLine("Expected Telephone List and Actual Telephone List are equal: {0}", Telephone.Compare(telephones, telephones1));
			Console.WriteLine();
			Console.WriteLine();
		}

		public static void testWebsiteURL()
		{
			XElement2List xElement2List = new XElement2List();
			XElement xElement = null;
			List<URIweb> uRIwebs = xElement2List.createTestWebsiteList();
			Console.WriteLine("Sample Website list:");
			xElement2List.testPrintWebsiteList(uRIwebs);
			Console.WriteLine();
			xElement = xElement2List.createXMLFromWebList(uRIwebs);
			Console.WriteLine("XML created with sample Website list:");
			Console.WriteLine(xElement);
			List<URIweb> uRIwebs1 = xElement2List.createWebListFromXML(xElement);
			Console.WriteLine();
			Console.WriteLine("Website list created from xml:");
			xElement2List.testPrintWebsiteList(uRIwebs1);
			Console.WriteLine();
			Console.WriteLine("Expected Website List and Actual Website List are equal: {0}", URIweb.Compare(uRIwebs, uRIwebs1));
			Console.WriteLine();
			Console.WriteLine();
		}
	}
}