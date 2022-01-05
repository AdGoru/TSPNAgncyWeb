using System;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class SessionTypes
	{
		private static SessionType[] sessionTypeArray;

		static SessionTypes()
		{
			SessionType[] sessionType = new SessionType[] { new SessionType(1, "Smith"), new SessionType(2, "Johnson"), new SessionType(3, "Rabon") };
			SessionTypes.sessionTypeArray = sessionType;
		}

		public SessionTypes()
		{
		}

		public static SessionTypesList GetSessionTypes()
		{
			return new SessionTypesList(SessionTypes.sessionTypeArray);
		}
	}
}