<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/AgencyManagemntMasterPage.Master"
    Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.Models.WcfAppService.localAgencyContact>" %>

<%@ Register Src="~/Views/UserControls/AddressView.ascx" TagName="Address" TagPrefix="cc1" %>
<%@ Register Src="~/Views/UserControls/NameView.ascx" TagName="Name" TagPrefix="cc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Add/UpdateAgencyContact
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        <%: ViewBag.Message.ToString() %></h3>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <%if (ViewData["Messages"] != null)
      {%>
    <span style="color: red">
        <%: ViewData["Messages"].ToString()%></span>
    <%} %>
    <div>
        <fieldset>
            <table class="body">
                <tr>
                    <td class="DatatdLeftnMiddle" width="130px">
                        <div class="editor-label">
                            <asp:Label ID="lblAgencyContactName" runat="server" Text="Name"></asp:Label>
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle" style="padding-left: 0px">
                    <%:Html.HiddenFor(m1 => m1.AppID) %>
                        <table class="body" style="width: 200px">
                            <tr>
                                <td style="width: 100px" align="left">
                                    <%:Html.TextBoxFor(m1 => m1.FirstName, new { style = "width:220px;" })%>
                                    <%:Html.ValidationMessageFor(m1 => m1.FirstName)%>
                                </td>
                                <td style="width: 50px">
                                    <%:Html.TextBoxFor(m1 => m1.MiddleName, new { style = "width:10px;" })%>
                                    <%:Html.ValidationMessageFor(m1 => m1.MiddleName)%>
                                </td>
                                <td style="width: 100px">
                                    <%:Html.TextBoxFor(m1 => m1.LastName, new { style = "width:200px;" })%>
                                    <%:Html.ValidationMessageFor(m1 => m1.LastName)%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%--                <tr>
                    <td class="DatatdLeftnTop" width="130px">
                        <div class="editor-label">
                            <asp:Label ID="Label1" runat="server" Text="User ID"></asp:Label>
                        </div>
                    </td>
                    <td class="DatatdLeftnTop">
                        <div class="editor-field">
                            <%: Html.TextBoxFor(m => m.AppID, new { style = "width:450px;", disabled = "disabled" })%>
                            <%: Html.ValidationMessageFor(m => m.AppID)%>
                        </div>
                    </td>
                </tr>--%>
              <%--  USER = 10, ADMIN = 20, SUPERADMIN = 30--%>
                <tr>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-label">
                            Role
                        </div>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <div class="editor-field">
                            <%--  <%: Html.TextBoxFor(m => m.RoleStr, new { style = "width:450px;", disabled = "disabled" })%>--%>
                <%--&nbsp;<%: Html.TextBoxFor(m => m.RoleStr, new { style = "width:450px;" })%>--%>
                 &nbsp;<%: Html.DropDownListFor(m1 => Model.Role, new SelectList(new List<Object> { new { value = 10, text = "User" }, new { value = 20, text = "Admin" }, new { value = 30, text = "Super Admin" } }, "value", "text"), new { style = "width:456px;" })%>

                <%:Html.ValidationMessageFor(m => m.Rolestr)%>
                </div> </td> </tr>

               
                <tr>
                    <td class="DatatdLeftnMiddle">
                        <asp:Label ID="lblPhone1" runat="server" Text="Phone #"></asp:Label>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        &nbsp;<%:Html.TextBoxFor(m1 => m1.Phones[0].Number, new { style = "width:450px;" })%>
                        <%:Html.ValidationMessageFor(m1 => m1.Phones[0].Number)%>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle">
                        <asp:Label ID="Label2" runat="server" Text="Fax #"></asp:Label>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        &nbsp;<%:Html.TextBoxFor(m1 => m1.Faxes[0].Number, new { style = "width:450px;" })%>
                        <%:Html.ValidationMessageFor(m1 => m1.Faxes[0].Number)%>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle">
                        <asp:Label ID="lblEmail1" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <% if (ViewBag.Message.ToString() == "Update User")
                       { %>
                       &nbsp;<%= Html.Label("ID", Model.Emails[0].EmailAddress)%>
                        <%:Html.HiddenFor(m1 => m1.Emails[0].EmailAddress)%>
                       <%}%>
                       <%else%>
                       <%{%>
                        &nbsp;<%:Html.TextBoxFor(m1 => m1.Emails[0].EmailAddress, new { style = "width:450px;" })%>
                        <%:Html.ValidationMessageFor(m1 => m1.Emails[0].EmailAddress)%>
                        <%}%>
                    </td>
                </tr>
                <tr>
                    <td class="DatatdLeftnMiddle">
                    </td>
                    <td class="DatatdLeftnMiddle">
                        <p class="ButtonBar">
                            <input type="submit" value="Submit" name="UpdateAgencyContact"  />
                          <%--  &nbsp;<input type="submit" value="Reset Password" />--%>
                        </p>
                       
                    </td>
                </tr>
            </table>
        </fieldset>
    </div>
    <% } %>
</asp:Content>
