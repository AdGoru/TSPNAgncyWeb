using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Threading;

namespace com.rti.tailspinnew.web.Models.Common
{
	public class rtiUIElementList<T> : ObservableCollection<T>
	where T : IUIelementRB_CB, new()
	{
		private T _newselection;

		public T NewSelection
		{
			get
			{
				return this._newselection;
			}
			private set
			{
				if (this._newselection == null)
				{
					this._newselection = value;
					this.RaisePropertyChanged(this._newselection.ToString());
				}
				if (!this._newselection.Equals(value))
				{
					this._newselection = value;
					this.RaisePropertyChanged(this._newselection.ToString());
				}
			}
		}

		public rtiUIElementList()
		{
		}

		public void Add2EventHandler(EventHandler target)
		{
			this.PropertyChangedx += new EventHandler(target.Invoke);
		}

		public void AddUIElement(string groupname, string facetext, bool selection, int enumvalue, string tooltip)
		{
			T t = default(T);
			T t1 = (t == null ? Activator.CreateInstance<T>() : default(T));
			t1.Add(groupname, facetext, selection, enumvalue, tooltip);
			base.Add(t1);
			t1.Add2PropertyChangedEventHandler(new PropertyChangedEventHandler(this.getSelection));
		}

		public void clearFlag(int enuminstance)
		{
			foreach (T t in this)
			{
				if (t.getEnumValue() != enuminstance)
				{
					continue;
				}
				t.clearFlag();
				break;
			}
		}

		public void getSelection(object sender, PropertyChangedEventArgs args)
		{
			this.NewSelection = (T)sender;
		}

		private void RaisePropertyChanged(string ObjectDescription)
		{
			if (this.PropertyChangedx != null)
			{
				this.PropertyChangedx(this, new PropertyChangedEventArgs(ObjectDescription));
			}
		}

		public void setFlag(int enuminstance)
		{
			foreach (T t in this)
			{
				if (t.getEnumValue() != enuminstance)
				{
					continue;
				}
				t.setFlag();
				break;
			}
		}

		public event EventHandler PropertyChangedx;
	}
}