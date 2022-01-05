using System;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class RTIDateTime
	{
		protected bool valid;

		private DateTime dt;

		private DateTime DT
		{
			get
			{
				return this.dt;
			}
			set
			{
				if (!this.validateDT(value))
				{
					this.valid = false;
					return;
				}
				this.dt = value;
				this.valid = true;
			}
		}

		public RTIDateTime()
		{
		}

		public bool getDT(out DateTime dt)
		{
			dt = this.DT;
			return this.valid;
		}

		public bool setDT(DateTime dt)
		{
			this.DT = dt;
			return this.valid;
		}

		public virtual bool validateDT(DateTime dt)
		{
			return true;
		}
	}
}