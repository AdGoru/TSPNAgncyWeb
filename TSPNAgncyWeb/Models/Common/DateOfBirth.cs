using System;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class DateOfBirth : RTIDateTime
	{
		public DateOfBirth()
		{
		}

		public override bool validateDT(DateTime value)
		{
			return true;
		}
	}
}