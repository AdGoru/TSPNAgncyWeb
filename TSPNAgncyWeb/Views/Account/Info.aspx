<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterPage.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Info
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<table cellpadding="0" cellspacing="0" width="100%" align="center">
        <tr>
            <td valign="middle" align="center" style="height:400px">
                <h2>
                    <b><%: @Html.Raw(ViewBag.Message) %></b>
                </h2>
            </td>
        </tr>
    </table>
</asp:Content>

