<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<com.rti.tailspinnew.web.Models.Name1>" %>
<%--<% using (Html.BeginForm())
   { %>--%>
<%:Html.ValidationSummary(true) %>
<table class="body" style="width: 200px">
    <tr>
        <td style="width: 100px" align="left">
            <%:Html.TextBoxFor(m1 => m1.FirstName, new { style = "width:90px;" })%>
            <%:Html.ValidationMessageFor(m1 =>m1.FirstName)%>
        </td>
        <td style="width: 50px">
            <%--<%:Html.TextBox("txtMiddleName",null, new { @style = "width:40px;MaxLength:50" })%>--%>
            <%:Html.TextBoxFor(m1 => m1.MiddleName, new { style = "width:50px;" })%>
            <%:Html.ValidationMessageFor(m1 => m1.MiddleName)%>
        </td>
        <td style="width: 100px">
            <%:Html.TextBoxFor(m1 => m1.LastName, new { style = "width:90px;" })%>
            <%:Html.ValidationMessageFor(m1 => m1.LastName)%>
        </td>
    </tr>
</table>
<%--<%} %>--%>
