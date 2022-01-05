using System;

namespace com.rti.tailspinnew.web.Models.Common
{
	internal class CommonElements
	{
		private static int version;

		public static int Version
		{
			get
			{
				return CommonElements.version;
			}
			private set
			{
			}
		}

		static CommonElements()
		{
			CommonElements.version = 1;
		}

		public CommonElements()
		{
		}
	}
}