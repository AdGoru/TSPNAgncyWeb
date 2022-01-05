using System;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class SessionType
	{
		public int _sessionTypeId;

		public string _sessionTypeName;

		public SessionType(int sessionTypeId, string sessionTypeName)
		{
			this._sessionTypeId = sessionTypeId;
			this._sessionTypeName = sessionTypeName;
		}
	}
}