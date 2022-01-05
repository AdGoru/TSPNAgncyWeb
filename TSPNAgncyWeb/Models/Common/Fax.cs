using System;
using System.Collections.Generic;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class Fax : IEquatable<Fax>
	{
		public string desc;

		public string number;

		public Fax(string Desc, string Number)
		{
			this.desc = Desc;
			this.number = Number;
		}

		public static bool Compare(List<Fax> LFax1, List<Fax> LFax2)
		{
			bool flag;
			if (LFax1 == null || LFax2 == null)
			{
				return false;
			}
			if (LFax1.Count != LFax2.Count)
			{
				return false;
			}
			List<Fax>.Enumerator enumerator = LFax2.GetEnumerator();
			try
			{
				while (enumerator.MoveNext())
				{
					if (LFax1.Contains(enumerator.Current))
					{
						continue;
					}
					flag = false;
					return flag;
				}
				return true;
			}
			finally
			{
				((IDisposable)enumerator).Dispose();
			}
			return flag;
		}

		public bool Equals(Fax other)
		{
			if (other == null)
			{
				return false;
			}
			if (!this.desc.Equals(other.desc))
			{
				return false;
			}
			if (!this.number.Equals(other.number))
			{
				return false;
			}
			return true;
		}

		public override bool Equals(object obj)
		{
			if (obj == null)
			{
				return this.Equals(obj);
			}
			Fax fax = obj as Fax;
			if (fax == null)
			{
				return false;
			}
			return this.Equals(fax);
		}

		public override int GetHashCode()
		{
			return this.desc.GetHashCode();
		}
	}
}