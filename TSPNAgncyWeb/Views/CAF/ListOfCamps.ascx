<%--<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<com.rti.tailspinnew.Models.WcfAppService.localCampListItem>>" %>--%>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<com.rti.tailspinnew.web.Models.PagedCAMPList>" %>
<%@ Import Namespace="com.rti.tailspinnew.web.Helpers" %>
<%@ Import Namespace="com.rti.tailspinnew.web.Models" %>
<%--<% using (Html.BeginForm("ListOfCamps", "CAF", FormMethod.Post, new { enctype = "multipart/form-data" }))--%>
<% using (Ajax.BeginForm("ListOfCamps", "CAF", FormMethod.Post, new AjaxOptions { HttpMethod = "POST"}))
   { %>
<%: Html.ValidationSummary(true) %>
<%--<%: Html.ActionLink("Create New", "NewCamp","CAF") %>--%>
<div id="CampContainer">
<%--  --%>
<%--  --%>
<%--The following statement is remarked to remove the capacity of the agencies to add new camps.
Change made 5/16/2013 by John Gogel  --%>
    <%--<%:Html.DialogFormLink("Create New", Url.Action("NewCamp"), "New Camp", "CampContainer", Url.Action("SelectedCamp"))%>--%>

<%--<a href="mailto:summercamp@dbhids.org?cc=prakashgovind@realtechinc.com&subject=New Camp Request&body=Please%20specify:%20Camp%20name,%20address,%20phone%20and%20contact%20info%20for%20DBH%20approval.">New Camp</a>--%>
</div>
<script type="text/javascript">
    function SelectedCamp(cmpid) {
        //alert(cmpid);
        var ttl = $("#hdnTitle" + cmpid).val();
        var aid = $("#hdnAppId" + cmpid).val();
        var adrs = $("#hdnAddress" + cmpid).val();
        var prf = $("#hdnisPreferred" + cmpid).val();
        
        $("#Camp").val(ttl);
        $("#CampSiteAppID").val(aid);
        $(".camptitle").html(ttl + ", ");
        $(".campaddress").html(adrs);
        $(".iscamppreferred").valueOf(prf);
        $(".SelectCamp").dialog('close');
    }
</script>
<script type="text/javascript">
    function searchOnTable() {
        inputVal = $(".txtSearchCamp").val();
        //alert(inputVal);
        var table = $('.tblCampsSearch');
        table.find('tr').each(function (index, row) {
            var allCells = $(row).find('td');
            if (allCells.length > 0) {
                var found = false;
                allCells.each(function (index, td) {
                    var regExp = new RegExp(inputVal, 'i');
                    if (regExp.test($(td).text())) {
                        found = true;
                        return false;
                    }
                });
                if (found == true) $(row).show(); else $(row).hide();
            }
        });
        return false;
    }

    function clearSearch(inputVal) {
        var table = $('.tblCampsSearch');
        table.find('tr').each(function (index, row) {
            var allCells = $(row).find('td');
            if (allCells.length > 0) {
                var found = false;
                allCells.each(function (index, td) {
                    $(row).show();
                });
                //if (found == true) $(row).show(); else $(row).hide();
            }
        });
    }

</script>

<div style=" padding-bottom:10px;">
    <table>
        <tr>
            <td>
                <input type="text" style="width:450px" class="txtSearchCamp" id="txtSearchCamp" name="txtSearchCampff" value = "<%: (ViewData["searchtext"])%>" />
            </td>
            <td>
                <input type = "submit" name = "search1" value = "Search" />
                <%--<a class="link btnSearchCamp" style="float: left;" id="btnSearchCamp" onclick="searchOnTable();" href="javascript:void(0);">Search</a>--%>
            </td>
            <td>
                <%--<a class="link btnCancSearchCamp" style="float: left;" id="btnCancSearchCamp" onclick="clearSearch();" href="javascript:void(0);">Cancel Search</a>--%>
            </td>
        </tr>
    </table>
</div>

<div id="loc" style="z-index: 5000">
    <table id="tblCampsSearch" width="653px" border="0" cellpadding="0" cellspacing="0" class="grid tblCampsSearch">
        <tr>
            <th align="left">Camp Name</th>
            <th align="left">Address</th>
            <%--<th align="left">Status</th>--%>
            <th>&nbsp;</th>
        </tr>
        <% foreach (var item in Model.CampList)
           { %>

        <%if (item.Status != com.rti.appcommon.CAMPSITE_STATE.NOT_APPROVED)
                  { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.Title) %>
                <%---<%: Html.DisplayFor(modelItem => item.Statusstr) %>--%>
                <%: Html.Hidden("hdnTitle" + item.AppID, item.Title)%>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Address) %><br />
                <%: Html.Hidden("hdn"+item.AppID, item.AppID)%>
                <%: Html.Hidden("hdnAppId" + item.AppID, item.AppID)%>
                <%: Html.Hidden("hdnPreferred" + item.AppID, item.IsPreferred)%>
                <%: Html.Hidden("hdnAddress" + item.AppID, item.Address)%>
                <%: Html.Hidden("hdnisPreferred" + item.AppID, item.IsPreferred) %>
            </td>
            <%--<td align="center">--%>
                <%--SW 08May12> Added stars for non preferred, not eligible and new camps--%>
                <%--<% if (item.IsPreferred)--%> <%--SW 08May12> replaced with the below condition--%>
               <%-- <% if (item.Status == com.rti.appcommon.CAMPSITE_STATE.PREFERRED)
                   { %>
                <img src="../../Images/mmstar.png" height="19px" width="18px" alt="Preferred Camp" />
                <% }%>--%>
                <%--<% else if (item.Status == com.rti.appcommon.CAMPSITE_STATE.NONPREFERRED)  //SW 01242013 nonreferred state is removed
                   { %>
                <img src="../../Images/mmstarBlue19x17.png" height="19px" width="18px" alt="Non-Preferred Camp" />
                <% }%>   --%>
                <%--<% else if (item.Status == com.rti.appcommon.CAMPSITE_STATE.NOTELIGIBLE)
                   { %>
                <img src="../../Images/mmRedX14x18.png" height="19px" width="18px" alt="Camp not eligible for selection" />
                <% }%>          
                <% else if (item.Status == com.rti.appcommon.CAMPSITE_STATE.NEW)
                   { %>
                <img src="../../Images/mmstarWhite21x18.png" height="19px" width="18px" alt="New Camp" />
                <% }%>           
                 <% else
                   { %>
                <img src="" height="1px" width="1px" alt=" " />
                <% } %>       
                </td>         --%>
            <td>
              <%--  <%if (item.Status != com.rti.appcommon.CAMPSITE_STATE.NOT_APPROVED)
                  { %>--%>
                <a href="javascript:void(0);" onclick="SelectedCamp('<%= item.AppID %>')">Select</a>
              <%--  <%} %>&nbsp;--%>
            </td>
        </tr>

        <%} %>&nbsp;

        <% } %>
        <%--<tr>
            <td colspan="5">
                <div class="right">
                    <input type="submit" value="Save" id="btnSave" style="float: left" />
                </div>
            </td>
        </tr>--%>
    </table>
    <div class="pager">
                        <% if (Model != null && Model.CampList.Count() > 0 ){ %>
		                      <%:  Html.Pager(Model.PageNumber, Model.PageSize, Model.TotalRows, new {searchtext = ViewBag.SearchTxt, sort = ViewBag.SortColumn, sortDir = ViewBag.sortDirection  })%>
                        <%  } %>
</div>
</div>

<%} %>