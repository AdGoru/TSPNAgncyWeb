using System;
using System.Collections.Generic;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class Telephone : IEquatable<Telephone>
	{
		public string telephoneType;

		public string number;

		public string locale;

		public Telephone()
		{
		}

		public Telephone(string Number, string Locale, string TelephoneType)
		{
			this.number = Number;
			this.locale = Locale;
			this.telephoneType = TelephoneType;
		}

		public static bool Compare(List<Telephone> LTel1, List<Telephone> LTel2)
		{
			bool flag;
			if (LTel1 == null || LTel2 == null)
			{
				return false;
			}
			if (LTel1.Count != LTel2.Count)
			{
				return false;
			}
			List<Telephone>.Enumerator enumerator = LTel2.GetEnumerator();
			try
			{
				while (enumerator.MoveNext())
				{
					if (LTel1.Contains(enumerator.Current))
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

		public bool Equals(Telephone other)
		{
			if (other == null)
			{
				return false;
			}
			if (!this.telephoneType.Equals(other.telephoneType))
			{
				return false;
			}
			if (!this.number.Equals(other.number))
			{
				return false;
			}
			if (!this.locale.Equals(other.locale))
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
			Telephone telephone = obj as Telephone;
			if (telephone == null)
			{
				return false;
			}
			return this.Equals(telephone);
		}

		public override int GetHashCode()
		{
			return this.telephoneType.GetHashCode();
		}
	}
}