<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<com.rti.tailspinnew.web.Models.Camp>>" %>
<%--<% using (Ajax.BeginForm("NewCAF", "CAF", null,
        new AjaxOptions
        {UpdateTargetId = "update-message",
            InsertionMode = InsertionMode.Replace, HttpMethod = "POST",
         OnSuccess = "updateSuccess"
        }, new { @id = "updateCarForm" }))
    { %> --%>
  <% using (Html.BeginForm())
   { %>      
<%: Html.ValidationSummary(true) %>
<div id="update-message" class="error invisible"></div>
<p>

</p>
<table>
    <tr>
        <th>
            CampName
        </th>
        <th>
            PreferredCamp
        </th>
        <th>
            Website
        </th>
        <th></th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>   
        <td>
            <%: Html.DisplayFor(modelItem => item.CampName) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.PreferredCamp) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Website) %>
        </td>
        <td>
            <%: Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> |
            <%: Html.ActionLink("Details", "Details", new { id=item.Id }) %> |
            <%: Html.ActionLink("Delete", "Delete", new { id=item.Id }) %>
        </td>
        <%-- <td>
    <%:Html.HiddenFor(modelItem=>item.Id) %>
    </td>--%>
    </tr>
<% } %>

</table>

<%}%>