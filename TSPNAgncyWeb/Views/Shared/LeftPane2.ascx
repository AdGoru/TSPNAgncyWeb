<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%--<link href="../../Content/webstyle.css" rel="stylesheet" type="text/css" />--%>
<%
    com.rti.tailspinnew.Models.WcfAppService.localAgencyContact agnet = new com.rti.tailspinnew.Models.WcfAppService.localAgencyContact();
    
    if (Session["agent"] != null)
    {
        agnet = (com.rti.tailspinnew.Models.WcfAppService.localAgencyContact)Session["agent"];       
    }
%>
<div class="lnavCol">
    <div class="lnavBody  clearfix">
        <div class="lnavCopy">
            <ul class="grey-arrow-list">
               <%-- <li class="current">
                    <%:Html.ActionLink("My Profile", "AgencyContactRegistration", "Account", new { id = agnet.AppID }, null)%>
                </li>--%>
                <li><%:Html.ActionLink("Agency Profile", "UpdateAgencyProfile", "Account")%></li>
                <li><%:Html.ActionLink("Create User", "AgencyContactRegistration", "Account", new { id = "" }, null)%></li>
                <li><%:Html.ActionLink("Manage Users", "AgencyUsersList", "Account")%></li>
              <%--  <li><%:Html.ActionLink("Reports", "Reports", "Reports")%></li>--%>
                
            </ul>
        </div>
    </div>
    <div class="lnavFooter">
        
    </div>
</div>

