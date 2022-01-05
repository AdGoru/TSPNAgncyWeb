<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<asp:GridView ID="dgList" runat="server" >
<Columns>
<asp:BoundField HeaderText="ID" />
<asp:BoundField HeaderText="No" />
</Columns>
</asp:GridView>
