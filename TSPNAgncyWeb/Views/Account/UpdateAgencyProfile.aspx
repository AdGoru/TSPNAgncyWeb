<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AgencyManagemntMasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.Models.WcfAppService.localAgency>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    UpdateAgencyProfile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Update Agency Profile</h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true, "Agency profile update was unsuccessful. Please correct the errors and try again.") %>
    
    <%if (ViewData["Messages"] != null)
      {%>
        <span style=" color:red"><%: ViewData["Messages"].ToString()%></span>
    <%} %>
    <div>
        <fieldset>
            <legend>Agency Information</legend>
            <table class="body" cellspacing="0px" cellpadding="5">
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            <asp:Label ID="lblAgencyName" runat="server" Text="Agency Name"></asp:Label>
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(m => m.Title, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(m => m.Title)%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Address Line 1
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.AddressLine1, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(model => model.AddressLine1)%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Address Line 2
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.AddressLine2, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(model => model.AddressLine2)%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            City
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.City, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(model => model.City)%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            State
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.State, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(model => model.State)%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Zip
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.Zip, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(model => model.Zip)%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-label">
                            Phone #
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(m => m.Phones[0].Number, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(m => m.Phones[0].Number)%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-label">
                            Fax #
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(m => m.Faxes[0].Number, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(m => m.Faxes[0].Number)%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Email ID
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(m => m.Emails[0].EmailAddress, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(m => m.Emails[0].EmailAddress)%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Website
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(m => m.Weblink[0].WWW, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(m => m.Weblink[0].WWW)%>
                        </div>
                    </td>
                </tr>
<%--                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Is Active? 
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.CheckBoxFor(m => m.IsActive)  %>
                            <%: Html.ValidationMessageFor(m => m.IsActive)%>
                        </div>
                    </td>
                </tr>--%>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <p class="ButtonBar">
                            <input type="submit" value="SUBMIT" name="UpdateAgency"/>&nbsp;<%--<input type="submit" value="Cancel"/>&nbsp;<%: Html.ActionLink("Login", "LogOn","Account") %>--%>
                        </p>
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
