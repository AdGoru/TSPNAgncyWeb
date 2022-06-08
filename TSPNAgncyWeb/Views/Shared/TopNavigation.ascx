<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>"  %>
<script>
    function disp_confirm() {
        var r = confirm("You are about to leave the Madeline Moore Summer Camp Grant processing site. Continue?")
        if (r == true) {
            document.location.href = 'http://www.dbhids.org';
        }
        else {
            return false;
        }
    }
</script>
<%
    com.rti.tailspinnew.Models.WcfAppService.localAgencyContact agnet = new com.rti.tailspinnew.Models.WcfAppService.localAgencyContact();
    
    if (Session["agent"] != null)
    {
        // agnet = (com.rti.tailspinnew.AppDom.AgencyContact)Session["agent"];
        int appID;
        int.TryParse(Session["agentAppID"].ToString(), out appID);
        agnet = com.rti.tailspinnew.Models.WebSessionManager.getAgencyContactRecord((int)Session["usertoken"], (int)Session["agentAppID"]);
       
    }
%>
<div class="topmenu" style=" ">
    <ul id="button" style=" width:1260px; background-color:#590033">
        <li>
            <% if (ViewContext.RouteData.Values["Controller"].ToString() == "Home" && ViewContext.RouteData.Values["Action"].ToString() == "PostLoginHome")
               { %>
            <%:Html.ActionLink("Home", "PostLoginHome", "Home", null, new { @class = "menuitemactive" })%>
            <% } else { %>
            <%:Html.ActionLink("Home", "PostLoginHome", "Home",null, new { })%>
            <% } %>
        </li>
        <li>
            <% if (ViewContext.RouteData.Values["Controller"].ToString() =="CAF") { %>
            <%:Html.ActionLink("Camp Applications", "CAFList", "CAF", null, new { @class = "menuitemactive" })%>
            <% } else { %>
            <%:Html.ActionLink("Camp Applications", "CAFList", "CAF",null, new { })%>
            <% } %>
        </li>
        <li>
            <% if (ViewContext.RouteData.Values["Controller"].ToString() == "Account" && (ViewContext.RouteData.Values["Action"].ToString() == "MyProfile" || ViewContext.RouteData.Values["Action"].ToString() == "Register" || ViewContext.RouteData.Values["Action"].ToString() == "ForgotPassword" || ViewContext.RouteData.Values["Action"].ToString() == "ChangePassword"))
               { %>
            <%:Html.ActionLink("My Profile", "MyProfile", "Account", null, new { @class = "menuitemactive" })%>
            <% } else { %>
            <%:Html.ActionLink("My Profile", "MyProfile", "Account", null, new { })%>
            <% } %>
        </li>
        <%--        <li>
            <% if (ViewContext.RouteData.Values["Controller"].ToString() == "Account" && (ViewContext.RouteData.Values["Action"].ToString() == "AgencyManagement" || ViewContext.RouteData.Values["Action"].ToString() == "UpdateAgencyProfile" || ViewContext.RouteData.Values["Action"].ToString() == "AgencyUsersList"))
               { %>
                <%:Html.ActionLink("Agency Management", "UpdateAgencyProfile", "Account", null, new { @class = "menuitemactive" })%>
            <% } else { %>
                <%:Html.ActionLink("Agency Management", "UpdateAgencyProfile", "Account",null, new {})%>
            <% } %> 
            
        </li>--%>
        <% if (agnet.Rolestr.ToLower() != "user")
   { %>
        <li>
            <% if (ViewContext.RouteData.Values["Controller"].ToString() == "Account" && (ViewContext.RouteData.Values["Action"].ToString() == "AgencyManagement" || ViewContext.RouteData.Values["Action"].ToString() == "AgencyUsersList"))
               { %>
            <%:Html.ActionLink("Agency Management", "AgencyUsersList", "Account", null, new { @class = "menuitemactive" })%>
            <% } else { %>
            <%:Html.ActionLink("Agency Management", "AgencyUsersList", "Account", null, new { })%>
            <% } %>
        </li>
        <% } %>
        <li>
            <% if (ViewContext.RouteData.Values["Controller"].ToString() == "Home" && ViewContext.RouteData.Values["Action"].ToString() == "About")
               { %>
            <%:Html.ActionLink("Help", "About", "Home", null, new { @class = "menuitemactive" })%>
            <% } else { %>
            <%:Html.ActionLink("Help", "About", "Home",null, new {})%>
            <% } %>
        </li>
        <li><a onclick="disp_confirm()">DBHIDS </a></li>
        <li>
            <div id="Login" class="LeftPaneHLink">
                <span>Welcome,
                    <%: agnet.Name %>&nbsp;&nbsp;(<%: agnet.Rolestr %>)</span></div>
        </li>
    </ul>   
</div>
