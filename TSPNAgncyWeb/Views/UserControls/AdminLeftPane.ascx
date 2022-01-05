<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<style type="text/css">
    .style1
    {      cellpadding:0; cellspacing:0; border:0; align:left;width: 200px;
    } 


</style>
 <link href="../../Content/Style.css" rel="stylesheet" type="text/css" />
 <% using (Html.BeginForm()) { %>
<table class="style1" bgcolor="#E3F1BD" style="padding-left:25px"><%--"#66CCFF"--%>
    <tr height="30px">         
        <td class="LeftPaneHLink" style="color:#034af3;"><div style="Width:100%">
          <%:Html.ActionLink("Home", "PostLoginHome", "Home")%></div>
        </td>    
    </tr>
    <tr height="30px">
        <td class="LeftPaneHLink" style="color: #CC8F88;"><div style="Width:100%">
        <asp:HyperLink ID="HyperLink2" runat="server" Font-Underline="false" >Agency</asp:HyperLink></div>
        </td>
    </tr>
    <%--<tr height="30px">
        <td class="LeftPaneHLink" ><div style="Width:100%">
           
            &nbsp;&nbsp;&nbsp;&nbsp;<%:Html.ActionLink("Agency Registration", "Register", "Account")%></div>

        </td>
    </tr>--%>
    <tr height="30px">
        <td class="LeftPaneHLink" style="color: #034af3;"><div style="Width:100%">
            <%--<asp:HyperLink ID="HyperLink3" runat="server" CssClass="LeftPaneHLink" NavigateUrl="~/Views/Account/Register">Agency Profile Update</asp:HyperLink>--%>
            &nbsp;&nbsp;&nbsp;&nbsp;<%:Html.ActionLink("Agency Profile", "UpdateAgencyProfile", "Account")%></div>
            </td>
    </tr>
    <tr height="30px">
        <td class="LeftPaneHLink" style="color: #CC8F88;"><div style="Width:100%">
        <asp:HyperLink ID="HyperLink3" runat="server" Font-Underline="false">Agency Contact</asp:HyperLink>
        </div> 
        </td>
    </tr>
    <tr height="30px">
        <td class="LeftPaneHLink" style="color: #034af3;"><div style="Width:100%">
           <%-- <asp:HyperLink ID="HyperLink4" runat="server" CssClass="LeftPaneHLink" NavigateUrl="~/Views/Account/AgencyContactRegistration.aspx">Agency Contact Registration</asp:HyperLink>--%>
            &nbsp;&nbsp;&nbsp;&nbsp;<%:Html.ActionLink(" Add Agency Contact", "AgencyContactRegistration", "Account")%>
            </div>
            </td>
    </tr>
    <tr height="30px">
        <td class="LeftPaneHLink" style="color: #034af3;"><div style="Width:100%">
            <%--<asp:HyperLink ID="HyperLink5" runat="server" CssClass="LeftPaneHLink" NavigateUrl="~/Views/Account/AgencyContactRegistration.aspx">Agency Contact Profile Update</asp:HyperLink>--%>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <%:Html.ActionLink("Agency Contact Profile", "UpdateAgencyContactRegistration","AccountController", "Account")%>
            </div>
            </td>
    </tr>
    <tr height="30px">
        <td class="LeftPaneHLink" style="color: #034af3;"><div style="Width:100%">
            <%--<asp:HyperLink ID="HyperLink6" runat="server" CssClass="LeftPaneHLink">View CAF List</asp:HyperLink> --%> 
            <%:Html.ActionLink("View CAF List", "CAFList", "CAF")%></div>
         </td>
    </tr>
    <%--<tr height="30px">
        <td class="LeftPaneHLink" style="color: #034af3;"> <div style="Width:100%">
           
            <%:Html.ActionLink("Create New CAF", "NewCAF", "CAF")%>   </div>
            </td>
    </tr>--%>
    <%--<tr height="30px">
        <td class="LeftPaneHLink" style="color: #034af3;"> <div style="Width:100%">
            
            <%:Html.ActionLink("View Camp List", "CampList", "Camp")%>  </div> 
            </td>
    </tr>--%>
  <%--  <tr height="30px" >
        <td class="LeftPaneHLink" style="color: #034af3;"> <div style="Width:100%">
            
             <%:Html.ActionLink("Create New Camp", "NewCamp", "Camp")%></div>   
            </td>
    </tr>--%>
    <tr height="30px">
        <td class="LeftPaneHLink" style="color: #034af3;">
           <%-- <asp:HyperLink ID="HyperLink8" runat="server" CssClass="LeftPaneHLink">Rejected Fax List</asp:HyperLink>--%>
           <%:Html.ActionLink("Rejected Fax List", "FaxList", "Fax")%> 
         </td>
    </tr>
    <tr height="30px">
        <td class="LeftPaneHLink" style="color: #034af3;">
        <div style="Width:100%">
           <%-- <asp:HyperLink ID="HyperLink9" runat="server" CssClass="LeftPaneHLink">Reports</asp:HyperLink>--%>
            <%:Html.ActionLink("Agency Report", "Reports", "Reports")%> 
        </div>
        </td>
    </tr>
    
</table>
<% } %>