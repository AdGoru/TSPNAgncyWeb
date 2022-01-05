<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="System.IO"%>
<%--<iframe src="<%= Url.Action("GetPDF") %>"></iframe>--%>

<object data="<%= Url.Action("GetPDF") %>" type="application/pdf" width="300" height="200">
    alt : <a href="C:\\Documents and Settings\\Administrator\\My Documents\\TSPN\\TailspinnewTeam5dec11.pdf" runat="server">test.pdf</a><%--"../../PDF/RTIDeveloperKit.pdf"--%>
</object>
<%--<% public FileStreamResult GetPDF()
{ 
    FileStream fs = new FileStream("../../PDF/RTIDeveloperKit.pdf", FileMode.Open, FileAccess.Read);
    return System.IO.(fs, "application/pdf");
}%>--%>
