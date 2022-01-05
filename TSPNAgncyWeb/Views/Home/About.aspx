<%@ Page Language="C#" MasterPageFile="~/Views/Shared/MasterPageWithoutLeftPane.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>About</h3>  
    <p>
        If you have questions or issues please contact SummerCamp_DBHIDS@phila.gov
    </p>
</asp:Content>
