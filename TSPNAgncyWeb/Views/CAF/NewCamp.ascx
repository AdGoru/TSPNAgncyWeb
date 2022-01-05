<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<com.rti.tailspinnew.web.Models.CampSite>" %>

<% using (Html.BeginForm())
   { %>
   
<%: Html.ValidationSummary(true) %>
<style type="text/css">
    .NewCamp{ height:423px !important}
</style>
<script type="text/javascript">
    function SelectedCampx() {
        $(".NewCamp").dialog('close');
        $(".NewCamp").dialog('close');
    }
    </script>
    <script type="text/javascript">
    function SelectedCamp(cmpid) {
        var ttl = $("#hdnTitle" + cmpid).val();
        var aid = $("#hdnAppId" + cmpid).val();
        var adrs = $("#hdnAddress" + cmpid).val();
        var prf = $("#hdnisPreferred" + cmpid).val();
        
        $("#Camp").val(ttl);
        $("#CampSiteAppID").val(aid);
        $(".camptitle").html(ttl + ", ");
        $(".campaddress").html(adrs);
        $(".iscamppreferred").valueOf(prf);
        $(".SelectCamp").dialog('close');
        $(".NewCamp").dialog('close');
    }
    </script>
<% if (ViewData["CampInserted"] != null && ViewData["CampInserted"] == "1")
   { %>
   <p id="pSuccessMsg" style=" color:Red; font-weight:bold">New Camp saved</p>
<script type="text/javascript">
    $("#pSuccessMsg").focus();
</script>

<% }
   else if (ViewData["CampInserted"] != null && ViewData["CampInserted"] == "-1")
   { %>
   <p id="pErrorMsg" style=" color:Red; font-weight:bold">Problem saving the new camp record. Please try again or contact administrator if the problem persists..</p>
   <script type="text/javascript">
       $("#pErrorMsg").focus();
    </script>    
   <% }
%>
<table cellpadding="0" cellspacing="0" width="90%">
    <tr>
        <td valign="top">
            <fieldset>
                <legend>Camp Details</legend>
                <table class="body" style="width: 100%;" align="left">
                
                    <tr>
                        <td width="110px">
                            <div class="editor-label">
                                Camp Name
                                <% if (ViewData["CampInserted"] != null)
                                   { %>
                                <%--<%: Html.HiddenFor(m1 => Model.AppID)%>--%>
                                <% }  %>
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.Title, new { style = "width:180px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.Title)%>
                                
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="DatatdLeftnMiddle" style="width: 110px;">
                            <div class="editor-label">
                                <asp:Label ID="lblAddress" runat="server" Text="Address Line 1"></asp:Label>
                            </div>
                        </td>
                        <td class="DatatdLeftnMiddle">
                            <div class="text-box.multi-line">
                                <%:Html.TextBoxFor(m1 => m1.Line1, new Dictionary<string, object>() { { "style", "width:180px;height:20px" } })%>
                                <%:Html.ValidationMessageFor(m1 => m1.Line1)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="DatatdLeftnMiddle" style="width: 110px;">
                            <div class="editor-label">
                                <asp:Label ID="Label1" runat="server" Text="Address Line 2"></asp:Label>
                            </div>
                        </td>
                        <td class="DatatdLeftnMiddle">
                            <div class="text-box.multi-line">
                                <%:Html.TextBoxFor(m1 => m1.Line2, new Dictionary<string, object>() { { "style", "width:180px;height:20px" } })%>
                                <%:Html.ValidationMessageFor(m1 => m1.Line2)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="editor-label">
                            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(m1 => m1.City, new { style = "width:180px;" })%>
                            <%:Html.ValidationMessageFor(m1 => m1.City)%>
                        </td>
                    </tr>
                    <tr>
                        <td class="editor-label">
                            <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(m1 => m1.State, new { style = "width:180px;" })%>
                            <%:Html.ValidationMessageFor(m1 => m1.State)%>
                        </td>
                    </tr>                    
                    <tr>
                        <td class="editor-label">
                            <asp:Label ID="lblZip" runat="server" Text="Zip"></asp:Label>
                        </td>
                        <td>
                            <%:Html.TextBoxFor(m1 => m1.Zip, new { style = "width:180px;" })%>
                            <%:Html.ValidationMessageFor(m1 => m1.Zip)%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Phone #</div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.Phone, new { style = "width:180px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.Phone)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td><div class="editor-label">FAX #</div></td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.Fax, new { style = "width:180px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.Fax)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Email</div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.Email, new { style = "width:180px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.Email)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Website
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.Website, new { style = "width:180px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.Website)%>
                            </div>
                            <%: Html.Hidden("hdn"+Model.AppID, Model.AppID)%>
                <%: Html.Hidden("hdnTitle" + Model.AppID, Model.Title)%>
                <%: Html.Hidden("hdnAppId" + Model.AppID, Model.AppID)%>
                <%: Html.Hidden("hdnPreferred" + Model.AppID, false)%>
                <%: Html.Hidden("hdnAddress" + Model.AppID, Model.Line1 + " " + Model.Line2 + " " + Model.City + " "+Model.State)%>
                <%: Html.Hidden("hdnisPreferred" + Model.AppID, false) %>
                        </td>
                    </tr>                    
                    <tr>
                        <td>
                        </td>
                        <td>
                            <div class="right">
                            <%:Html.HiddenFor(m1 => m1.AppID)%>
                                <input type="submit" value="Submit" id="btnSave" style="float: left" /> 
                                <% if ((int)ViewData["newCampSiteAppIDvd"] != 0)
                                   { %>
                                 &nbsp;&nbsp;<a href="javascript:void(0);" onclick="SelectedCamp('<%= Model.AppID %>')" style="float: right">Close</a>
                                <% }  %>
                               <%-- <% if ((int)ViewData["newCampSiteAppIDvd"] == 0)
                                   { %>
                                 &nbsp;&nbsp;<a href="javascript:void(0);" onclick="SelectedCampx()">Back to Camp List</a>
                                <% }  %>--%>
                            </div>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </td>
    </tr>
</table>
<%}%>