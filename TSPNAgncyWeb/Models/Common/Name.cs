using System;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class Name
	{
		private string first;

		private string middle;

		private string last;

		private string title;

		private string longName;

		public string First
		{
			get
			{
				return this.first;
			}
			set
			{
				this.first = value;
			}
		}

		public string Last
		{
			get
			{
				return this.last;
			}
			set
			{
				this.last = value;
			}
		}

		public string Middle
		{
			get
			{
				return this.middle;
			}
			set
			{
				this.middle = value;
			}
		}

		public string Title
		{
			get
			{
				return this.title;
			}
			set
			{
				this.title = value;
			}
		}

		public Name()
		{
		}

		public override string ToString()
		{
			return string.Concat(string.Concat(string.Concat("", (this.first.Length == 0 ? "" : string.Concat(this.first, " "))), (this.middle.Length == 0 ? "" : string.Concat(this.middle, " "))), (this.last.Length == 0 ? "" : this.last));
		}
	}
}