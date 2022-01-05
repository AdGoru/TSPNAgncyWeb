<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.web.Models.CAF>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>CAF</legend>

        <%: Html.HiddenFor(model => model.Id) %>

        <%--<div class="editor-label">
            <%: Html.LabelFor(model => model.Address1) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Address1) %>
            <%: Html.ValidationMessageFor(model => model.Address1) %>
        </div>--%>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DOB) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DOB) %>
            <%: Html.ValidationMessageFor(model => model.DOB) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.encampFrom) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.encampFrom) %>
            <%: Html.ValidationMessageFor(model => model.encampFrom) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.encampTo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.encampTo) %>
            <%: Html.ValidationMessageFor(model => model.encampTo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.PerentSign) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.PerentSign) %>
            <%: Html.ValidationMessageFor(model => model.PerentSign) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Notes) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Notes) %>
            <%: Html.ValidationMessageFor(model => model.Notes) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.amountApproved) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.amountApproved) %>
            <%: Html.ValidationMessageFor(model => model.amountApproved) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.amountRequested) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.amountRequested) %>
            <%: Html.ValidationMessageFor(model => model.amountRequested) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.totalCostofCamp) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.totalCostofCamp) %>
            <%: Html.ValidationMessageFor(model => model.totalCostofCamp) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.agencyName) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.agencyName) %>
            <%: Html.ValidationMessageFor(model => model.agencyName) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.campName) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.campName) %>
            <%: Html.ValidationMessageFor(model => model.campName) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.agencyContact) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.agencyContact) %>
            <%: Html.ValidationMessageFor(model => model.agencyContact) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.campContact) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.campContact) %>
            <%: Html.ValidationMessageFor(model => model.campContact) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.referralName) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.referralName) %>
            <%: Html.ValidationMessageFor(model => model.referralName) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CreatedBy) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CreatedBy) %>
            <%: Html.ValidationMessageFor(model => model.CreatedBy) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.CreatedOn) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.CreatedOn) %>
            <%: Html.ValidationMessageFor(model => model.CreatedOn) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ApplicationDate) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ApplicationDate) %>
            <%: Html.ValidationMessageFor(model => model.ApplicationDate) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Reason) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Reason) %>
            <%: Html.ValidationMessageFor(model => model.Reason) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.membershipFee) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.membershipFee) %>
            <%: Html.ValidationMessageFor(model => model.membershipFee) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.registrationFee) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.registrationFee) %>
            <%: Html.ValidationMessageFor(model => model.registrationFee) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.perSessionFee) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.perSessionFee) %>
            <%: Html.ValidationMessageFor(model => model.perSessionFee) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NumberofSessions) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NumberofSessions) %>
            <%: Html.ValidationMessageFor(model => model.NumberofSessions) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.SessionType) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.SessionType) %>
            <%: Html.ValidationMessageFor(model => model.SessionType) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.tshirt) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.tshirt) %>
            <%: Html.ValidationMessageFor(model => model.tshirt) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Trips) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Trips) %>
            <%: Html.ValidationMessageFor(model => model.Trips) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Transportation) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Transportation) %>
            <%: Html.ValidationMessageFor(model => model.Transportation) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Meals) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Meals) %>
            <%: Html.ValidationMessageFor(model => model.Meals) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.beforeCare) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.beforeCare) %>
            <%: Html.ValidationMessageFor(model => model.beforeCare) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.afterCare) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.afterCare) %>
            <%: Html.ValidationMessageFor(model => model.afterCare) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Other) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Other) %>
            <%: Html.ValidationMessageFor(model => model.Other) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.otherDesc) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.otherDesc) %>
            <%: Html.ValidationMessageFor(model => model.otherDesc) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Title) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Title) %>
            <%: Html.ValidationMessageFor(model => model.Title) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.titleDate) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.titleDate) %>
            <%: Html.ValidationMessageFor(model => model.titleDate) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.campSign) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.campSign) %>
            <%: Html.ValidationMessageFor(model => model.campSign) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "CAFList") %>
</div>

</asp:Content>

