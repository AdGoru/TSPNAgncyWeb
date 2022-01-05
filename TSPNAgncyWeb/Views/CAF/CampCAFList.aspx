<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<com.rti.tailspinnew.Models.WcfAppService.localCampCAFListItem>>" %>

<script runat="server">
    public MvcHtmlString Truncate(string input, int length)
    {
        if (input != null)
        {
            if (input.Length <= length)
            {
                return MvcHtmlString.Create(input);
            }
            else
            {
                return MvcHtmlString.Create(input.Substring(0, length) + "<text>...</text>");
            }
        }
        return MvcHtmlString.Empty;
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CampCAFList
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%using (Html.BeginForm("CampCAFList", "CAF", FormMethod.Post, new { enctype = "multipart/form-data" }))
      {%>
    <table>
        <tr>
            <td style=" padding:10px 0px 5px 0px">
                <div class="ButtonBar">
                <input type="text" id="searchtxt" name="searchtxt" style=" width:640px" />&nbsp;&nbsp;
                    <input type="submit" value="Search" id="CampCAFList" />
                </div>
            </td>
        </tr>
        <tr>
            <td style=" padding:0px 0px 10px 0px">
            <%:Html.CheckBox("reference", true)%><%:Html.Label("cblblreference", "Reference")%>
            <%:Html.CheckBox("chname", true)%><%:Html.Label("cblblchname", "Child's Name   ")%>
               <%:Html.CheckBox("caname", false)%><%:Html.Label("cblblcaname", "Camp Name   ")%> 
                 <%:Html.CheckBox("caphone", false)%><%:Html.Label("cblblcaphone", "Camp Phone   ")%> 
                   <%:Html.CheckBox("refname", false)%><%:Html.Label("cblblrefname", "Submitted On  ")%> 
                     <%:Html.CheckBox("agtname", false)%><%:Html.Label("cblblagtname", "Agent Name   ")%> 
                       <%:Html.CheckBox("status", false)%><%:Html.Label("cblblcaname", "Status   ")%> 
            </td>
        </tr>
                <tr>
            <td>            
            <% if (ViewContext.RouteData.Values["Id"] == null || string.IsNullOrEmpty(ViewContext.RouteData.Values["Id"].ToString()) || ViewContext.RouteData.Values["Id"].ToString().ToLower() == "child")
               { %>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                    <tr align="left">
                        <th align="left" nowrap="nowrap">
                            Ref No
                        </th>
                        <th align="left" nowrap="nowrap">
                            Child's Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Camp Name
                        </th>
                        
                        <th align="left" nowrap="nowrap">
                            Submitted On
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agency Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agent Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agent Phone
                        </th>
                        <th align="left" nowrap="nowrap">
                            Status
                        </th>
                    </tr>
                    <% foreach (var item in Model)
                       { %>
                    <tr>
                        <td>
                            <%:Html.ActionLink(item.CafReference, "TCAF", new { id = item.AppID })%>
                        </td>
                        <td>
                            <%: Truncate(item.ChildName, 80)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.CampTitle,50)%>&nbsp;
                        </td>
                        
                        <td>
                            <%: Truncate(item.SubmittedOn,10)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgencyName,25)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgentName,25)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgentPhone,12)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.CAFStatusDisplay, 25)%>&nbsp;
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% }
               else if (ViewContext.RouteData.Values["Id"] != null && ViewContext.RouteData.Values["Id"].ToString().ToLower()=="camp")
               { %>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                    <tr align="left">
                        <th align="left" nowrap="nowrap">
                            Ref No
                        </th>
                        <th align="left" nowrap="nowrap">
                            Camp Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Child's Name
                        </th>                        
                        
                        <th align="left" nowrap="nowrap">
                            Submitted On
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agency Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agent Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Status
                        </th>
                    </tr>
                    <% foreach (var item in Model)
                       { %>
                    <tr>
                        <td>
                            <%:Html.ActionLink(item.CafReference, "TCAF", new { id = item.AppID })%>
                        </td>
                        <td>
                            <%: Truncate(item.CampTitle,50)%>
                        </td>
                        <td>
                            <%: Truncate(item.ChildName, 80)%>
                        </td>                        
                        
                        <td>
                            <%: Truncate(item.SubmittedOn,10)%>
                        </td>
                        <td>
                            <%: Truncate(item.AgencyName,25)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgentName,25)%>
                        </td>
                        <td>
                            <%--<%: Truncate(item.CAFStatusDisplay.ToString() == "SUBMITTEDACCOUNTING" ? "SUBMITTED" : item.Status.ToString(), 25)%>--%>
                            <%: Truncate(item.CAFStatusDisplay, 25)%>
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% }
               else if (ViewContext.RouteData.Values["Id"] != null && ViewContext.RouteData.Values["Id"].ToString().ToLower() == "referral")
               { %>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                    <tr align="left">
                        <th align="left" nowrap="nowrap">
                            Ref No
                        </th>
                        <th align="left" nowrap="nowrap">
                            Submitted On
                        </th>
                        <th align="left" nowrap="nowrap">
                            Camp Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Child's Name
                        </th>                        
                             <th align="left" nowrap="nowrap">
                            Agency Name
                        </th>                   
                        <th align="left" nowrap="nowrap">
                            Agent Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Status
                        </th>
                    </tr>
                    <% foreach (var item in Model)
                       { %>
                    <tr>
                        <td>
                            <%:Html.ActionLink(item.CafReference, "TCAF", new { id = item.AppID })%>
                        </td>
                        <td>
                            <%: Truncate(item.SubmittedOn,10)%>
                        </td>
                        <td>
                            <%: Truncate(item.CampTitle,50)%>
                        </td>
                        <td>
                            <%: Truncate(item.ChildName, 80)%>
                        </td>                        
                       
                        <td>
                            <%: Truncate(item.AgencyName,25)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgentName,25)%>
                        </td>
                        <td>
                            <%--<%: Truncate(item.CAFStatusDisplay.ToString() == "SUBMITTEDACCOUNTING" ? "SUBMITTED" : item.Status.ToString(), 25)%>--%>
                            <%: Truncate(item.CAFStatusDisplay, 25)%>
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% }
               else if (ViewContext.RouteData.Values["Id"] != null && ViewContext.RouteData.Values["Id"].ToString().ToLower() == "submissions")
               { %>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                    <tr align="left">
                        <th align="left" nowrap="nowrap">
                            Ref No
                        </th>
                        <th align="left" nowrap="nowrap">
                            Submitted On
                        </th>
                        <th align="left" nowrap="nowrap">
                            Camp Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Child's Name
                        </th>                        
                          <th align="left" nowrap="nowrap">
                            Agency Name
                        </th>                      
                        <th align="left" nowrap="nowrap">
                            Agent Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Status
                        </th>
                    </tr>
                    <% foreach (var item in Model)
                       { %>
                    <tr>
                        <td>
                            <%:Html.ActionLink(item.CafReference, "TCAF", new { id = item.AppID })%>
                        </td>
                        <td>
                            <%: Truncate(item.SubmittedOn,10)%>
                        </td>
                        <td>
                            <%: Truncate(item.CampTitle,50)%>
                        </td>
                        <td>
                            <%: Truncate(item.ChildName, 80)%>
                        </td>                        
                        
                        <td>
                            <%: Truncate(item.AgencyName,25)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgentName,25)%>
                        </td>
                        <td>
                            <%--<%: Truncate(item.CAFStatusDisplay.ToString() == "SUBMITTEDACCOUNTING" ? "SUBMITTED" : item.Status.ToString(), 25)%>--%>
                            <%: Truncate(item.CAFStatusDisplay, 25)%>
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% }   
               else if (ViewContext.RouteData.Values["Id"] == null || string.IsNullOrEmpty(ViewContext.RouteData.Values["Id"].ToString()) || ViewContext.RouteData.Values["Id"].ToString().ToLower() == "new")
               { %>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                    <tr align="left">
                        <th align="left" nowrap="nowrap">
                            Ref No
                        </th>
                        <th align="left" nowrap="nowrap">
                            Child's Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Camp Name
                        </th>
                        
                        <th align="left" nowrap="nowrap">
                            Submitted On
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agency Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agent Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Status
                        </th>
                    </tr>
                    <% foreach (var item in Model.Where(a => a.CAFStatus == com.rti.appcommon.CAF_STATE.NEW).ToList())
                       { %>
                    <tr>
                        <td>
                            <%:Html.ActionLink(item.CafReference, "TCAF", new { id = item.AppID })%>
                        </td>
                       <td>
                            <%: Truncate(item.ChildName, 80)%>
                        </td>                        
                        <td>
                            <%: Truncate(item.CampTitle,50)%>
                        </td>
                        
                        <td>
                            <%: Truncate(item.SubmittedOn,10)%>
                        </td>
                        <td>
                            <%: Truncate(item.AgencyName,25)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgentName,25)%>
                        </td>
                        <td>
                            <%--<%: Truncate(item.CAFStatusDisplay.ToString() == "SUBMITTEDACCOUNTING" ? "SUBMITTED" : item.Status.ToString(), 25)%>--%>
                            <%: Truncate(item.CAFStatusDisplay, 25)%>
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% }
                else if (ViewContext.RouteData.Values["Id"] == null || string.IsNullOrEmpty(ViewContext.RouteData.Values["Id"].ToString()) || ViewContext.RouteData.Values["Id"].ToString().ToLower() == "subtodbh")
               { %>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                    <tr align="left">
                        <th align="left" nowrap="nowrap">
                            Ref No
                        </th>
                        <th align="left" nowrap="nowrap">
                            Child's Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Camp Name
                        </th>
                        
                        <th align="left" nowrap="nowrap">
                            Submitted On
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agency Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agent Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Status
                        </th>
                    </tr>
                    <% foreach (var item in Model.Where(a => a.CAFStatus == com.rti.appcommon.CAF_STATE.SUBMITTED ).ToList())
                       { %>
                    <tr>
                        <td>
                            <%:Html.ActionLink(item.CafReference, "TCAF", new { id = item.AppID })%>
                        </td>
                               <td>
                            <%: Truncate(item.ChildName, 80)%>
                        </td>                        
                        <td>
                            <%: Truncate(item.CampTitle,50)%>
                        </td>
                        
                        <td>
                            <%: Truncate(item.SubmittedOn,10)%>
                        </td>
                        <td>
                            <%: Truncate(item.AgencyName,25)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgentName,25)%>
                        </td>
                        <td>
                            <%--<%: Truncate(item.CAFStatusDisplay.ToString() == "SUBMITTEDACCOUNTING" ? "SUBMITTED" : item.Status.ToString(), 25)%>--%>
                            <%: Truncate(item.CAFStatusDisplay, 25)%>
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% }
                else if (ViewContext.RouteData.Values["Id"] == null || string.IsNullOrEmpty(ViewContext.RouteData.Values["Id"].ToString()) || ViewContext.RouteData.Values["Id"].ToString().ToLower() == "incomplete")
               { %>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                    <tr align="left">
                        <th align="left" nowrap="nowrap">
                            Ref No
                        </th>
                        <th align="left" nowrap="nowrap">
                            Child's Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Camp Name
                        </th>
                       
                        <th align="left" nowrap="nowrap">
                            Incomplete On
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agency Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agent Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Status
                        </th>
                    </tr>
                    <% foreach (var item in Model.Where(a => a.CAFStatus ==  com.rti.appcommon.CAF_STATE.INCOMPLETE).ToList())
                       { %>
                    <tr>
                        <td>
                            <%:Html.ActionLink(item.CafReference, "TCAF", new { id = item.AppID })%>
                        </td>
                        <td>
                            <%: Truncate(item.ChildName, 80)%>
                        </td>                        
                        <td>
                            <%: Truncate(item.CampTitle,50)%>
                        </td>
                        
                        <td>
                            <%: Truncate(item.IncompleteOn,10)%>
                        </td>
                        <td>
                            <%: Truncate(item.AgencyName,25)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgentName,25)%>
                        </td>
                        <td>
                            <%--<%: Truncate(item.CAFStatusDisplay.ToString() == "SUBMITTEDACCOUNTING" ? "SUBMITTED" : item.Status.ToString(), 25)%>--%>
                            <%: Truncate(item.CAFStatusDisplay, 25)%>
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% } else if (ViewContext.RouteData.Values["Id"] == null || string.IsNullOrEmpty(ViewContext.RouteData.Values["Id"].ToString()) || ViewContext.RouteData.Values["Id"].ToString().ToLower() == "pending")
               { %>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                    <tr align="left">
                        <th align="left" nowrap="nowrap">
                            Ref No
                        </th>
                        <th align="left" nowrap="nowrap">
                            Child's Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Camp Name
                        </th>
                        
                        <th align="left" nowrap="nowrap">
                            Submitted On
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agency Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agent Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Status
                        </th>
                    </tr>
                    <% foreach (var item in Model.Where(a => a.CAFStatus == com.rti.appcommon.CAF_STATE.PENDING).ToList())
                       { %>
                    <tr>
                        <td>
                            <%:Html.ActionLink(item.CafReference, "TCAF", new { id = item.AppID })%>
                        </td>
                        <td>
                            <%: Truncate(item.ChildName, 80)%>
                        </td>                        
                        <td>
                            <%: Truncate(item.CampTitle,50)%>
                        </td>
                        
                        <td>
                            <%: Truncate(item.SubmittedOn,10)%>
                        </td>
                        <td>
                            <%: Truncate(item.AgencyName,25)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgentName,25)%>
                        </td>
                        <td>
                            <%--<%: Truncate(item.CAFStatusDisplay.ToString() == "SUBMITTEDACCOUNTING" ? "SUBMITTED" : item.Status.ToString(), 25)%>--%>
                            <%: Truncate(item.CAFStatusDisplay, 25)%>
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% }
                else if (ViewContext.RouteData.Values["Id"] == null || string.IsNullOrEmpty(ViewContext.RouteData.Values["Id"].ToString()) || ViewContext.RouteData.Values["Id"].ToString().ToLower() == "approved")
               { %>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                    <tr align="left">
                        <th align="left" nowrap="nowrap">
                            Ref No
                        </th>
                        <th align="left" nowrap="nowrap">
                            Child's Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Camp Name
                        </th>
                       
                        <th align="left" nowrap="nowrap">
                            Submitted On
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agency Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agent Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Status
                        </th>
                    </tr>
                    <% foreach (var item in Model.Where(a => a.CAFStatus == com.rti.appcommon.CAF_STATE.APPROVED
                                                      || a.CAFStatus == com.rti.appcommon.CAF_STATE.SUBMITTEDACCOUNTING
                                                      || a.CAFStatus == com.rti.appcommon.CAF_STATE.APPROVEDPAID
                                                      || a.CAFStatus == com.rti.appcommon.CAF_STATE.APPROVEDDNA
                                                      ).ToList())
                       { %>
                    <tr>
                        <td>
                            <%:Html.ActionLink(item.CafReference, "TCAF", new { id = item.AppID })%>
                        </td>
                        <td>
                            <%: Truncate(item.ChildName, 80)%>
                        </td>                        
                        <td>
                            <%: Truncate(item.CampTitle,50)%>
                        </td>
                        
                        <td>
                            <%: Truncate(item.SubmittedOn,10)%>
                        </td>
                        <td>
                            <%: Truncate(item.AgencyName,25)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgentName,25)%>
                        </td>
                        <td>
                            <%--<%: Truncate(item.CAFStatusDisplay.ToString() == "SUBMITTEDACCOUNTING" ? "SUBMITTED" : item.Status.ToString(), 25)%>--%>
                            <%: Truncate(item.CAFStatusDisplay, 25)%>
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% }
                else if (ViewContext.RouteData.Values["Id"] == null || string.IsNullOrEmpty(ViewContext.RouteData.Values["Id"].ToString()) || ViewContext.RouteData.Values["Id"].ToString().ToLower() == "denied")
               { %>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                    <tr align="left">
                        <th align="left" nowrap="nowrap">Ref No</th>
                        <th align="left" nowrap="nowrap">Child's Name</th>
                        <th align="left" nowrap="nowrap">Camp Name</th>
                        <th align="left" nowrap="nowrap">
                            Camp Phone
                        </th>
                        <th align="left" nowrap="nowrap">
                            Submitted On
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agency Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agent Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Status
                        </th>
                    </tr>
                    <% foreach (var item in Model.Where(a => a.CAFStatus == com.rti.appcommon.CAF_STATE.DENIED).ToList())
                       { %>
                    <tr>
                        <td>
                            <%:Html.ActionLink(item.CafReference, "TCAF", new { id = item.AppID })%>
                        </td>
                        <td>
                            <%: Truncate(item.ChildName, 80)%>
                        </td>                        
                        <td>
                            <%: Truncate(item.CampTitle,50)%>
                        </td>
                        
                        <td>
                            <%: Truncate(item.SubmittedOn,10)%>
                        </td>
                        <td>
                            <%: Truncate(item.AgencyName,25)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgentName,25)%>
                        </td>
                        <td>
                            <%--<%: Truncate(item.CAFStatusDisplay.ToString() == "SUBMITTEDACCOUNTING" ? "SUBMITTED" : item.Status.ToString(), 25)%>--%>
                            <%: Truncate(item.CAFStatusDisplay, 25)%>
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% }
                else if (ViewContext.RouteData.Values["Id"] == null || string.IsNullOrEmpty(ViewContext.RouteData.Values["Id"].ToString()) || ViewContext.RouteData.Values["Id"].ToString().ToLower() == "withdrawn")
               { %>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                    <tr align="left">
                        <th align="left" nowrap="nowrap">
                            Ref No
                        </th>
                        <th align="left" nowrap="nowrap">
                            Child's Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Camp Name
                        </th>
                        
                        <th align="left" nowrap="nowrap">
                            Withdrawn On
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agency Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Agent Name
                        </th>
                        <th align="left" nowrap="nowrap">
                            Status
                        </th>
                    </tr>
                    <% foreach (var item in Model.Where(a => a.CAFStatus == com.rti.appcommon.CAF_STATE.WITHDRAWN).ToList())
                       { %>
                    <tr>
                        <td>
                            <%:Html.ActionLink(item.CafReference, "TCAF", new { id = item.AppID })%>
                        </td>
                        <td>
                            <%: Truncate(item.ChildName, 80)%>
                        </td>                        
                        <td>
                            <%: Truncate(item.CampTitle,50)%>
                        </td>
                        
                        <td>
                            <%: Truncate(item.WithdrawnOn,10)%>
                        </td>
                        <td>
                            <%: Truncate(item.AgencyName,25)%>&nbsp;
                        </td>
                        <td>
                            <%: Truncate(item.AgentName,25)%>
                        </td>
                        <td>
                            <%--<%: Truncate(item.CAFStatusDisplay.ToString() == "SUBMITTEDACCOUNTING" ? "SUBMITTED" : item.Status.ToString(), 25)%>--%>
                            <%: Truncate(item.CAFStatusDisplay, 25)%>
                        </td>
                    </tr>
                    <% } %>
                </table>
            <% }%>              
            </td>
        </tr>
    </table>
         <% } %>
</asp:Content>
