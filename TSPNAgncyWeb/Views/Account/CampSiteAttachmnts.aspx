<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterPageWithoutLeftPane.Master"
    Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.Models.WcfAppService.localCampSite>" %>

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
    Campsite
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery-ui-1.8.16.custom.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery-ui-1.6.2.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.ui.datepicker-en-GB.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowPDF(pdfid) {
            var url = '<%: Request.Url.AbsoluteUri %>';
            url = url.substring(0, url.toLowerCase().lastIndexOf('/tcaf')) + "/PDFFile/" + pdfid;
            $("#ancViewPDF").attr("href", url);
            pdfhtl = '<embed id="pdfcntrl" src="' + url + '" type="application/pdf" wmode="transparent" style="z-index:10" width="450px" height="660px"></embed>'
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
    <%using (Html.BeginForm("CampSiteAttachmnts", "Account", FormMethod.Post, new { enctype = "multipart/form-data" }))
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


                    
                    <span style="float: left">&nbsp;&nbsp;</span>
                    
                    <input type="submit" value="Attach" style="float: left" name="AttachToCmpSite" />
                    
                    
                    <span style="float: left">&nbsp;&nbsp;</span>
                    <%: Html.Hidden("hdnCtrlId", "")%>
                    
                    
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
                                            <strong>Camp Site Name:</strong>&nbsp;<%:Html.Label(ViewData["CampSiteName"].ToString())%></div>
                                        <div style="float: right;">
                                            <strong>Camp Site Status:</strong>&nbsp;<%:Html.Label(ViewData["CampSiteStatus"].ToString())%></div>
                                        <span style="float: left">&nbsp;&nbsp;</span>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <div id="tabs" style="background-color: White; clear: both;width : 100%">
                                            <ul>
                                                
                                                <li><a href="#tabs-4" class="Content" style="font-weight: bold">Attachments</a></li>
                                            </ul>
                                            
                                            
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
                                                                <a href="'<%: inboxRec.DocAppIDs[0] %>'" onclick="return ShowPDF('<%: inboxRec.DocAppIDs[0] %>')">
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
                                                                      inboxRec.sourceOrTargetType == (int)com.rti.tailspinnew.web.Models.Common.DOCUMENT_SOURCE.WEB))%>                                                              
                                                                <%:Html.ActionLink("Delete", "DeleteAcc", new { id = inboxRec.AppID, cafAppID = Model.AppID, ioRecType = inboxRec.Type })%>&nbsp;
                                                            </td>
                                                        </tr>
                                                        <% }
                                                               }
                                                           } %>
                                                    </table>
                                                </fieldset>
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
