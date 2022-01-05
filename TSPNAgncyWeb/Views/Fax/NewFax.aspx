<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.web.Models.AttachFiles>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    NewFax
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>NewFax</h2>
<% using (Html.BeginForm())
   { %>
    <%: Html.ValidationSummary(true)%>
    <table style="width: 100%;">
        <tr>
            <td>
                <div class="editor-label">
                <%:Html.Label("lblFaxNo", "File Name")%>
                </div>                
            </td>
            <td>
            <div class="editor-field">
                <%:Html.TextBoxFor(m1 => Model.FileName)%>
                <%:Html.ValidationMessageFor(m1 => Model.FileName)%>
                </div>
            </td>
            </tr>
            <tr>
            <td colspan="2">
            <%Html.RenderPartial("~/Views/CAF/AttachFiles.ascx");%>
            </td>
            </tr>
            <tr>
            <td>
            <%:Html.ActionLink("Show PDF", "ShowPDF","Fax") %>
            </td>
            </tr>
             <%--<tr>
            <td>
                <div class="editor-label">
                <%:Html.Label("lblFaxId","Fax ID")%>
                </div>
                
            </td>
            <td>
            <div class="editor-field">
                <%:Html.TextBoxFor(m1=>Model.ID)%>
                <%:Html.ValidationMessageFor(m1=>Model.)%>
                </div>
            </td>
            </tr>
         <tr>
            <td>
                <div class="editor-label">
                <%:Html.Label("lblFaxId","Fax ID")%>
                </div>
                
            </td>
            <td>
            <div class="editor-field">
                <%:Html.TextBoxFor(m1=>Model.ID)%>
                <%:Html.ValidationMessageFor(m1=>Model.ID)%>
                </div>
            </td>
            </tr>
        <tr>
            <td>
                <div class="editor-label">
                <%:Html.Label("lblFaxId","Fax ID")%>
                </div>
                
            </td>
            <td>
            <div class="editor-field">
                <%:Html.TextBoxFor(m1=>Model.ID)%>
                <%:Html.ValidationMessageFor(m1=>Model.ID)%>
                </div>
            </td>
            </tr>--%>
    </table>
    <%}%>
</asp:Content>


