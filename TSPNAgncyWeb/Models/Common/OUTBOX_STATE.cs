using System;

namespace com.rti.tailspinnew.web.Models.Common
{
	public enum OUTBOX_STATE
	{
		NA = 0,
		QUEUED = 10,
		QUE2FAX = 20,
		QUE2EMAIL = 25,
		RESEND = 30,
		SENT = 40,
		ERROR = 99,
		CANCELLED = 100
	}
}