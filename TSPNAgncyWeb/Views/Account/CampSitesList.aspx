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
Site List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Camp Sites List</h3>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
        <tr align="left">           
            <th>Camp Site</th>          
            <th>Phone</th>
            <th>Fax</th>
            <th>Email</th>
            <th>Website</th>
            <th>&nbsp;</th>
            <th>&nbsp;</th>
        </tr>
        <%
            int currentUserAppID = 0;
            if (Session["campcontact"] != null)
            {
                int.TryParse(Session["campcontactAppID"].ToString(), out currentUserAppID);
            }
            foreach (var item in Model)
            {%>
        <tr>
            <td><%:Truncate(item.Title,35)%> &nbsp;</td>           
            <td><%:Truncate(item.Phones,15)%> &nbsp;</td>
            <td><%:Truncate(item.Faxes,15)%> &nbsp;</td>
            <td><%:Truncate(item.Emailaddresses,30) %></td>
            <td><%:Truncate(item.Weblinks,25) %>&nbsp;</td>
            <td>    
                <% if (currentUserAppID != item.AppID && item.Statusstr != "Super-Admin") %>                                                          
                <%:Html.ActionLink("Edit", "CampSiteProfile", new { id = item.AppID })%>&nbsp;
            </td>
            <td>    
                <% if (currentUserAppID != item.AppID && item.Statusstr != "Super-Admin") %>                                                          
                <%:Html.ActionLink("Attachments", "CampSiteAttachmnts", new { id = item.AppID })%>&nbsp;
            </td>
          </tr>
                <% } %>
    </table>
            
    <h3>Site Attachments</h3>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
        <tr align="left">

            <th>Document Type</th>
            <th>File Name</th>
            <th>Upload Date</th>
            <th>Expiry Date</th>
            <th>Camp Site</th>
            <th>&nbsp;</th>
        </tr>
        


<%--        <%List<com.rti.tailspinnew.Models.WcfAppService.localCampSiteListItem> l = new List<com.rti.tailspinnew.Models.WcfAppService.localCampSiteListItem>(); %>
        <%foreach (com.rti.tailspinnew.Models.WcfAppService.localIOBox inboxRec in l) { %>
            
                
                        <tr>
                            <td>
                                <%: Html.DisplayFor(modelItem => inboxRec.Type)%>
                                <%: Html.Hidden("hdnAppID" + inboxRec.AppID)%>
                            </td>
                            <td>
                                <a href="javascript:void(0);" onclick="return ShowPDF('<%: inboxRec.DocAppIDs[0] %>')"><%: inboxRec.FileName%></a>               
                            </td>
                            <td>
                                <%: Truncate(inboxRec.DateOfUploading, 25)%>
                            </td>
                            <td>                
                                <%:Html.ActionLink("Delete", "DeleteAttch", new { id = inboxRec.AppID, ioRecType = inboxRec.Type })%>&nbsp;
                            </td>
                        </tr>
                     
                
            <%}%>--%>




    </table>
    <br />
    <%--<%:Html.ActionLink("Add Attachment", "Confirmation", new { id = 7 })%>--%>
</asp:Content>
