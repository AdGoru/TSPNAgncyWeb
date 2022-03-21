<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%--<link href="../../Content/webstyle.css" rel="stylesheet" type="text/css" />--%>
<div class="lnavCol">
    <%--<div class="lnavHeader doveBG">
        <h2>CAF List</h2>
    </div>--%>
    <div class="lnavBody  clearfix">
        <div class="lnavCopy">
            <ul class="grey-arrow-list">
                <li class="current">
                    <%:Html.ActionLink("Create New Application", "TCAF", "CAF", new { id="0"},null)%></li>
                <li class="heading">
                    <%:Html.Label("lblHeading", "Applications by Status")%></li>
                <li>
                    <%:Html.ActionLink("New (to be submitted)", "CAFList", "CAF", new { id = "new" }, null)%></li>
                <li>
                    <%:Html.ActionLink("Submitted to DBH", "CAFList", "CAF", new { id = "SubToDBH" }, null)%></li>
                <li>
                    <%:Html.ActionLink("Incomplete", "CAFList", "CAF", new { id = "Incomplete" }, null)%></li>
                <li>
                    <%:Html.ActionLink("Pending", "CAFList", "CAF", new { id = "Pending" }, null)%></li>
                <li>
                    <%:Html.ActionLink("Approved", "CAFList", "CAF", new { id = "Approved" }, null)%></li>
                <li>
                    <%:Html.ActionLink("Denied", "CAFList", "CAF", new { id = "Denied" }, null)%></li>
                <li>
                    <%:Html.ActionLink("Withdrawn", "CAFList", "CAF", new { id = "Withdrawn" }, null)%></li>
                <li class="heading">
                    <%:Html.Label("lblHeading", "All Applications")%></li>
                <li>
                    <%:Html.ActionLink("By Child Name", "CAFList", "CAF", new { id = "Child" }, null)%></li>
                <li>
                    <%= Html.ActionLink("By Camp Name", "CAFList", "CAF", new { id = "Camp" }, null)%></li>
                <li>
                    <%:Html.ActionLink("By Referral Source", "CAFList", "CAF", new { id = "Referral" }, null)%></li>
                <li>
                    <%:Html.ActionLink("All Submissions", "CAFList", "CAF", new { id = "Submissions" }, null)%></li>
               <%-- <li class="heading">
                    <%:Html.Label("lblHeading", "Faxes")%></li>
                <li>
                    <%:Html.ActionLink("Rejected Faxes", "FaxList","Fax")%></li>--%>
            </ul>
        </div>
    </div>
    <div class="lnavFooter">
    </div>
</div>
<%--<% using (Html.BeginForm())
   { %>
<table bgcolor="#ECF3C8" cellpadding="0px" cellspacing="0px" width="180px">
    <tr>
        <td class="LeftPaneHLink">
            <div style="width: 100%">
                <%:Html.ActionLink("Create New Application", "NewCAF","CAF")%>
            </div>
        </td>
    </tr>
    <tr>
        <td style="color: #CC6666" class="LeftPaneHLink">
            <div style="width: 100%">
                <%:Html.Label("lblHeading", "View Applications")%>
            </div>
        </td>
    </tr>
    <tr>
        <td style="padding-left: 20px" class="LeftPaneHLink">
            <div style="width: 100%">
                <%:Html.ActionLink("New(To be submitted)", "CAFList", "CAF")%>
            </div>
        </td>
    </tr>
    <tr>
        <td style="padding-left: 20px" class="LeftPaneHLink">
            <%:Html.ActionLink("Incomplete", "CAFList", "CAF")%>
        </td>
    </tr>
    <tr>
        <td style="padding-left: 20px" class="LeftPaneHLink">
            <%:Html.ActionLink("Submitted to DBH", "CAFList", "CAF")%>
        </td>
    </tr>
    <tr>
        <td style="padding-left: 20px" class="LeftPaneHLink">
            <%:Html.ActionLink("By child's name", "CAFList", "CAF")%>
        </td>
    </tr>
    <tr>
        <td style="padding-left: 20px" class="LeftPaneHLink">
            <%:Html.ActionLink("By camp name", "CAFList", "CAF")%>
        </td>
    </tr>
    <tr>
        <td style="padding-left: 20px" class="LeftPaneHLink">
            <%:Html.ActionLink("My submissions", "CAFList", "CAF")%>
        </td>
    </tr>
    <tr>
        <td style="padding-left: 20px" class="LeftPaneHLink">
            <%:Html.ActionLink("All submissions", "CAFList", "CAF")%>
        </td>
    </tr>
    <tr>
        <td class="LeftPaneHLink">
            <%:Html.ActionLink("Rejected faxes", "FaxList","Fax")%>
        </td>
    </tr>
</table>
<% } %>--%>