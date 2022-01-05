<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/RegistrationMasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.web.Models.ForgotPasswordModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    ForgotPassword
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h3>Forgot Password</h3>--%>
    <%--<p Class="body">
        To reset your password, type the User ID,full email address that you use to sign in to your Account. <%--<%: Html.ActionLink("Register", "Register") %> if you don't have an account.
    </p>--%>
    <% using (Html.BeginForm())
       { %>
    <table cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td valign="middle" style="padding-top:100px; padding-left:300px">
                <%: Html.ValidationSummary(true, "Password reset was unsuccessful. Please correct the errors and try again.")%>
                <div style="width:400px; height:200px ">
                    <fieldset>
                        <legend>Forgotten your password? </legend>                        
                        <div class="editor-label" style=" padding:20px 10px 10px 10px;">
                            Please enter your Login ID :
                        </div>
                        <div class="editor-field" style=" padding:0px 10px 10px 10px;">
                            <%: Html.TextBoxFor(m => m.Email, new { style = "width:360px;" })%>
                            <%: Html.ValidationMessageFor(m => m.Email)%>
                        </div>                       
                        <p class="ButtonBar" style=" padding:0px 10px 10px 10px;" >
                             <input type="submit" value="SUBMIT" />&nbsp;&nbsp;
                             New Agency? <%: Html.ActionLink("Register", "Register","Account") %>
                        </p>
                    </fieldset>
                </div>                
            </td>
        </tr>
    </table>
    <% } %>
</asp:Content>
