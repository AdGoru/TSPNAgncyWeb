using System;
using System.ComponentModel;

namespace com.rti.tailspinnew.web.Models.Common
{
	public interface IUIelementRB_CB
	{
		void Add(string groupname, string facetext, bool initialstate, int enumValue, string tooltip);

		void Add2PropertyChangedEventHandler(PropertyChangedEventHandler target);

		void clearFlag();

		int getEnumValue();

		void setFlag();
	}
}