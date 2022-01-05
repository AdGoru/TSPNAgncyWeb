<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<com.rti.tailspinnew.web.Models.Telephone>>" %>


<% using (Html.BeginForm()) { %>
<%:Html.ValidationSummary(true) %>
<% foreach (var item in Model) { %>
<table>
<tr>
<td>
<%:Html.Label("lbltelephoneType",item.telephoneType) %>
</td>
<td>
<%:Html.TextBox("txtNumber",item.number) %>
</td>
<td>
<%:Html.TextBox("txtLocale", item.locale)%>
</td>
<td>
<div>
<input type="submit" value="Add Phone" name="action" />
</div>
</td>
</tr>
</table>
<%} %>
<%} %>
