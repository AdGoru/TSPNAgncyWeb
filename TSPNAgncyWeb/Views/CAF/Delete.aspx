<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.web.Models.CAF>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>CAF</legend>

    <%--<div class="display-label">Address1</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Address1) %>
    </div>--%>

    <div class="display-label">DOB</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DOB) %>
    </div>

    <div class="display-label">encampFrom</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.encampFrom) %>
    </div>

    <div class="display-label">encampTo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.encampTo) %>
    </div>

    <div class="display-label">PerentSign</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.PerentSign) %>
    </div>

    <div class="display-label">Notes</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Notes) %>
    </div>

    <div class="display-label">amountApproved</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.amountApproved) %>
    </div>

    <div class="display-label">amountRequested</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.amountRequested) %>
    </div>

    <div class="display-label">totalCostofCamp</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.totalCostofCamp) %>
    </div>

    <div class="display-label">agencyName</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.agencyName) %>
    </div>

    <div class="display-label">campName</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.campName) %>
    </div>

    <div class="display-label">agencyContact</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.agencyContact) %>
    </div>

    <div class="display-label">campContact</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.campContact) %>
    </div>

    <div class="display-label">referralName</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.referralName) %>
    </div>

    <div class="display-label">CreatedBy</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CreatedBy) %>
    </div>

    <div class="display-label">CreatedOn</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.CreatedOn) %>
    </div>

    <div class="display-label">ApplicationDate</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.ApplicationDate) %>
    </div>

    <div class="display-label">Reason</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Reason) %>
    </div>

    <div class="display-label">membershipFee</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.membershipFee) %>
    </div>

    <div class="display-label">registrationFee</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.registrationFee) %>
    </div>

    <div class="display-label">perSessionFee</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.perSessionFee) %>
    </div>

    <div class="display-label">NumberofSessions</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NumberofSessions) %>
    </div>

    <div class="display-label">SessionType</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.SessionType) %>
    </div>

    <div class="display-label">tshirt</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tshirt) %>
    </div>

    <div class="display-label">Trips</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Trips) %>
    </div>

    <div class="display-label">Transportation</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Transportation) %>
    </div>

    <div class="display-label">Meals</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Meals) %>
    </div>

    <div class="display-label">beforeCare</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.beforeCare) %>
    </div>

    <div class="display-label">afterCare</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.afterCare) %>
    </div>

    <div class="display-label">Other</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Other) %>
    </div>

    <div class="display-label">otherDesc</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.otherDesc) %>
    </div>

    <div class="display-label">Title</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Title) %>
    </div>

    <div class="display-label">titleDate</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.titleDate) %>
    </div>

    <div class="display-label">campSign</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.campSign) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "CAFList") %>
    </p>
<% } %>

</asp:Content>

