<%@ Page Language="C#" MasterPageFile="~/Views/Shared/RegistrationMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.web.Models.RegisterModel>" %>

<%--<%@ Register Src="~/Views/UserControls/AddressView.ascx" TagName="Address" TagPrefix="cc1" %>--%>
<%@ Register Src="~/Views/UserControls/LeftPaneWithoutLogin.ascx" TagName="leftpane"
    TagPrefix="cc1" %>
<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>
<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">    
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <div>
        <div>
            <h3 style=" float:left;">Register New Agency</h3>
            <p class="ButtonBar" style=" float:right ">
                <%: Html.ActionLink("Back to Login", "LogOn","Account") %>
            </p>
        </div>   
        <br />     
        <table>
            <tr>
                <td valign="top" align="left">
                    <fieldset style="width: 440px">
                        <legend>Agency Profile</legend>
                        <table class="body" cellspacing="0px" style=" padding:10px;">
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.AgencyName)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.AgencyName, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.AgencyName)  %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.AgencyProviderID)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.AgencyProviderID, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.AgencyProviderID)  %>
                                    </div>
                                </td>
                            </tr>

                            <!-- need to add Agency department here -->
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.AgencyDepartment)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.AgencyDepartment, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.AgencyDepartment)  %>
                                    </div>
                                </td>
                            </tr>
                            <!-- -->
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.Address) %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextAreaFor(model => model.Address, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.Address)  %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.City)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.City, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.City)  %>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.State)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.State, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.State)  %>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.Zip)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.Zip, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.Zip)  %>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.MainFax)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.MainFax, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.MainFax)  %>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.MainPhone)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.MainPhone, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.MainPhone)  %>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.AgencyEmail)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.AgencyEmail, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.AgencyEmail)  %>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.Website)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.Website, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.Website)  %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
                <td valign="top" align="left">
                    <fieldset style="width: 440px;">
                        <legend>Agency Contact Profile</legend>
                        <table class="body" cellspacing="0" style=" padding:10px;">
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(m => m.FirstName)%>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.FirstName, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.FirstName) %>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%:Html.LabelFor(model => model.LastName)%>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.LastName, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.LastName)%>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.MiddleInitial)%>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.MiddleInitial, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.MiddleInitial)%>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.Email)%>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.Email, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.Email)%>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.Password) %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.PasswordFor(model => model.Password, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.Password) %>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.ConfirmPassword) %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.PasswordFor(model => model.ConfirmPassword, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.ConfirmPassword) %>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.Phone) %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.Phone, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.Phone)%>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.Extension)%>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.Extension, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.Extension)%>
                                    </div>
                                </td>
                            </tr>
                            <tr style="height: 12px;">
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.Fax)%>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.Fax, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.Fax)%>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="right" style="padding-top:5px">
                                    <p class="ButtonBar">
                        <input type="submit" value="Register" />&nbsp;&nbsp;
                    </p>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>            
        </table>
    </div>
    <% } %>
</asp:Content>
