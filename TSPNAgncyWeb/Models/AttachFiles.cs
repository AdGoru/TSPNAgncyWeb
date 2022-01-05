using System;
using System.Runtime.CompilerServices;

namespace com.rti.tailspinnew.web.Models
{
	public class AttachFiles
	{
		public byte[] FileContent
		{
			get;
			set;
		}

		public int fileID
		{
			get;
			set;
		}

		public string FileName
		{
			get;
			set;
		}

		public string FileType
		{
			get;
			set;
		}

		public AttachFiles()
		{
		}
	}
}