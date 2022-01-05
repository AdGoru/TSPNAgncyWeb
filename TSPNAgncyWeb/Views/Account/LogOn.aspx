<%@ Page Language="C#" MasterPageFile="~/Views/Shared/LogonMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.web.Models.LogOnModel>" %>

<%@ Register Src="~/Views/UserControls/LeftPaneWithoutLogin.ascx" TagName="leftpane"
    TagPrefix="cc1" %>
<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Agency Log On
</asp:Content>
<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <table style="padding:0; border-collapse: collapse; border-spacing: 0; width: 100%; border:0">
        <tr style="vertical-align: top; text-align: left">
            <td style="width: 70%; padding-right: 10px; text-align: left; vertical-align: top;" class="lbtop">
                <table style="width: 100%; padding:0; border-collapse: collapse; border-spacing: 0; border:0">
                    <tr>
                        <td class="lbox" style="vertical-align: top">
                                <%--<%:Html.ValidationSummary(true)%>--%>
                                <%if (ViewData["PreLogin"] != null)
                                  {%>
                                <span style="color: black">
                                    <%string str = ViewData["PreLogin"].ToString(); %>
                                    <%: @Html.Raw(str)%></span>
                                <%} %>
                               
                        </td>
                    </tr>
                </table>
            </td>
            <td style="vertical-align: top; text-align: left; height:100%" class="rbox">
                <div class="body logondiv">
                    <div class="logondivinr">
                        <div style="text-align:center;"><h3>Agency Portal</h3></div>
                        <div class="editor-label" style="padding-top: 10px; padding-bottom: 10px;">
                            <%: Html.LabelFor(m => m.UserName) %>
                        </div>
                        <div class="editor-field">
                            <%: Html.TextBoxFor(m => m.UserName, new { style = "width:250px;" })%>
                            <%: Html.ValidationMessageFor(m => m.UserName) %>
                        </div>
                        <div class="editor-label" style="padding-top: 10px; padding-bottom: 10px;">
                            <%: Html.LabelFor(m => m.Password) %>
                        </div>
                        <div class="editor-field">
                            <%: Html.PasswordFor(m => m.Password, new { style = "width:250px;" })%>
                            <%: Html.ValidationMessageFor(m => m.Password) %>
                        </div>
                        <div class="editor-label" style="padding-top: 10px; text-align: center;">
                            <%: Html.CheckBoxFor(m => m.RememberMe) %>
                            <%: Html.LabelFor(m => m.RememberMe) %>
                        </div>
                        <p style="padding-top: 10px; text-align: center;">
                            <input type="submit" value="LOGON" />
                            <!-- </p> -->
                            <!-- PG Feb 6 12> moved the Html.ValidationSummary to below the logon button and
                               somply provide the errors with a prefix - take out first parameter "true" -->
                            <!-- <p style="padding-top: 10px;text-align:center;"> -->
                            <!-- <%: Html.ValidationSummary(true, "Login was unsuccessful:") %> -->
                            <%: Html.ValidationSummary() %>
                        </p>
                        <p style="padding-top: 10px; text-align: center;">
                            <%: Html.ActionLink("Forgot Password", "ForgotPassword") %></p>
                        <p style="padding-top: 10px; text-align: center;">
                            New Agency?
                            <%: Html.ActionLink("Register", "Register")%>
                        </p>
                        </div>
                </div>
            </td>
        </tr>
    </table>
    <% } %>
</asp:Content>
