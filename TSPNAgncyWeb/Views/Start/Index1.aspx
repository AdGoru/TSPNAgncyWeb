<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterPage.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<%--<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">--%>

<h3>Index</h3>
 <% using (Html.BeginForm())
    { %>
<table >
<tr>
<td width="250px" height="100%">
<%Html.ActionLink("Summer Camp", "LogOn", "Account"); %>
</td>
</tr>
<tr>
<td>

</td>
</tr>
</table>
<%} %>
<%--</asp:Content>--%>


