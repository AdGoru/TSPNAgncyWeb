using System;
using System.Collections;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class SessionTypesList : IEnumerable
	{
		private SessionType[] _people;

		public SessionTypesList(SessionType[] pArray)
		{
			this._people = new SessionType[(int)pArray.Length];
			for (int i = 0; i < (int)pArray.Length; i++)
			{
				this._people[i] = pArray[i];
			}
		}

		public SessionTypeEnum GetEnumerator()
		{
			return new SessionTypeEnum(this._people);
		}

		IEnumerator System.Collections.IEnumerable.GetEnumerator()
		{
			return this.GetEnumerator();
		}
	}
}