using System;

namespace com.rti.tailspinnew.web.Models.Common
{
	public enum INBOX_STATE
	{
		NA = 0,
		NEW = 10,
		NOTASSOCIATED = 20,
		MULTICAF = 30,
		ASSOCIATED = 40,
		GARBAGE = 90,
		REJECT = 100
	}
}