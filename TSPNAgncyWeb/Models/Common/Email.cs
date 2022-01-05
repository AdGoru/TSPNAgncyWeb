using System;
using System.Collections.Generic;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class Email : IEquatable<Email>
	{
		public string desc;

		public string emailAddress;

		public Email(string Desc, string EmailAddress)
		{
			this.desc = Desc;
			this.emailAddress = EmailAddress;
		}

		public static bool Compare(List<Email> LEml1, List<Email> LEml2)
		{
			bool flag;
			if (LEml1 == null || LEml2 == null)
			{
				return false;
			}
			if (LEml1.Count != LEml2.Count)
			{
				return false;
			}
			List<Email>.Enumerator enumerator = LEml2.GetEnumerator();
			try
			{
				while (enumerator.MoveNext())
				{
					if (LEml1.Contains(enumerator.Current))
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

		public bool Equals(Email other)
		{
			if (other == null)
			{
				return false;
			}
			if (!this.desc.Equals(other.desc))
			{
				return false;
			}
			if (!this.emailAddress.Equals(other.emailAddress))
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
			Email email = obj as Email;
			if (email == null)
			{
				return false;
			}
			return this.Equals(email);
		}

		public override int GetHashCode()
		{
			return this.desc.GetHashCode();
		}
	}
}