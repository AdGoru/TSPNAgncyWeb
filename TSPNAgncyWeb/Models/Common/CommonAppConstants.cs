using System;

namespace com.rti.tailspinnew.web.Models.Common
{
	internal class CommonAppConstants
	{
		private static int version;

		public static string NOTAVAILABLE;

		public static int Version
		{
			get
			{
				return CommonAppConstants.version;
			}
			private set
			{
			}
		}

		static CommonAppConstants()
		{
			CommonAppConstants.version = 1;
			CommonAppConstants.NOTAVAILABLE = "-NA-";
		}

		public CommonAppConstants()
		{
		}
	}
}