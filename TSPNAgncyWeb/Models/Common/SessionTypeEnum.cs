using System;
using System.Collections;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class SessionTypeEnum : IEnumerator
	{
		public SessionType[] _sessionType;

		private int position = -1;

		public SessionType Current
		{
			get
			{
				SessionType sessionType;
				try
				{
					sessionType = this._sessionType[this.position];
				}
				catch (IndexOutOfRangeException indexOutOfRangeException)
				{
					throw new InvalidOperationException();
				}
				return sessionType;
			}
		}

		object System.Collections.IEnumerator.Current
		{
			get
			{
				return this.Current;
			}
		}

		public SessionTypeEnum(SessionType[] list)
		{
			this._sessionType = list;
		}

		public bool MoveNext()
		{
			SessionTypeEnum sessionTypeEnum = this;
			sessionTypeEnum.position = sessionTypeEnum.position + 1;
			return this.position < (int)this._sessionType.Length;
		}

		public void Reset()
		{
			this.position = -1;
		}
	}
}