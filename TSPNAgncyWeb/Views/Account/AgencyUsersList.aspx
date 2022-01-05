<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AgencyManagemntMasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<com.rti.tailspinnew.Models.WcfAppService.localAgencyContactListItem>>" %>

<script runat="server">
    public MvcHtmlString Truncate(string input, int length)
    {
        if (input == null) input = "";
        if (input.Length <= length)
        {
            return MvcHtmlString.Create(input);
        }
        else
        {
            return MvcHtmlString.Create(input.Substring(0, length) + "<text>...</text>");
        }
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    AgencyUsersList
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Agency Users List</h3>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
        <tr align="left">
            <th>
                User
            </th>
            <th>
                Phone
            </th>
            <th>
                Fax
            </th>
            <th>
                Email
            </th>
            <th>
                Role
            </th>
            <th>
                &nbsp;
            </th>
        </tr>
        <%
            int currentUserAppID = 0;
            if (Session["agent"] != null)
                int.TryParse(Session["agentAppID"].ToString(), out currentUserAppID);
           foreach (var item in Model)
          {%>
        <tr>
            <td>
                <%:Html.ActionLink(item.Name, "AgencyContactRegistration", new { id = item.AppID })%>
            </td>
            <td>
                
                <%:Truncate(item.Phones,15)%> &nbsp;
            </td>
            <td>
                
                <%:Truncate(item.Faxes,15)%> &nbsp;
            </td>
            <td>
                <%:Truncate(item.Emailaddresses,30) %>
            </td>
            <td>
                <%:Truncate(item.Rolestr,16) %>&nbsp;
            </td>
            <td>    
                <% if (currentUserAppID != item.AppID && item.Rolestr != "Super-Admin")
                    { %>                                                          
                <%:Html.ActionLink("Delete", "Confirmation", new { id = item.AppID })%>&nbsp;
                <% } %>
            </td>
          </tr>
                <% } %>
    </table>
</asp:Content>
