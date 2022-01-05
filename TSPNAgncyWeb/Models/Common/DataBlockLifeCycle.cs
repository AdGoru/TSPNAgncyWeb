using System;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class DataBlockLifeCycle : RTIDateTime
	{
		private Person by;

		public Person By
		{
			get
			{
				return this.by;
			}
			set
			{
				this.by = value;
			}
		}

		public DataBlockLifeCycle()
		{
		}

		public override string ToString()
		{
			DateTime dateTime;
			if (!base.getDT(out dateTime))
			{
				return CommonAppConstants.NOTAVAILABLE;
			}
			return string.Concat(dateTime.ToShortDateString(), ": ", this.By.ToString());
		}
	}
}