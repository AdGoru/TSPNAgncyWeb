using com.rti.tailspinnew.Models.WcfAppService;
using System;
using System.Collections.Generic;

namespace com.rti.tailspinnew.web.Models
{
	public class PagedCAMPList
	{
		private int pageSize;

		private int pageNumber;

		private int totalRows;

		private List<localCampSiteListItem> campList;

		public List<localCampSiteListItem> CampList
		{
			get
			{
				return this.campList;
			}
			set
			{
				this.campList = value;
			}
		}

		public int PageNumber
		{
			get
			{
				return this.pageNumber;
			}
			set
			{
				this.pageNumber = value;
			}
		}

		public int PageSize
		{
			get
			{
				return this.pageSize;
			}
			set
			{
				this.pageSize = value;
			}
		}

		public int TotalRows
		{
			get
			{
				return this.totalRows;
			}
			set
			{
				this.totalRows = value;
			}
		}

		public PagedCAMPList(List<localCampSiteListItem> lstCaflistitems)
		{
			this.CampList = lstCaflistitems;
		}

		public PagedCAMPList(int iPagesize, int iPagenumber, int iTotalrecords, List<localCampSiteListItem> lstCaflistitems)
		{
			this.PageSize = iPagesize;
			this.PageNumber = iPagenumber;
			this.TotalRows = iTotalrecords;
			this.CampList = lstCaflistitems;
		}

		public PagedCAMPList GetCAFList()
		{
			return this;
		}
	}
}