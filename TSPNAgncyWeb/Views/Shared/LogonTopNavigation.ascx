<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
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
<div class="topmenu" >
    <ul id="button" style=" width:1260px; background-color:#590033">       
        <li>
            <% if (ViewContext.RouteData.Values["Action"].ToString() == "LogOn")
               { %>
                <%:Html.ActionLink("Home", "LogOn", "Account", null, new { @class = "menuitemactive" })%>
            <% } else { %>
                <%:Html.ActionLink("Home", "LogOn", "Account", null, new { })%>
            <% } %>   
        </li> 
        <li><a onclick="disp_confirm()">DBHIDS </a></li>                 
    </ul>
</div>

