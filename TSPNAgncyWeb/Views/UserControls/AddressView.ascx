<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<com.rti.appcommon.Address>" %>
<%@ Import Namespace="com.rti.tailspinnew.web.Models" %>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
<%:Html.ValidationSummary(true) %>
<table width="100%" class="Maintable">
    <tr>
        <td class="DatatdLeftnMiddle" style=" width:110px;">
            <div class="editor-label">
                <asp:Label ID="lblAddress" runat="server" Text="Address Line 1"></asp:Label>
            </div>
        </td>
        <td class="DatatdLeftnMiddle">
            <div class="text-box.multi-line">
                <%:Html.TextBoxFor(m1 => m1.line1, new Dictionary<string, object>() { { "id", "txtAddressLine1" }, { "style", "width:180px;height:20px" } })%>
                <%:Html.ValidationMessageFor(m1 => m1.line1)%>
            </div>
        </td>
    </tr>
    <tr>
        <td class="DatatdLeftnMiddle" style=" width:110px;">
            <div class="editor-label">
                <asp:Label ID="Label1" runat="server" Text="Address Line 2"></asp:Label>
            </div>
        </td>
        <td class="DatatdLeftnMiddle">
            <div class="text-box.multi-line">
                <%:Html.TextBoxFor(m1 => m1.line2, new Dictionary<string, object>() { { "id", "txtAddressLine2" },{"style","width:180px;height:20px" }})%>
                <%:Html.ValidationMessageFor(m1 => m1.line2)%>
            </div>
        </td>
    </tr>
    <tr>
        <td class="editor-label">
            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
        </td>
        <td>
            <%:Html.TextBoxFor(m1 => m1.city, new { style = "width:180px;" })%>
            <%:Html.ValidationMessageFor(m1 => m1.city)%>
        </td>
    </tr>
    <tr>
        <td class="editor-label">
            <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
        </td>
        <td>
            <%:Html.TextBoxFor(m1 => m1.state, new { style = "width:180px;" })%>
            <%:Html.ValidationMessageFor(m1 => m1.state)%>
        </td>
    </tr>
    <tr>
        <td class="editor-label">
            <asp:Label ID="lblConutry" runat="server" Text="Country"></asp:Label>
        </td>
        <td>
            <%:Html.TextBoxFor(m1 => m1.country, new { style = "width:180px;" })%>
            <%:Html.ValidationMessageFor(m1 => m1.country)%>
        </td>
    </tr>
    <tr>
        <td class="editor-label">
            <asp:Label ID="lblZip" runat="server" Text="Zip"></asp:Label>
        </td>
        <td>
            <%:Html.TextBoxFor(m1 => m1.zip, new { style = "width:180px;" })%>
            <%:Html.ValidationMessageFor(m1 => m1.zip)%>
        </td>
    </tr>
    
</table>
