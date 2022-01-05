<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>


 <%--<link href="../../Content/webstyle.css" rel="stylesheet" type="text/css" />--%>
 <% using (Html.BeginForm()) { %>
<table width="250px" cellpadding="0px" cellspacing="0px" bgcolor="#7BBCF5" style="padding-left:25px"><%--"#66CCFF"--%>
    <tr height="30px">         
        <td class="LeftPaneHLink" style="color: #034af3;"><div style="Width:100%">
          <%:Html.ActionLink("Home", "Index", "Home")%></div>
        </td>    
    </tr>
    <tr height="30px">
        <td class="LeftPaneHLink" style="color: #CC8F88;"><div style="Width:100%">
        <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="false" >Agency</asp:HyperLink></div>
        </td>
    </tr>
    <tr height="30px">
        <td class="LeftPaneHLink" ><div style="Width:100%">
            <%--<asp:HyperLink ID="HyperLink2" runat="server" CssClass="LeftPaneHLink" NavigateUrl="~/Views/Account/Register.aspx">Agency Registration</asp:HyperLink>--%>
            &nbsp;&nbsp;&nbsp;&nbsp;<%:Html.ActionLink("Agency Registration", "Register", "Account")%></div>

        </td>
    </tr>
    </table>
    <%}%>