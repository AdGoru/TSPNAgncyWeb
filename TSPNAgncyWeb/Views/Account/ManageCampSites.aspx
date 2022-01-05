<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CampManagemntMasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<com.rti.tailspinnew.Models.WcfAppService.localCampSiteListItem>>" %>

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
    CampContactsList
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Camp Users List</h3>
    <table style="width:100%; border:0; padding:0; border-collapse: collapse; border-spacing: 0;" class="grid">
        <tr align="left">
            <th>
                User
            </th>
            <th>
                Camp Site
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
            int currentAppID = 0;
            if (Session["campcontact"] != null)
                int.TryParse(Session["AppID"].ToString(), out currentAppID);
           foreach (var item in Model)
          {%>
        <tr>
            <td>
                <%:Html.ActionLink(item.Name, "CampSiteRegistration", new { id = item.CampCorpAppID })%>
            </td>
            <td>
                
                <%:Truncate(item.AppID.ToString(),15)%> &nbsp;
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
                <% if (currentAppID != item.AppID) %>                                                          
                <%:Html.ActionLink("Delete", "Confirmation", new { id = item.AppID })%>&nbsp;
            </td>
          </tr>
                <% } %>
    </table>
</asp:Content>
