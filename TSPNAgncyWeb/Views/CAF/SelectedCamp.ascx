<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<com.rti.tailspinnew.Models.WcfAppService.localCampSite>" %>
<%@ Import Namespace="com.rti.tailspinnew.web.Helpers" %>
<fieldset style="width: 468px">
    <%-- <legend>Camp Details</legend>--%>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".ui-dialog-titlebar-close").click(function () {
                alert("123");
                if (Right.style.visibility == "hidden") {
                    Right.style.visibility = "visible";
                    Left.setAttribute("style", "width:50%");
                    Right.setAttribute("style", "width:49%");
                }
            });
        });
    </script>
    <table class="body" align="left" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td>             
                <div style=" width:300px">
                  <span id="spnTitle" class="camptitle">
                   <%: Html.DisplayFor(modelItem => Model.SiteName)%>
                  </span>
                  <span id="spnAddress" class="campaddress">
                    <%: Html.DisplayFor(modelItem => Model.Address)%> <%-- SW 02042013> showing address which will have all these including zip.  --%>
                    <%--<%: Html.DisplayFor(modelItem => Model.AppID)%><br />--%>  
                   <%-- <%: Html.DisplayFor(modelItem => Model.Line2)%><br />  
                    <%: Html.DisplayFor(modelItem => Model.City )%>,  <%: Html.DisplayFor(modelItem => Model.State)%>   <br />
                    <%: Html.DisplayFor(modelItem => Model.Country)%> --%> 
                    </span>
                </div>                
            </td>
            <td>
                <%--<span id="Span1" class="iscamppreferred">
                    <% if (Model.Status == (int)com.rti.appcommon.CAMPSITE_STATE.PREFERRED)
                       { %>
                    <img src="../../Images/mmstarBig.png" height="41px" width="36px" alt="Preferred camp"/>
                    <% } else if (Model.Status == (int)com.rti.appcommon.CAMPSITE_STATE.NONPREFERRED)   //SW 01242013 nonreferred state is removed
                       { %>
                    <img src="../../Images/mmstarBlue47x43.png" height="41px" width="36px" alt="Non-Preferred Camp"/>
                    <% } else if (Model.Status == (int)com.rti.appcommon.CAMPSITE_STATE.NEW)
                       { %>
                    <img src="../../Images/mmstarWhite49x44.png" height="41px" width="36px" alt="New Camp"/>
                    <% }else { %>
                        <img src="" height="1px" width="1px" alt=" "/>
                    <% } %>
                 </span>--%>
            </td>
            <td>
                <%:Html.DialogFormLink("Select Camp", Url.Action("ListOfCamps"), "Select Camp", "CampContainer", Url.Action("SelectedCamp"))%>
            </td>
    </table>
</fieldset>
