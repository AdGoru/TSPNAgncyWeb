<%@ Import Namespace=com.rti.tailspinnew.web.Helpers%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<com.rti.tailspinnew.web.Models.Camp>" %>

<table class="body" align="left">
    <tr>
    <td>
    <div class="editor-field"> 
    Selected Camp:<%:Html.DisplayFor(m1 => Model.CampName)%>
    </div> 
    </td>
    <td>
    <div class="editor-field"> 
    <%:Html.DialogFormLink("Select", Url.Action("Camps"), "Select Camp", "CampContainer", Url.Action("SelectedCamp"))%>
    </div>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <div class="editor-field"> 
     Select Camp Name:<%:Html.DisplayFor(m1 => Model.CampName)%>
     </div> 
   </td>
    </tr>
    </table>