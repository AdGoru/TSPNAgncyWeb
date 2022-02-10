<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterPageWithoutLeftPane.Master"
    Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.Models.WcfAppService.localCAF>" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>
<script runat="server">
    public MvcHtmlString Truncate(string input, int length)
    {
        if (input != null)
        {
            if (input.Length <= length)
            {
                return MvcHtmlString.Create(input);
            }
            else
            {
                return MvcHtmlString.Create(input.Substring(0, length) + "<text>...</text>");
            }
        }
        return MvcHtmlString.Empty;
    }   
   
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    TCAF
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery-ui-1.8.16.custom.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery-ui-1.6.2.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.ui.datepicker-en-GB.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowPDF(pdfid) {
            var url = '<%: Request.Url.AbsoluteUri %>';
            //alert(url);
            url = url.substring(0, url.toLowerCase().lastIndexOf('/tcaf')) + "/PDFFile/" + pdfid;
           // alert(url);
            $("#ancViewPDF").attr("href", url);
            pdfhtl = '<embed id="pdfcntrl" src="' + url + '" type="application/pdf" wmode="transparent" style="z-index:10" width="450px" height="660px"></embed>'
          //  alert(pdfhtl);
            $("#divPDFContainer").html(pdfhtl);
        }

        $(function () {
            $("#tabs").tabs();
        });

        function parseDecimal(d, zeros, trunc) {
            d = d.replace(/ /g, "");
            while (d.indexOf(".") != d.lastIndexOf("."))
                d = d.replace(/\./, "");
            if (typeof zeros == 'undefined' || zeros == "") {
                return parseFloat(d);
            }
            else {
                var mult = Math.pow(10, zeros);
                if (typeof trunc == 'undefined' || (trunc) == false)
                    return parseFloat(Math.round(d * mult) / mult);
                else
                    return parseFloat(Math.floor(d * mult) / mult);
            }
        }
        function getvalu(txval) {
            if (txval == "" || isNaN(txval)) {
                return 0;
            } else {
                return parseDecimal(txval, 2);
            }

        }
        function getvaluInt(txval) {
            if (txval == "" || isNaN(txval)) {
                return 0;
            } else {
                return parseInt(txval);
            }
        }
        function hideShowPerSessionFee(ths) {
            if ($(ths).val() == 3) {
                document.getElementById('entireCampFee').innerHTML = "Entire Camp fee"
                $("#trEntireCampFee").show();
                calculateTotalCost();
                //start added for clear NumberOfsessions field
                document.getElementById('NumberOfsessions').value = 0;
                $("#errNumberOfsessions").hide();
                //End
                $("#trNoOfWeeks").hide();
            }

            if ($(ths).val() == 1) {
                document.getElementById('entireCampFee').innerHTML = "Fee per Week"
                document.getElementById('numberOf').innerHTML = "Number of Weeks"
                calculateTotalCost();
                $("#errNumberOfsessions").show();
                $("#trNoOfWeeks").show();
            }
            if ($(ths).val() == 2) {
                document.getElementById('entireCampFee').innerHTML = "Fee per Month"
                document.getElementById('numberOf').innerHTML = "Number of Months"
                calculateTotalCost();
                $("#errNumberOfsessions").show();
                $("#trNoOfWeeks").show();
            }

            if ($(ths).val() == 4) {
                document.getElementById('entireCampFee').innerHTML = "Fee per Session"
                document.getElementById('numberOf').innerHTML = "Number of Sessions"
                calculateTotalCost();
                $("#errNumberOfsessions").show();
                $("#trNoOfWeeks").show();
            }
        }

        function alertforPrint() {
            alert("Please enter first and lastname for the child, and save the application before printing");
        }

        function calculateTotalCost() {
            if ($("#SessionType").val() == 3) {
                var tfs = getvalu($("#MembershipFee").val()) + getvalu($("#RegistrationFee").val()) +
                     getvalu($("#Tshirt").val()) + getvalu($("#Trips").val()) + getvalu($("#Transportation").val()) +
                      getvalu($("#Meals").val()) + getvalu($("#BeforeCare").val()) + getvalu($("#AfterCare").val()) +
                       getvalu($("#Other").val());
                tfs = tfs + getvalu($("#PerSessionFee").val());
                var tmp = parseDecimal(tfs.toString(), 2);
                $("#txtTotalFee").val(tmp);
            }
            else {
                var tfss = getvalu($("#MembershipFee").val()) + getvalu($("#RegistrationFee").val()) +
                     getvalu($("#Tshirt").val()) + getvalu($("#Trips").val()) + getvalu($("#Transportation").val())
                     + getvalu($("#Meals").val()) + getvalu($("#BeforeCare").val()) + getvalu($("#AfterCare").val())
                      + getvalu($("#Other").val());
                tfss = tfss + (getvalu($("#PerSessionFee").val()) * getvaluInt($("#NumberOfsessions").val()));
                var tmp = parseDecimal(tfss.toString(), 2);
                $("#txtTotalFee").val(tmp);
            }
        }

        $(document).ready(function () {
            $("#ApplicantRec_DOB").datepicker();
            $("#EncampmentDateFrom1").datepicker();
            $("#EncampmentDateTo1").datepicker();
            $("#EncampmentDateFrom2").datepicker();
            $("#EncampmentDateTo2").datepicker();
            $("#EncampmentDateFrom3").datepicker();
            $("#EncampmentDateTo3").datepicker();
            $("#EncampmentDateFrom4").datepicker();
            $("#EncampmentDateTo4").datepicker();
            if ($("#SessionType").val() == 3) {
                document.getElementById('entireCampFee').innerHTML = "Entire Camp fee"
                $("#trEntireCampFee").show();
                $("#trNoOfWeeks").hide();
            }
            if ($("#SessionType").val() == 1) {
                document.getElementById('entireCampFee').innerHTML = "Fee per Week"
                document.getElementById('numberOf').innerHTML = "Number of Weeks"
                $("#trNoOfWeeks").show();
            }
            if ($("#SessionType").val() == 2) {
                document.getElementById('entireCampFee').innerHTML = "Fee per Month"
                document.getElementById('numberOf').innerHTML = "Number of Months"
                $("#trNoOfWeeks").show();
            }
            if ($("#SessionType").val() == 4) {
                document.getElementById('entireCampFee').innerHTML = "Fee per Session"
                document.getElementById('numberOf').innerHTML = "Number of Sessions"
                $("#trNoOfWeeks").show();
            }
        });

        $(document).ready(function () {
            $("#tabs-2").find('input[type="text"]').blur(function (event) {
                calculateTotalCost();
            });

            $(".signin").click(function (e) {
                e.preventDefault();
                $("fieldset#signin_menu").toggle();
                $(".signin").toggleClass("menu-open");
            });

            $(".ButtonBar").find('input[type="submit"]').click(function (e) {
			
				if($(this).attr('name') == "SaveTcaf"){ 
					var strval = "";
				
					if ( $("#ChildFirstName").val() == '' ||
					$("#ChildLastName").val() == '' ||
					$("#ChildDOB").val() == '' ||
					$("#AxisI").val() == '')
						strval = strval + "<li>Child Info: Firstname, Lastname, DOB, Axis I</li>";
					
					if (
					$("#ParentFirstName").val() == '' ||
					$("#ParentLastName").val() == '' ||
					$("#txtAddress1").val() == '' ||
					$("#ChildCity").val() == '' ||
					$("#ChildState").val() == '' ||
					$("#ChildZip").val() == '' ||
					$("#ChildPhone").val() == '')
						strval = strval + "<li>Parent Info: Firstname, Lastname, Address, City, State, Zip, Phone</li>";
					
					if(
					$("#ReferralFirstName").val() == '' ||
					$("#ReferralLastName").val() == '' ||
					$("#ReferralOrganization").val() == '' ||
					$("#ReferralLine1").val() == '' ||
					$("#ReferralCity").val() == '' ||
					$("#ReferralState").val() == '' ||
					$("#ReferralZip").val() == '' ||
					$("#ReferralPhone").val() == '' )
						strval = strval + "<li>Referral Info: Firstname, Lastname, Organization, Address, City, State, Zip, Phone</li>";
						
					if(strval != ''){
						if($(".validation-summary-errors").length > 0){
							strval = "<ul><li>The following fields are mandatory to Save: </li>" + strval + "</ul>";
							$(".validation-summary-errors").html(strval);
						}
						else{
							strval = "<div class='validation-summary-errors'><ul><li>The following fields are mandatory to Save: </li>" + strval + "</ul></div>";
							$("form").prepend(strval);
					
						}
						return false;
					}
					
                }

                // JHF - check this 1/2/20

				$("#hdnCtrlId").val($(this).val());
                return true;
            });

    //            // duplicate CAF issue 01/30/2019
    //            if ($(this).attr('name') == "SubmitTcaf")
    //            {                    
    //                if ($(".validation-summary-errors").length == 0)
    //                {  
    //                   $(this).val('Please wait...');
    //                   $(this).attr("disabled", "disabled");
    //                }
    //            }
				//$("#hdnCtrlId").val($(this).val());
    //            return true;
    //        });



            $("fieldset#signin_menu").mouseup(function () {
                return false
            });
            $(document).mouseup(function (e) {
                if ($(e.target).parent("a.signin").length == 0) {
                    $(".signin").removeClass("menu-open");
                    $("fieldset#signin_menu").hide();
                }
            });

			
            $(".links").click(function (e) {
                e.preventDefault();
                $("fieldset#signin_menu").toggle();
            });
            $(document).mouseup(function (e) {
                if ($(e.target).parent("a.link").length == 0) {
                    $("fieldset#signin_menu").hide();
                }
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".dialogLink").click(function () {
                var Left = document.getElementById("MainContent_tdLeftForm");
                var Right = document.getElementById('MainContent_tdRightPDF');
                if (Right.style.visibility == "visible" || Right.style.visibility == '') {
                    Left.setAttribute("style", "width:99%");
                    Right.setAttribute("style", "width:0%");
                    Right.style.visibility = "hidden";
                }
            });
        });
    </script>
    <%using (Html.BeginForm("TCAF", "CAF", FormMethod.Post, new { enctype = "multipart/form-data" }))
      {%>
    <%:Html.ValidationSummary(true)%>
    <%if (ViewData["Messages"] != null)
      {%>
    <span style="color: red">
        <%: ViewData["Messages"].ToString()%></span>
    <%} %>
    <table cellpadding="0" cellspacing="0" width="100%" border="0">
        <tr>
            <td>
                <div class="ButtonBar" style="padding-top: 10px; padding-bottom: 10px;">
                    <%--<input type="submit" value="Edit" id="btnEdit" name="SaveTcaf"/>&nbsp;--%>
                    <% bool hideSubmitFlag = false;%>
                    <%if (ViewData["HideSubmit"] != null)
                    {%>
                         <% hideSubmitFlag = Convert.ToBoolean(ViewData["HideSubmit"].ToString()); %>
                    <%} %>


                    <% if(Model.Status.ToLower() == "new" || Model.Status.ToLower() == "incomplete" || Model.Status == "") {%>
                    <input type="submit" value="Save" style="float: left"  name="SaveTcaf" />
                    <span style="float: left">&nbsp;&nbsp;</span>
                    <%if ((Model.Status.ToLower() == "new" || Model.Status == "") && hideSubmitFlag == true)
                      {%>
                    <input type="submit" value="Submit" style="float: left; visibility:hidden" name="SubmitTcaf" />
                    <%}%>
                    <%else{ %>
                    <input type="submit" value="Submit" style="float: left" name="SubmitTcaf" />
                    <%}}%>
                     <% else {%>
                     <input type="submit" value="Save" style="float: left; visibility:hidden" name="SaveTcaf" />
                     <span style="float: left">&nbsp;&nbsp;</span>
                     <input type="submit" value="Submit" style="float: left; visibility:hidden" name="SubmitTcaf" />
                     <%}%>
                    <span style="float: left">&nbsp;&nbsp;</span>
                    <% if (Model.Status.ToLower() == "new" || Model.Status.ToLower() == "incomplete" || Model.Status.ToLower() == "submitted" || Model.Status == "")
                       {%>
                    <input type="submit" value="Attach" style="float: left" name="AttachTcaf" />
                    <%}%>
                     <% else {%>
                     <input type="submit" value="Attach" style="float: left; visibility:hidden" name="AttachTcaf" />
                     <%}%>
                    <span style="float: left">&nbsp;&nbsp;</span>
                    <% if ((Url.RequestContext.RouteData.Values["id"].ToString().Length > 0) &&
                           (Url.RequestContext.RouteData.Values["id"].ToString() != "0") &&
                           (Model.ChildFirstName != "") && 
                           (Model.ChildLastName != "")) 
                       { %>
                    <a target="_blank" style="float: left" class="link" href="<%=Page.ResolveUrl("~/Print/PrintCAF/") + 
                    Url.RequestContext.RouteData.Values["id"] %>">Print</a>
                    <%--<input type="submit" value="Print" style="float: left" name="PrintTcaf" />--%>
                    <%}
                       else
                       { %>
                        <!-- <a style="float: left" class="link" href="javascript:void(0);">Print</a> -->
                             <a style="float: left" class="link" href="javascript:alertforPrint();">Print</a>
                    <%} %>
                    <span style="float: left">&nbsp;&nbsp;</span>
                    <%: Html.Hidden("hdnCtrlId", "")%>
                    <%: Html.Hidden("CafRefNum3", "")%>
                    <div class="links" style="padding-top: 6px;">
                        <a href="" style="color: White; text-decoration: none;">Print Letters</a>
                    </div>
                    <div id="container" style="top: 80px; left: 802px; position: absolute; z-index: 200;">
                        <fieldset id="signin_menu">
                            <ul class="ulbtns">
                                <%--<li>
                                    <%:Html.ActionLink("Approval/Denial", "PrintCAF", "Print",
                                    new { id = Url.RequestContext.RouteData.Values["id"].ToString() }, null)%></li>--%>
                                <li>
                                    <%:Html.ActionLink("Cover Sheet", "CoverSheet", "Print",
                                    new { id = Url.RequestContext.RouteData.Values["id"].ToString() }, null)%>
                                     <%--<a target="_blank"  href="<%=Page.ResolveUrl("~/Print/CoverSheet/") + 
                    Url.RequestContext.RouteData.Values["id"] %>">Cover Sheet</a>--%></li>
                                <li>
                                    <a target="_blank"  href="<%=Page.ResolveUrl("~/Print/CampMonitoringForm/") + 
                    Url.RequestContext.RouteData.Values["id"] %>">Camp Monitoring Form</a></li>
                            </ul>
                        </fieldset>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding="0" cellspacing="0" width="100%" border="0">
                    <tr>
                        <td id="tdLeftForm" runat="server" valign="top"  style ="width : 52%">
                            <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                <tr>
                                    <td style="padding-left: 8px; padding-right: 8px; padding-top: 6px; vertical-align: middle;
                                        height: 24px; background-color: #e5e5e5;">
                                        <div style="float: left;">
                                            <strong>Reference #:</strong>&nbsp;<%:Html.Label(ViewData["CafRefNum3"].ToString())%></div>
                                        <div style="float: right;">
                                            <strong>Status:</strong>&nbsp;<%:Html.Label(ViewData["CAFStatusT"].ToString())%></div>
                                        <span style="float: left">&nbsp;&nbsp;</span>
                                        <div>
                                            <a href="_blank" style="cursor: pointer;" onclick="javascript:return Toggle();">Show/Hide
                                                PDF</a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <div id="tabs" style="background-color: White; clear: both;width : 100%">
                                            <ul>
                                                <li><a href="#tabs-1" class="Content" style="font-weight: bold">Child Info</a></li>
                                                <li><a href="#tabs-2" class="Content" style="font-weight: bold">Camp & Fees</a></li>
                                                <li><a href="#tabs-3" class="Content" style="font-weight: bold">Referral Source</a></li>
                                                <li><a href="#tabs-4" class="Content" style="font-weight: bold">Attachments</a></li>
                                            </ul>
                                            <div id="tabs-1" class="Content">
                                                <table class="Content" align="left" width="100%">
                                                    <tr>
                                                        <td class="editor-label" style="width: 105px;">
                                                            Child's Name
                                                            <%:Html.HiddenFor(m1 => m1.AppID) %>
                                                            <%:Html.HiddenFor(m1 => m1.Reference) %>
                                                            <%:Html.HiddenFor(m1 => m1.Status) %>
                                                            <%:Html.HiddenFor(m1 => m1.CAFAppID) %>
                                                            <%:Html.HiddenFor(m1 => m1.CampSiteAppID) %>
                                                            <%:Html.HiddenFor(m1 => m1.CampContactAppID) %>
                                                            <%:Html.HiddenFor(m1 => m1.AgencyReferralAppID) %>
                                                        </td>
                                                        <td style="padding-left: 2px;">
                                                            <table class="body">
                                                                <tr>
                                                                    <td style="width: 90px" align="left">
                                                                        <%:Html.TextBoxFor(m1 => m1.ChildFirstName, new { style = "width:90px;" })%>
                                                                        <%:Html.ValidationMessageFor(m1 => m1.ChildFirstName)%>
                                                                    </td>
                                                                    <td style="width: 10px">
                                                                        <%:Html.TextBoxFor(m1 => m1.ChildMiddleName, new { style = "width:10px;" })%>
                                                                        <%:Html.ValidationMessageFor(m1 => m1.ChildMiddleName)%>
                                                                    </td>
                                                                    <td style="width: 130px">
                                                                        <%:Html.TextBoxFor(m1 => m1.ChildLastName, new { style = "width:130px;" })%>
                                                                        <%:Html.ValidationMessageFor(m1 => m1.ChildLastName)%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 105px;">
                                                            <div class="editor-label">
                                                                Child's DOB</div>
                                                        </td>
                                                        <td>
                                                            <div class="editor-field">
                                                                &nbsp;<%:Html.TextBoxFor(m1 => m1.ChildDOB , new { style = "width:250px;" })%><%:Html.ValidationMessageFor(m1 => m1.ChildDOB)%></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 105px;">
                                                            <div class="editor-label">
                                                                Primary</div>
                                                        </td>
                                                        <td>
                                                            <div class="editor-field">
                                                                &nbsp;<%:Html.TextBoxFor(m1 => m1.AxisI, new { style = "width:250px;" })%><%:Html.ValidationMessageFor(m1 => m1.AxisI)%></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 105px;">
                                                            <div class="editor-label">
                                                                Secondary
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="editor-field">
                                                                &nbsp;<%:Html.TextBoxFor(m1 => m1.AxisII, new { style = "width:250px;" })%><%:Html.ValidationMessageFor(m1 => m1.AxisII)%></div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="height: 20px">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2" style="padding-right: 24px;">
                                                            <fieldset>
                                                                <legend>Parent / Guardian Info</legend>
                                                                <table>
                                                                    <tr style="padding-left: 12px">
                                                                        <td style="width: 99px;">
                                                                            <div class="editor-label" style = "padding-left : 12px">
                                                                                <asp:Label ID="Label1" Text="Name" runat="server"></asp:Label>
                                                                            </div>
                                                                        </td>
                                                                        <td style = "padding-left : 1px">
                                                                            <%:Html.TextBoxFor(m1 => m1.ParentFirstName, new { style = "width:90px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => m1.ParentFirstName)%>
                                                                            
                                                                            <%:Html.TextBoxFor(m1 => m1.ParentMiddleName, new { style = "width:10px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => m1.ParentMiddleName)%>
                                                                            
                                                                            <%:Html.TextBoxFor(m1 => m1.ParentLastName, new { style = "width:130px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => m1.ParentLastName)%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" style="padding-left: 12px">
                                                                            <div class="editor-field" style="width: 85%">
                                                                                <table width="100%" class="Maintable">
                                                                                    <tr>
                                                                                        <td class="DatatdLeftnMiddle" style="width: 104px;">
                                                                                            <div class="editor-label">
                                                                                                <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                                                                            </div>
                                                                                        </td>
                                                                                        <td class="DatatdLeftnMiddle">
                                                                                            <div class="Address">
                                                                                                <%:Html.TextBoxFor(m1 =>  m1.ChildAddressLine1, new Dictionary<string, object>() { { "id", "txtAddress1" }, { "style", "width:250px;height:20px" } })%>
                                                                                                <%:Html.ValidationMessageFor(m1 => m1.ChildAddressLine1)%>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="editor-label" style="width: 104px;">
                                                                                            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <%:Html.TextBoxFor(m1 => m1.ChildCity, new {value="Philadelphia", style = "width:250px;" })%>
                                                                                            <%:Html.ValidationMessageFor(m1 => m1.ChildCity)%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="editor-label" style="width: 104px;">
                                                                                            <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <%:Html.TextBoxFor(m1 => m1.ChildState, new {value="PA", style = "width:250px;"})%>
                                                                                            <%:Html.ValidationMessageFor(m1 => m1.ChildState)%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="editor-label" style="width: 104px;">
                                                                                            <asp:Label ID="lblZip" runat="server" Text="Zip"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <%:Html.TextBoxFor(m1 => m1.ChildZip, new { style = "width:250px;" })%>
                                                                                            <%:Html.ValidationMessageFor(m1 => m1.ChildZip)%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="editor-label" style="width: 104px;">
                                                                                            <asp:Label ID="lblPhone1" runat="server" Text="Phone"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <%:Html.TextBoxFor(m1 => m1.ChildPhone, new { style = "width:250px;" })%>
                                                                                            <%:Html.ValidationMessageFor(m1 => m1.ChildPhone)%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="editor-label" style="width: 104px;">
                                                                                            <asp:Label ID="lblEmail1" runat="server" Text="Email"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <%:Html.TextBoxFor(m1 => m1.ChildEmail , new { style = "width:250px;" })%>
                                                                                            <%--<%: Html.TextBox("Email", "", new { style = "width:250px;" })%>--%>
                                                                                            <%:Html.ValidationMessageFor(m1 => m1.ChildEmail)%>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <div class="editor-label">
                                                                                                Has Parent/Guardian Signed Application?
                                                                                            </div>
                                                                                        </td>
                                                                                        <td align="left">
                                                                                            <div class="editor-field">
                                                                                                <%:Html.CheckBoxFor(m1 => m1.IsChildApplicationSigned , new Dictionary<string, object>() { { "id", "chkApplicationSigned" }, { "Text", "Application has been signed" } })%>
                                                                                                <%:Html.ValidationMessageFor(m1 => m1.IsChildApplicationSigned)%>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </fieldset>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div id="tabs-3" class="Content">
                                                <fieldset>
                                                    <table class="Content" align="left" width="100%">
                                                        <tr>
                                                            <td>
                                                                <div class="editor-label">
                                                                    Name
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <table class="body" style="width: 200px">
                                                                    <tr>
                                                                        <td style="width: 100px" align="left">
                                                                            <%:Html.TextBoxFor(m1 => m1.ReferralFirstName, new { style = "width:90px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => m1.ReferralFirstName)%>
                                                                        </td>
                                                                        <td style="width: 50px">
                                                                            <%:Html.TextBoxFor(m1 => m1.ReferralMiddleName, new { style = "width:10px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => m1.ReferralMiddleName)%>
                                                                        </td>
                                                                        <td style="width: 100px">
                                                                            <%:Html.TextBoxFor(m1 => m1.ReferralLastName, new { style = "width:130px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => m1.ReferralLastName)%>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="editor-label">
                                                                    Organization
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="editor-field">
                                                                    &nbsp;<%:Html.TextBoxFor(m1 => m1.ReferralOrganization, new { style = "width:250px;" })%><%:Html.ValidationMessageFor(m1 => m1.ReferralOrganization)%></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="105px">
                                                                <div class="editor-label">
                                                                    Address Line1
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="editor-field">
                                                                    &nbsp;<%:Html.TextBoxFor(m1 => m1.ReferralLine1, new { style = "width:250px;" })%><%:Html.ValidationMessageFor(m1 => m1.ReferralLine1)%></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="105px">
                                                                <div class="editor-label">
                                                                    Address Line2
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="editor-field">
                                                                    &nbsp;<%:Html.TextBoxFor(m1 => m1.ReferralLine2, new { style = "width:250px;" })%><%:Html.ValidationMessageFor(m1 => m1.ReferralLine2)%></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="105px">
                                                                <div class="editor-label">
                                                                    City
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="editor-field">
                                                                    &nbsp;<%:Html.TextBoxFor(m1 => m1.ReferralCity, new { style = "width:250px;", value = "Philadelphia" })%><%:Html.ValidationMessageFor(m1 => m1.ReferralCity)%></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="105px">
                                                                <div class="editor-label">
                                                                    State
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="editor-field">
                                                                    &nbsp;<%:Html.TextBoxFor(m1 => m1.ReferralState, new { style = "width:250px;", value = "PA" })%><%:Html.ValidationMessageFor(m1 => m1.ReferralState)%></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="105px">
                                                                <div class="editor-label">
                                                                    Zip
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="editor-field">
                                                                    &nbsp;<%:Html.TextBoxFor(m1 => m1.ReferralZip, new { style = "width:250px;" })%><%:Html.ValidationMessageFor(m1 => m1.ReferralZip)%></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="105px">
                                                                <div class="editor-label">
                                                                    Phone #
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="editor-field">
                                                                    &nbsp;<%:Html.TextBoxFor(m1 => Model.ReferralPhone, new { style = "width:250px;" })%><%:Html.ValidationMessageFor(m1 => Model.ReferralPhone)%></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="105px">
                                                                <div class="editor-label">
                                                                    Fax #
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="editor-field">
                                                                    &nbsp;<%:Html.TextBoxFor(m1 => Model.ReferralFax, new { style = "width:250px;" })%><%:Html.ValidationMessageFor(m1 => Model.ReferralFax)%></div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="105px">
                                                                <div class="editor-label">
                                                                    E-mail Address
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="editor-field">
                                                                    &nbsp;<%:Html.TextBoxFor(m1 => Model.ReferralEmailAddress, new { style = "width:250px;" })%><%:Html.ValidationMessageFor(m1 => Model.ReferralEmailAddress)%></div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </fieldset>
                                            </div>
                                            <div id="tabs-4" class="Content">
                                                <fieldset>
                                                    <legend>Attachments</legend>
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                                                        <tr align="left">
                                                            <th align="left" nowrap="nowrap">
                                                                Attachment Type
                                                            </th>
                                                            <th align="left" nowrap="nowrap">
                                                                File Name
                                                            </th>
                                                            <th align="left" nowrap="nowrap">
                                                                Attachment Date
                                                            </th>
                                                            <th>
                                                                &nbsp;
                                                            </th>
                                                        </tr>
                                                        <% if (Model != null && Model.IOBoxRecs != null)
                                                           {
                                                               foreach (com.rti.tailspinnew.Models.WcfAppService.localIOBox inboxRec in Model.IOBoxRecs)
                                                               {
                                                                   com.rti.appcommon.CommonDBAccess cda = new com.rti.appcommon.CommonDBAccess();
                                                                   if (inboxRec.AttachmentType != com.rti.appcommon.ATTACHMENT_TYPE.ACCOUNTS_LETTER.ToString())
                                                                   {%>
                                                        <tr>
                                                            <td>
                                                                <%: Html.DisplayFor(modelItem => inboxRec.Type)%>
                                                                <%: Html.Hidden("hdnAppID" + inboxRec.AppID)%>
                                                            </td>
                                                            <td>
                                                                <a href="javascript:void(0);" onclick="return ShowPDF('<%: inboxRec.DocAppIDs[0] %>')">
                                                                    <%: inboxRec.FileName%></a>
                                                                <%--<%:Html.ActionLink(inboxRec.FileName, "TCAF", new { id = inboxRec.AppID })%>--%>
                                                                <%--<%: Html.DisplayFor(modelItem => inboxRec.FileName)%>--%>
                                                            </td>
                                                            <td>
                                                                <%: Truncate(inboxRec.DateOfUploading, 25)%>
                                                            </td>
                                                            <td>
                                                                <%if ((inboxRec.sourceOrTargetType == (int)com.rti.tailspinnew.web.Models.Common.DOCUMENT_SOURCE.EMAIL ||
                                                                      inboxRec.sourceOrTargetType == (int)com.rti.tailspinnew.web.Models.Common.DOCUMENT_SOURCE.FAX ||
                                                                      inboxRec.sourceOrTargetType == (int)com.rti.tailspinnew.web.Models.Common.DOCUMENT_SOURCE.LOCAL ||
                                                                      inboxRec.sourceOrTargetType == (int)com.rti.tailspinnew.web.Models.Common.DOCUMENT_SOURCE.WEB)
                                                                      && (Model.Status == com.rti.appcommon.CAF_STATE.NEW.ToString()
                                                                      || Model.Status == com.rti.appcommon.CAF_STATE.SUBMITTED.ToString()
                                                                      || Model.Status == com.rti.appcommon.CAF_STATE.INCOMPLETE.ToString()
                                                                      || Model.Status == com.rti.appcommon.CAF_STATE.PENDING.ToString()))%>                                                              
                                                                <%:Html.ActionLink("Delete", "DeleteAcc", new { id = inboxRec.AppID, cafAppID = Model.AppID, ioRecType = inboxRec.Type })%>&nbsp;
                                                            </td>
                                                        </tr>
                                                        <% }
                                                               }
                                                           } %>
                                                    </table>
                                                </fieldset>
                                            </div>
                                            <div id="tabs-2" class="Content">
                                                <div id="commonMessage" />
                                                <table class="Content" align="left" border="0" width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td colspan="2">
                                                            <div id="CampContainer" style="z-index: 99999!important;">
                                                                <% 
                                                                    if (Model.AppID.ToString().Length > 0)
                                                                    { %>
                                                                <%=Html.Action("SelectedCamp", new { Id = Model.CampSiteAppID })%>
                                                                <%}
                                                                    else
                                                                    { %>
                                                                <%=Html.Action("SelectedCamp")%>
                                                                <%} %>
                                                                <%:Html.HiddenFor(m1 => Model.CampSiteAppID)%>
                                                                <%:Html.HiddenFor(m1 => Model.Camp)%>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                     <tr>
                                                        <td  style="vertical-align: top; padding-top: 12px;width : 48%">
                                                            <fieldset>
                                                                <table id = "tblCampFee">
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <div class="editor-label" style="font-size: 13pt">
                                                                                <strong>Camp Fees </strong>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label" style = "width : 104px">
                                                                                <nobr>Membership fee&nbsp;</nobr>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field">
                                                                               <span><nobr> $&nbsp;<%:Html.TextBoxFor(m1 => Model.MembershipFee, new { style = "width:90px;" })%></nobr></span></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td colspan="2"><div style = "width:100%;float:left" ><%:Html.ValidationMessageFor(m1 => Model.MembershipFee)%></div></td></tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                Registration fee
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field">
                                                                                $&nbsp;<%:Html.TextBoxFor(m1 => Model.RegistrationFee, new { style = "width:90px;" })%></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td colspan="2" ><div style = "width:100%;float:left" ><%:Html.ValidationMessageFor(m1 => Model.RegistrationFee)%></div></td></tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                Session Type
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field">
                                                                                <% 
                                                                                    int nSessionType = 0;
                                                                                    if (Model != null && Model.SessionType != null)
                                                                                    {
                                                                                        nSessionType = Model.SessionType;
                                                                                    } %>
                                                                                &nbsp;&nbsp;&nbsp;<%: Html.DropDownListFor(m1 => Model.SessionType, new SelectList(new List<Object> { new { value = 1, text = "Weekly" }, new { value = 2, text = "Monthly" }, 
                                                                                    new { value = 3, text = "Entire Summer" }, new { value = 4, text = "Session" } }, "value", "text", nSessionType), new { onchange = "hideShowPerSessionFee(this)", style = "width:95px;"})%><br /><%:Html.ValidationMessageFor(m1 => Model.SessionType)%></div>
                                                                        </td>
                                                                    </tr>
                                                                    <%--<tr><td colspan="2" ><div style = "width:100%;float:left" ></div></td></tr>--%>
                                                                    <tr id="trEntireCampFee">
                                                                        <td style="width: 120px">
                                                                            <div class="editor-label">
                                                                                <label id="entireCampFee">
                                                                                    Entire Camp fee</label>
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field">
                                                                                $&nbsp;<%:Html.TextBoxFor(m1 => Model.PerSessionFee, new { style = "width:90px;" })%></div>
                                                                        </td>
                                                                    </tr>                              
                                                                    <tr><td colspan="2" ><div style = "width:100%;float:left" ><%:Html.ValidationMessageFor(m1 => Model.PerSessionFee)%></div></td></tr>                                      
                                                                    <tr id="trNoOfWeeks">
                                                                        <td style="width: 120px">
                                                                                        <div class="editor-label">
                                                                                            <label id="numberOf">
                                                                                                Number of Weeks</label>
                                                                                        </div>
                                                                                    </td>
                                                                                    <td>
                                                                                        <div class="editor-field">
                                                                                            &nbsp;&nbsp;&nbsp;<%:Html.TextBoxFor(m1 => Model.NumberOfsessions, new { style = "width:90px;" })%>
                                                                                        </div>
                                                                                    </td>
                                                                    </tr>
                                                                    <tr><td colspan = "2"><div id = "errNumberOfsessions" style = "width : 100%;float : left"><%:Html.ValidationMessageFor(m1 => Model.NumberOfsessions)%></div></td></tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                T-shirt
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field">
                                                                                $&nbsp;<%:Html.TextBoxFor(m1 => Model.Tshirt, new { style = "width:90px;" })%></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td colspan="2" ><div style = "width:100%;float:left" ><%:Html.ValidationMessageFor(m1 => Model.Tshirt)%></div></td></tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                Trips
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field">
                                                                                $&nbsp;<%:Html.TextBoxFor(m1 => Model.Trips, new { style = "width:90px;" })%></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td colspan="2" ><div style = "width:100%;float:left" ><%:Html.ValidationMessageFor(m1 => Model.Trips)%></div></td></tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                Transportation
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field">
                                                                                $&nbsp;<%:Html.TextBoxFor(m1 => Model.Transportation, new { style = "width:90px;" })%></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td colspan="2" ><div style = "width:100%;float:left" ><%:Html.ValidationMessageFor(m1 => Model.Transportation)%></div></td></tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                Meals
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field">
                                                                                $&nbsp;<%:Html.TextBoxFor(m1 => Model.Meals, new { style = "width:90px;" })%></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td colspan="2" ><div style = "width:100%;float:left" ><%:Html.ValidationMessageFor(m1 => Model.Meals)%></div></td></tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                Before care
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field">
                                                                                $&nbsp;<%:Html.TextBoxFor(m1 => Model.BeforeCare, new { style = "width:90px;" })%></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td colspan="2" ><div style = "width:100%;float:left" ><%:Html.ValidationMessageFor(m1 => Model.BeforeCare)%></div></td></tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                After care
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field" style="text-align: left !important;">
                                                                                $&nbsp;<%:Html.TextBoxFor(m1 => Model.AfterCare, new { style = "width:90px;" })%></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td colspan="2" ><div style = "width:100%;float:left" ><%:Html.ValidationMessageFor(m1 => Model.AfterCare)%></div></td></tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                Other
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field" style="text-align: left !important;">
                                                                                $&nbsp;<%:Html.TextBoxFor(m1 => Model.Other, new { style = "width:90px;" })%></div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td colspan="2" ><div style = "width:100%;float:left" ><%:Html.ValidationMessageFor(m1 => Model.Other)%></div></td></tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <div class="editor-label">
                                                                                If other, provide details
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td colspan="2" ><div style = "width:100%;float:left" ></div></td></tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <div class="editor-field" style="text-align: right !important;">
                                                                                <%:Html.TextAreaFor(m1 => Model.OtherDescription, new { style = "width:200px;" })%>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr><td colspan="2" ><div style = "width:100%;float:left" ><%:Html.ValidationMessageFor(m1 => Model.OtherDescription)%></div></td></tr>
                                                                </table>
                                                            </fieldset>
                                                        </td>
                                                        <td style="vertical-align: top; padding-top: 12px;width : 45%">
                                                            <fieldset>
                                                                <table style = "width : 90%" >
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            Encampment Dates
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="editor-label">
                                                                            From
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                To
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="editor-field">
                                                                            <%:Html.TextBoxFor(m1 => Model.EncampmentDateFrom1, new { style = "width:90px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => Model.EncampmentDateFrom1)%>
                                                                        </td>
                                                                        <td class="editor-field">
                                                                            <%:Html.TextBoxFor(m1 => Model.EncampmentDateTo1, new { style = "width:90px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => Model.EncampmentDateTo1)%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="editor-field">
                                                                            <%:Html.TextBoxFor(m1 => Model.EncampmentDateFrom2, new { style = "width:90px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => Model.EncampmentDateFrom2)%>
                                                                        </td>
                                                                        <td class="editor-field">
                                                                            <%:Html.TextBoxFor(m1 => Model.EncampmentDateTo2, new { style = "width:90px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => Model.EncampmentDateTo2)%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="editor-field">
                                                                            <%:Html.TextBoxFor(m1 => Model.EncampmentDateFrom3, new { style = "width:90px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => Model.EncampmentDateFrom3)%>
                                                                        </td>
                                                                        <td class="editor-field">
                                                                            <%:Html.TextBoxFor(m1 => Model.EncampmentDateTo3, new { style = "width:90px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => Model.EncampmentDateTo3)%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="editor-field">
                                                                            <%:Html.TextBoxFor(m1 => Model.EncampmentDateFrom4, new { style = "width:90px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => Model.EncampmentDateFrom4)%>
                                                                        </td>
                                                                        <td class="editor-field">
                                                                            <%:Html.TextBoxFor(m1 => Model.EncampmentDateTo4, new { style = "width:90px;" })%>
                                                                            <%:Html.ValidationMessageFor(m1 => Model.EncampmentDateTo4)%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                Total Cost
                                                                            </div>
                                                                        </td>
                                                                        <td class="editor-field">
                                                                            <%-- style="text-align: right !important;">--%>
                                                                            $&nbsp;<%:Html.TextBox("txtTotalFee",Model.TotalCost, new { style = "width:78px;" })%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                <asp:Label ID="lblamtReq" Text="Amount Requested" runat="server"></asp:Label>
                                                                            </div>
                                                                        </td>
                                                                        <td class="editor-field">
                                                                            <%-- style="text-align: right !important;">--%>
                                                                            $&nbsp;<%:Html.TextBoxFor(m1 => Model.AmountRequested , new { style = "width:78px;" })%></td>
                                                                    </tr>
                                                                    <tr><td colspan = "2" ><div style = "width:100%;float : left"><%:Html.ValidationMessageFor(m1 => Model.AmountRequested )%></div></td></tr>
                                                                    <tr>
                                                                        <td colspan="2" style="font-size: 8pt">
                                                                            (maximum $600), if encampment fees exceed grant limit, <b>who is responsible for payment of balance?</b>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <div class="editor-field" style="text-align: right !important;">
                                                                                <%:Html.TextBoxFor(m1 => Model.ExcessFeesOwnership, new { style = "width:190px;float:left" })%>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                Form Signed?
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field">
                                                                                <%:Html.CheckBoxFor(m1 => Model.IsSigned, new { style = "width:90px;" })%>
                                                                                <%:Html.ValidationMessageFor(m1 => Model.IsSigned)%>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                Signed By
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field">
                                                                                <%:Html.TextBoxFor(m1 => Model.SignedBy, new { style = "width:90px;" })%>
                                                                                <%:Html.ValidationMessageFor(m1 => Model.SignedBy)%>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div class="editor-label">
                                                                                Title
                                                                            </div>
                                                                        </td>
                                                                        <td>
                                                                            <div class="editor-field">
                                                                                <%:Html.TextBoxFor(m1 => Model.Title, new { style = "width:90px;" })%>
                                                                                <%:Html.ValidationMessageFor(m1 => Model.Title)%>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2" style="height: 1px;">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </fieldset>                                                            
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td id="tdRightPDF" runat="server" valign="top" style="visibility: visible; text-align: right;">
                            <table cellpadding="0" cellspacing="0" width="100%" border="0">
                                <tr>
                                    <td style="vertical-align: middle; height: 24px; text-align: right; background-color: #e5e5e5;">
                                        <a id="ancViewPDF" href="<%:(string) ViewBag.Message %>" target="_blank">View PDF in
                                            a separate window</a><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" style="z-index: 1 !important;">
                                        <div id="divPDFContainer" style="z-index: 1 !important; position: relative;float:right">
                                            <center>
                                                <param name="wmode" value="transparent" />
                                                <embed id="pdfcntrl" src="<%: (string)ViewBag.Message %>" type="application/pdf"
                                                    wmode="transparent" style="z-index: 1 !important; position: relative" width="442px"
                                                    height="660px"></embed>
                                            </center>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <% } %>
</asp:Content>
