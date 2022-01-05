<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<com.rti.tailspinnew.web.Models.AttachFiles>" %>

<% using (Html.BeginForm("UploadFiles", "AttachFilesController", FormMethod.Post, new { enctype = "multipart/form-data" }))
   {%>

<form action="UploadFiles" method="post" enctype="multipart/form-data">
<table>
<tr>
<td>
<asp:Label ID="lblFile" Text="Please Select a File" runat="server"></asp:Label>
</td>
<td>
<%--<asp:FileUpload ID="filecntr" runat="server" />--%>
<input type="file" name="file" id="file" />
</td>
</tr>

<tr>
<td>
<input type='submit' value='Upload' name="Upload"/>
</td>
</tr>
</table>
</form>
<%}%>