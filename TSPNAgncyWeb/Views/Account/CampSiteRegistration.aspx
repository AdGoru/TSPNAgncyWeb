<%@ Page Language="C#" MasterPageFile="~/Views/Shared/CampManagemntMasterPage.Master" 
    Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.Models.WcfAppService.localCampSite>" %>

<%--<%@ Register Src="~/Views/UserControls/AddressView.ascx" TagName="Address" TagPrefix="cc1" %>--%>
<%@ Register Src="~/Views/UserControls/LeftPaneWithoutLogin.ascx" TagName="leftpane"
    TagPrefix="cc1" %>
<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Create Site
</asp:Content>
<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create New Camp Site</h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true, "Camp Site profile creation was unsuccessful. Please correct the errors and try again.") %>

    <%if (ViewData["Messages"] != null)
      {%>
        <span style=" color:red"><%: ViewData["Messages"].ToString()%></span>
    <%} %>

    <div>

        <fieldset>
            <legend>Camp Site Profile</legend>
            <table class="body" cellspacing="0px" cellpadding="5">
                <tr style="height: 12px;">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Camp Site Name
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.SiteName, new { style = "width:300px;" })%>
                            <%: Html.ValidationMessageFor(model => model.SiteName)  %>
                        </div>
                    </td>
                </tr>
                <tr style="height: 12px;">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Address Line 1
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.Line1, new { style = "width:300px;" })%>
                            <%: Html.ValidationMessageFor(model => model.Line1)  %>
                        </div>
                    </td>
                </tr>
                <tr style="height: 12px;">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Address Line 2
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.Line2, new { style = "width:300px;" })%>
                            <%: Html.ValidationMessageFor(model => model.Line2)  %>
                        </div>
                    </td>
                </tr>
                <tr style="height: 12px;">
                    <td colspan="2"></td>
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
                <tr style="height: 12px;">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            State
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.CampState, new { style = "width:300px;" })%>
                            <%: Html.ValidationMessageFor(model => model.CampState)  %>
                        </div>
                    </td>
                </tr>
                <tr style="height: 12px;">
                    <td colspan="2"></td>
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
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.Faxes)  %>
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.Faxes[0].Number, new { style = "width:300px;" })%>
                            <%: Html.ValidationMessageFor(model => model.Faxes[0].Number)  %>
                        </div>
                    </td>
                </tr>
                <tr style="height: 12px;">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.Phones)  %>
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.Phones[0].Number, new { style = "width:300px;" })%>
                            <%: Html.ValidationMessageFor(model => model.Phones[0].Number)  %>
                        </div>
                    </td>
                </tr>
                <tr style="height: 12px;">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.Emails)  %>
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.Emails[0].EmailAddress, new { style = "width:300px;" })%>
                            <%: Html.ValidationMessageFor(model => model.Emails[0].EmailAddress)  %>
                        </div>
                    </td>
                </tr>
                <tr style="height: 12px;">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            <%: Html.LabelFor(model => model.Weblink)  %>
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.Weblink[0].WWW, new { style = "width:300px;" })%>
                            <%: Html.ValidationMessageFor(model => model.Weblink[0].WWW)  %>
                        </div>
                    </td>
                </tr>
                <tr style="height: 12px;">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Who signed agreement
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.WhoSignedAgreement, new { style = "width:300px;" })%>
                            <%: Html.ValidationMessageFor(model => model.WhoSignedAgreement)  %>
                        </div>
                    </td>
                </tr>
                <tr style="height: 12px;">
                    <td colspan="2"></td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Title of who signed agreement
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.TitleOfWhoSignedAgrmnt, new { style = "width:300px;" })%>
                            <%: Html.ValidationMessageFor(model => model.TitleOfWhoSignedAgrmnt)  %>
                        </div>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="right" style="padding-top: 5px">
                        <p class="ButtonBar">
                            <input type="submit" value="Create" name="CampSiteRegistration" />&nbsp;&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </fieldset>

    </div>
    <% } %>
</asp:Content>
