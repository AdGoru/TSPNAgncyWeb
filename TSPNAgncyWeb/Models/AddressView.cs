using com.rti.appcommon;
using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace com.rti.tailspinnew.web.Models
{
	public class AddressView
	{
		public Address objaddress
		{
			get;
			set;
		}

		public List<Telephone> tele
		{
			get;
			set;
		}

		public AddressView()
		{
		}
	}
}