using System;
using System.Collections.Generic;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class URIweb : IEquatable<URIweb>
	{
		public string desc;

		public string www;

		public URIweb(string Desc, string WWW)
		{
			this.desc = Desc;
			this.www = WWW;
		}

		public static bool Compare(List<URIweb> LUrls1, List<URIweb> LUrls2)
		{
			bool flag;
			if (LUrls1 == null || LUrls2 == null)
			{
				return false;
			}
			if (LUrls1.Count != LUrls2.Count)
			{
				return false;
			}
			List<URIweb>.Enumerator enumerator = LUrls2.GetEnumerator();
			try
			{
				while (enumerator.MoveNext())
				{
					if (LUrls1.Contains(enumerator.Current))
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

		public bool Equals(URIweb other)
		{
			if (other == null)
			{
				return false;
			}
			if (!this.desc.Equals(other.desc))
			{
				return false;
			}
			if (!this.www.Equals(other.www))
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
			URIweb uRIweb = obj as URIweb;
			if (uRIweb == null)
			{
				return false;
			}
			return this.Equals(uRIweb);
		}

		public override int GetHashCode()
		{
			return this.desc.GetHashCode();
		}
	}
}