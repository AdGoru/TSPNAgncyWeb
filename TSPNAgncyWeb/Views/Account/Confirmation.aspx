<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterPageWithoutLeftPane.Master"
    Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.Models.WcfAppService.localAgencyContact>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    My Profile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".ButtonBar").find('input[type="submit"]').click(function (e) {
                $("#hdnCtrlId").val($(this).val());
                return true;
            });
        });
    </script>
    <h3>
        <%: ViewBag.Message %>        
    </h3>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <span style="color: red">
        <%: ViewData["Messages"].ToString()%></span>
    <div>
        <fieldset>

            <table class="ui-accordion">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" style=" font-weight:"bold">
                    
                            <b><asp:Label ID="lblAgencyContactName" runat="server" Text="Do you really want to delete the user - "></asp:Label> &nbsp;
                            <%:Html.Label("Do you really want to delete the user - ", Model.FirstName + " " + Model.LastName)%>
                            <asp:Label ID="Label1" runat="server" Text="?"></asp:Label></b>
                        </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <p class="ButtonBar">
                            <%:Html.HiddenFor(m1 => m1.AppID) %>
                            <%:Html.HiddenFor(m1 => m1.Emails[0].EmailAddress) %>
                            <input type="submit" value="Proceed" name="DeleteProfile"/>
                            &nbsp;<input type="submit" value="Cancel" name="CancelDelete"/>
                        </p></td>
            </tr>
        </table>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
