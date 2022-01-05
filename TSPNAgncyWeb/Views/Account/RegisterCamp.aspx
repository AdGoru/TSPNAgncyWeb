<%@ Page Language="C#" MasterPageFile="~/Views/Shared/RegistrationMasterPage.Master" Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.web.Models.CampRegisterModel>" %>

<%--<%@ Register Src="~/Views/UserControls/AddressView.ascx" TagName="Address" TagPrefix="cc1" %>--%>
<%@ Register Src="~/Views/UserControls/LeftPaneWithoutCampLogin.ascx" TagName="leftpane"
    TagPrefix="cc1" %>
<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register Camp
</asp:Content>
<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">    
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <div>
        <div>
            <h3 style=" float:left;">Register New Camp</h3>
            <p class="ButtonBar" style=" float:right ">
                <%: Html.ActionLink("Back to Login", "LogOn","Account") %>
            </p>
        </div>   
        <br />     
        <table>
            <tr>
                <td valign="top" align="left">
                    <fieldset style="width: 440px;">
                        <legend>New Camp-Admin Profile</legend>
                        <table class="body" cellspacing="0" style=" padding:10px;">
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(m => m.SA_FirstName)%>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SA_FirstName, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SA_FirstName) %>
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
                                        <%:Html.LabelFor(model => model.SA_LastName)%>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SA_LastName, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SA_LastName)%>
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
                                        <%: Html.LabelFor(model => model.SA_MiddleInitial)%>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SA_MiddleInitial, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SA_MiddleInitial)%>
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
                                        <%: Html.LabelFor(model => model.SA_Email)%>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SA_Email, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SA_Email)%>
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
                                        <%: Html.LabelFor(model => model.SA_Phone1) %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SA_Phone1, new { style = "width:175px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SA_Phone1)%>
                                        <%: Html.LabelFor(model => model.SA_Extension1)%>
                                        <%: Html.TextBoxFor(model => model.SA_Extension1, new { style = "width:60px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SA_Extension1)%>
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
                                        <%: Html.LabelFor(model => model.SA_Phone2) %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SA_Phone2, new { style = "width:175px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SA_Phone2)%>
                                        <%: Html.LabelFor(model => model.SA_Extension2)%>
                                        <%: Html.TextBoxFor(model => model.SA_Extension2, new { style = "width:60px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SA_Extension2)%>
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
                                        <%: Html.LabelFor(model => model.SA_Fax)%>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SA_Fax, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SA_Fax)%>
                                    </div>
                                </td>
                            </tr>
                            
                        </table>
                    </fieldset>
                    * Required
                </td>
                
                <td valign="top" align="left">
                    <fieldset style="width: 440px">
                        <legend>Camp Site Profile</legend>
                        <table class="body" cellspacing="0px" style=" padding:10px;">
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">                                        
                                        <%: Html.LabelFor(model => model.SiteName)  %>
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
                                <td colspan="2">
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.Siteline1) %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.Siteline1, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.Siteline1)  %>
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
                                        <%: Html.LabelFor(model => model.Siteline2) %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.Siteline2, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.Siteline2)  %>
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
                                        <%: Html.LabelFor(model => model.SiteCity)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SiteCity, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SiteCity)  %>
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
                                        <%: Html.LabelFor(model => model.SiteState)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SiteState, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SiteState)  %>
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
                                        <%: Html.LabelFor(model => model.SiteZip)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SiteZip, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SiteZip)  %>
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
                                        <%: Html.LabelFor(model => model.SiteFax)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SiteFax, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SiteFax)  %>
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
                                        <%: Html.LabelFor(model => model.SitePhone1) %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SitePhone1, new { style = "width:175px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SitePhone1)%>
                                        <%: Html.LabelFor(model => model.SitePhoneExt1)%>
                                        <%: Html.TextBoxFor(model => model.SitePhoneExt1, new { style = "width:60px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SitePhoneExt1)%>
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
                                        <%: Html.LabelFor(model => model.SitePhone2) %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SitePhone2, new { style = "width:175px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SitePhone2)%>
                                        <%: Html.LabelFor(model => model.SitePhoneExt2)%>
                                        <%: Html.TextBoxFor(model => model.SitePhoneExt2, new { style = "width:60px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SitePhoneExt2)%>
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
                                        <%: Html.LabelFor(model => model.SiteEmail)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SiteEmail, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SiteEmail)  %>
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
                                        <%: Html.LabelFor(model => model.SiteWebsite)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.SiteWebsite, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.SiteWebsite)  %>
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
                                        <%: Html.LabelFor(model => model.WhoSignedAgreement)  %>
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
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td class="DatatdLeftnMiddle" width="110px">
                                    <div class="editor-label">
                                        <%: Html.LabelFor(model => model.TitleOfWhoSignedAgreement)  %>
                                    </div>
                                </td>
                                <td class="DatatdLeftnMiddle">
                                    <div class="editor-field">
                                        <%: Html.TextBoxFor(model => model.TitleOfWhoSignedAgreement, new { style = "width:300px;" })%>
                                        <%: Html.ValidationMessageFor(model => model.TitleOfWhoSignedAgreement)  %>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr> 
        </Table>
        <table style="width:100%">
            <tr>
                <td style="vertical-align:top; align-items:flex-start">
                    <fieldset style="width:auto">
                        <legend>Camp Business Office Profile (Optional)</legend>
                        <table class="body" cellspacing="0px" style="padding: 0px;">
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td class="DatatdLeftnMiddle" style="width:110px">
                                                <div class="editor-label">
                                                    <%: Html.LabelFor(model => model.CorpName)  %>
                                                </div>
                                            </td>
                                            <td class="DatatdLeftnMiddle">
                                                <div class="editor-field">
                                                    <%: Html.TextBoxFor(model => model.CorpName, new { style = "width:300px;" })%>
                                                    <%: Html.ValidationMessageFor(model => model.CorpName)  %>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="height: 12px;">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td class="DatatdLeftnMiddle" style="width:110px">
                                                <div class="editor-label">
                                                    <%: Html.LabelFor(model => model.Corpline1) %>
                                                </div>
                                            </td>
                                            <td class="DatatdLeftnMiddle">
                                                <div class="editor-field">
                                                    <%: Html.TextBoxFor(model => model.Corpline1, new { style = "width:300px;" })%>
                                                    <%: Html.ValidationMessageFor(model => model.Corpline1)  %>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="height: 12px;">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td class="DatatdLeftnMiddle" style="width:110px">
                                                <div class="editor-label">
                                                    <%: Html.LabelFor(model => model.Corpline2) %>
                                                </div>
                                            </td>
                                            <td class="DatatdLeftnMiddle">
                                                <div class="editor-field">
                                                    <%: Html.TextBoxFor(model => model.Corpline2, new { style = "width:300px;" })%>
                                                    <%: Html.ValidationMessageFor(model => model.Corpline2)  %>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="height: 12px;">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td class="DatatdLeftnMiddle" style="width:110px">
                                                <div class="editor-label">
                                                    <%: Html.LabelFor(model => model.CorpCity)  %>
                                                </div>
                                            </td>
                                            <td class="DatatdLeftnMiddle">
                                                <div class="editor-field">
                                                    <%: Html.TextBoxFor(model => model.CorpCity, new { style = "width:300px;" })%>
                                                    <%: Html.ValidationMessageFor(model => model.CorpCity)  %>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="height: 12px;">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td class="DatatdLeftnMiddle" style="width:110px">
                                                <div class="editor-label">
                                                    <%: Html.LabelFor(model => model.CorpState)  %>
                                                </div>
                                            </td>
                                            <td class="DatatdLeftnMiddle">
                                                <div class="editor-field">
                                                    <%: Html.TextBoxFor(model => model.CorpState, new { style = "width:300px;" })%>
                                                    <%: Html.ValidationMessageFor(model => model.CorpState)  %>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="height: 12px;">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td class="DatatdLeftnMiddle" style="width:110px">
                                                <div class="editor-label">
                                                    <%: Html.LabelFor(model => model.CorpZip)  %>
                                                </div>
                                            </td>
                                            <td class="DatatdLeftnMiddle">
                                                <div class="editor-field">
                                                    <%: Html.TextBoxFor(model => model.CorpZip, new { style = "width:300px;" })%>
                                                    <%: Html.ValidationMessageFor(model => model.CorpZip)  %>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>

                                <td>
                                    <table>
                                        <tr>
                                            <td class="DatatdLeftnMiddle" style="width:110px">
                                                <div class="editor-label">
                                                    <%: Html.LabelFor(model => model.CorpContact)  %>
                                                </div>
                                            </td>
                                            <td class="DatatdLeftnMiddle">
                                                <div class="editor-field">
                                                    <%: Html.TextBoxFor(model => model.CorpContact, new { style = "width:300px;" })%>
                                                    <%: Html.ValidationMessageFor(model => model.CorpContact)  %>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="height: 12px;">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td class="DatatdLeftnMiddle" style="width:110px">
                                                <div class="editor-label">
                                                    <%: Html.LabelFor(model => model.CorpEmail)  %>
                                                </div>
                                            </td>
                                            <td class="DatatdLeftnMiddle">
                                                <div class="editor-field">
                                                    <%: Html.TextBoxFor(model => model.CorpEmail, new { style = "width:300px;" })%>
                                                    <%: Html.ValidationMessageFor(model => model.CorpEmail)  %>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="height: 12px;">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td class="DatatdLeftnMiddle" style="width:110px">
                                                <div class="editor-label">
                                                    <%: Html.LabelFor(model => model.CorpPhone) %>
                                                </div>
                                            </td>
                                            <td class="DatatdLeftnMiddle">
                                                <div class="editor-field">
                                                    <%: Html.TextBoxFor(model => model.CorpPhone, new { style = "width:175px;" })%>
                                                    <%: Html.ValidationMessageFor(model => model.CorpPhone)%>
                                                    <%: Html.LabelFor(model => model.CorpPhoneExt)%>
                                                    <%: Html.TextBoxFor(model => model.CorpPhoneExt, new { style = "width:60px;" })%>
                                                    <%: Html.ValidationMessageFor(model => model.CorpPhoneExt)%>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="height: 12px;">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td class="DatatdLeftnMiddle" style="width:110px">
                                                <div class="editor-label">
                                                    <%: Html.LabelFor(model => model.CorpFax)  %>
                                                </div>
                                            </td>
                                            <td class="DatatdLeftnMiddle">
                                                <div class="editor-field">
                                                    <%: Html.TextBoxFor(model => model.CorpFax, new { style = "width:300px;" })%>
                                                    <%: Html.ValidationMessageFor(model => model.CorpFax)  %>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="height: 12px;">
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td class="DatatdLeftnMiddle" style="width:110px">
                                                <div class="editor-label">
                                                    <%: Html.LabelFor(model => model.CorpWebsite)  %>
                                                </div>
                                            </td>
                                            <td class="DatatdLeftnMiddle">
                                                <div class="editor-field">
                                                    <%: Html.TextBoxFor(model => model.CorpWebsite, new { style = "width:300px;" })%>
                                                    <%: Html.ValidationMessageFor(model => model.CorpWebsite)  %>
                                                </div>
                                            </td>
                                            <tr style="height: 12px;">
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>

            </tr>

            <tr>
                <td colspan="2" align="center" style="padding-top: 0px">
                    <p class="ButtonBar">
                        <input type="submit" value="Register" />&nbsp;&nbsp;
                                        <%: Html.HiddenFor(model => model.UserType, 4) %>
                    </p>
                </td>
            </tr>
        </table>
    </div>
    <% } %>
</asp:Content>
