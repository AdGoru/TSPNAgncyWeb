using System;
using System.ComponentModel;
using System.Threading;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class DSMenuRadioButton : INotifyPropertyChanged, IUIelementRB_CB
	{
		private int _enumvalue;

		private string _facetext;

		private string _groupname;

		private string _tooltip;

		private bool _selected;

		public int Enumvalue
		{
			get
			{
				return this._enumvalue;
			}
			set
			{
				this._enumvalue = value;
			}
		}

		public string Facetext
		{
			get
			{
				return this._facetext;
			}
			private set
			{
				this._facetext = value;
			}
		}

		public string Groupname
		{
			get
			{
				return this._groupname;
			}
			private set
			{
				this._groupname = value;
			}
		}

		public bool Selected
		{
			get
			{
				return this._selected;
			}
			set
			{
				if (this._selected != value)
				{
					this._selected = value;
					if (this._selected)
					{
						this.RaisePropertyChanged(this.ToString());
					}
				}
			}
		}

		public string ToolTip
		{
			get
			{
				return this._tooltip;
			}
			private set
			{
				this._tooltip = value;
			}
		}

		public DSMenuRadioButton()
		{
		}

		public DSMenuRadioButton(string groupname, string txtface, bool selection, int enumvalue, string tooltip)
		{
			this.Enumvalue = enumvalue;
			this.Groupname = groupname;
			this.Facetext = txtface;
			this.Selected = selection;
			this.ToolTip = tooltip;
		}

		public void Add(string groupname, string txtface, bool selection, int enumvalue, string tooltip)
		{
			this.Enumvalue = enumvalue;
			this.Groupname = groupname;
			this.Facetext = txtface;
			this.Selected = selection;
			this.ToolTip = tooltip;
		}

		public void Add2PropertyChangedEventHandler(PropertyChangedEventHandler target)
		{
			this.PropertyChanged += new PropertyChangedEventHandler(target.Invoke);
		}

		public void clearFlag()
		{
		}

		public int getEnumValue()
		{
			return this.Enumvalue;
		}

		private void RaisePropertyChanged(string ObjectDescription)
		{
			if (this.PropertyChanged != null)
			{
				this.PropertyChanged(this, new PropertyChangedEventArgs(ObjectDescription));
			}
		}

		public void setFlag()
		{
			this.Selected = true;
		}

		public override string ToString()
		{
			return string.Concat(this.Groupname, ":", this.Facetext);
		}

		public event PropertyChangedEventHandler PropertyChanged;
	}
}