<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/LogonMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.web.Models.ChangePasswordModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Reset Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <%-- @modelName:model com.rti.tailspinnew.web.Models.ChangePasswordModel--%>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <h3>Reset Password</h3>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <div>
     <table style="width: 100%;" class="body">        
        <tr>
            <td>
                <%--<asp:Label ID="Label2" runat="server" Text="New Password"></asp:Label>--%>
                <%: Html.LabelFor(model => model.NewPassword)%>
            </td>
        </tr>
        
        <tr>
            <td>
                <%--<asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>--%>
                <%: Html.PasswordFor(model => model.NewPassword, new { style = "width:300px;" })%>
                <%: Html.ValidationMessageFor(model => model.NewPassword)%>
                <%--<%:Html.TextBox("txtOldPassword") %>--%>
                <%--<%:Html.ValidationMessage(Model., "*")%>--%>
            </td>
        </tr>
        
        <tr>
            <td>
                <%--<asp:Label ID="Label3" runat="server" Text="Confirm New Password"></asp:Label>--%>
                <%: Html.LabelFor(model => model.ConfirmNewPassword)%>
            </td>
        </tr>
        <tr>
            <td>
                <%--<asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox>--%>
                <%: Html.PasswordFor(model => model.ConfirmNewPassword, new { style = "width:300px;" })%>
                <%: Html.ValidationMessageFor(model => model.ConfirmNewPassword)%>
            </td>
        </tr>
    </table>
    <p class="ButtonBar">
        <!-- <input type="button" id="submit" value="Submit" /> -->
        <input type="submit" value="Submit" /> 
    </p>
 </div>
 <% } %>  
</asp:Content>
