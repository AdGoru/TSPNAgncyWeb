<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/CampManagemntMasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.Models.WcfAppService.localCampSite>" %>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>
<script runat="server">
    public MvcHtmlString Truncate(string input, int length)
    {
        if (input != null)
        {
            if (input.Length <= length)
            {
                return MvcHtmlString.Create(input);
            }
            else
            {
                return MvcHtmlString.Create(input.Substring(0, length) + "<text>...</text>");
            }
        }
        return MvcHtmlString.Empty;
    }   
   
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    CampSiteProfile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Update Camp Site Profile</h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <%using (Html.BeginForm())
      {%>
    <%: Html.ValidationSummary(true, "Camp Site profile update was unsuccessful. Please correct the errors and try again.") %>
    
    <%if (ViewData["Messages"] != null)
      {%>
        <span style=" color:red">
            <%: ViewData["Messages"].ToString()%></span>
    <%} %>
    <div>
        <fieldset>
            <legend>Camp Site Information</legend>
            <table class="body" cellspacing="0px" cellpadding="5">
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            <asp:Label ID="lblCampSiteName" runat="server" Text="Camp Site Name"></asp:Label>
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.HiddenFor(m => m.AppID)%>
                            <%: Html.HiddenFor(m => m.CampCorpAppID)%>
                            <%: Html.TextBoxFor(m => m.SiteName, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(m => m.SiteName)%>
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
                            <%: Html.TextBoxFor(model => model.Line1, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(model => model.Line1)%>
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
                            <%: Html.TextBoxFor(model => model.Line2, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(model => model.Line2)%>
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
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Who signed agreement
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.WhoSignedAgreement, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(model => model.WhoSignedAgreement)%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                        <div class="editor-label">
                            Title of who signed agreement
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(model => model.TitleOfWhoSignedAgrmnt, new { style = "width:400px;" })%>
                            <%: Html.ValidationMessageFor(model => model.TitleOfWhoSignedAgrmnt)%>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle" width="110px">
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <p class="ButtonBar">
                            <input type="submit" value="SUBMIT" name="UpdateCampSite"/>&nbsp;<%--<input type="submit" value="Cancel"/>&nbsp;<%: Html.ActionLink("Login", "LogOn","Account") %>--%>
                        </p>
                    </td>                   
                </tr>
            </table>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
