<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="TitleContent" runat="server">
    Internet web access -DBH IDS Homepage
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <table cellpadding="0px" cellspacing="0px" width="1260px">
        <tr>
            <td width="150px" align="left" valign="top" bgcolor="#a6a7aa" style="color: #FFFFFF;
                padding: 10px" class="LeftPaneHLink" height="450px">
                <%:Html.ActionLink("Summer Camp", "LogOn", "Account") %>
            </td>
            <td valign="top" align="left" height="100%" style="padding: 10px">
                <h1>
                    Welcome to Summer Campm web access - DBH IDS home page.</h1>
                <p>
                    Please select "Summer Camp" to access.</p>
            </td>
        </tr>
    </table>
    <%} %>
</asp:Content>
