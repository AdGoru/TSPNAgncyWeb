using System;
using System.Globalization;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class EnumMatchToBooleanConverter
	{
		public EnumMatchToBooleanConverter()
		{
		}

		public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null || parameter == null)
			{
				return false;
			}
			string str = value.ToString();
			return str.Equals(parameter.ToString(), StringComparison.InvariantCultureIgnoreCase);
		}

		public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
		{
			if (value == null || parameter == null)
			{
				return null;
			}
			bool flag = (bool)value;
			string str = parameter.ToString();
			if (!flag)
			{
				return null;
			}
			return Enum.Parse(targetType, str);
		}
	}
}