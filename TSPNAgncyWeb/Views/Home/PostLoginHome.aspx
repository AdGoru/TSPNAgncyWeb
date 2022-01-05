<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.Models.WcfAppService.localAgencyContact>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <table cellpadding="0" width="100%">
        <tr>
            <td width="70%" style="border: 1px solid #d4d4d4; padding: 10px" valign="top" align="left">
                <%if (ViewData["PostLogin"] != null)
                  {%>
                <span style="color: black">
                    <%string str = ViewData["PostLogin"].ToString(); %>
                    <%: @Html.Raw(str)%></span>
                <%} %>
                <%--<%: @Html.Raw(ViewBag.Message)%>--%>
                <%--<h3><%: ViewBag.Message %></h3>
                <br />
 		<br />
                Get the latest list of<a href="../PCamp/PreferredCampsList.pdf" target="_blank">Preferred Camps for 2012.</a> 
                <br />
                <br />
                <br />
                Download or print a copy of<a href="../PCamp/NPCampAgreementForm2012.pdf" target="_blank">Non Preferred Camp Agreement Form 2012.</a> 
                <br />--%>
            </td>
            <td>
                &nbsp;
            </td>
            <td width="29%" align="right" valign="top" style="border: 1px solid #d4d4d4">
                <img width="216px" height="400px" src="../Images/Collage1.gif" alt=" " />
            </td>
        </tr>
    </table>
</asp:Content>
