<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.AppDom.CAF>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    NewCAF
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery.ui.datepicker-en-GB.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#tabs").tabs();
        });
        function hideShowPerSessionFee(ths) {
            if ($("#SessionType").val() == 0) {
                $("#divPerSessionFee").hide();
            }
            else {
                $("#divPerSessionFee").show();
            }
        }
        /* jquery by VG*/
        $(document).live('invalid-form.validate', 'form', function () {
            var button = $(this).find('input[type="submit"]');
            setTimeout(function () {
                button.removeAttr('disabled');
            }, 1);
        });
        $(document).live('submit', 'form', function () {
            var button = $(this).find('input[type="submit"]');
            setTimeout(function () {
                button.attr('disabled', 'disabled');
            }, 0);
        });

        /* end */
        function getvalu(txval) {
            if (txval == "" || isNaN(txval)) {
                return 0;
            } else {
                return parseInt(txval);
            }
        }
        $(document).ready(function () {
            $("#divPerSessionFee").hide();
            $("#ApplicantRec_DOB").datepicker();
            $("#EncampFrom").datepicker();
            $("#EncampTo").datepicker();
            $("#SignedOn").datepicker();
                    
        });
        $(document).ready(function () {
            var d = new Date();
            var curr_date = d.getDate();
            var curr_month = d.getMonth() + 1;
            var curr_year = d.getFullYear();
            now = curr_date + "/" + curr_month + "/" + curr_year;
            now2 = curr_date + "/" + curr_month + "/" + (parseInt(curr_year) - 10);
            $("#MembershipFee").val(0);
            $("#RegistrationFee").val(0);
            $("#Tshirt").val(0);
            $("#Trips").val(0);
            $("#Transportation").val(0);
            $("#Meals").val(0);
            $("#BeforeCare").val(0);
            $("#AfterCare").val(0);
            $("#Other").val(0);
            $("#PerSessionFee").val(0);
            $("#NumberofSessions").val(0);
            $("#AmtRequested").val(0);

            $("#EncampTo").val(now);
            $("#EncampFrom").val(now);
            $("#ApplicantRec_DOB").val(now2);
            $("#tabs-2").find('input[type="text"]').keydown(function (event) {
                if ($("#SessionType").val() == 0) {
                    var tfs = getvalu($("#MembershipFee").val()) + getvalu($("#RegistrationFee").val()) + getvalu($("#Tshirt").val()) + getvalu($("#Trips").val()) + getvalu($("#Transportation").val()) + getvalu($("#Meals").val()) + getvalu($("#BeforeCare").val()) + getvalu($("#AfterCare").val()) + getvalu($("#Other").val());
                    $("#txtTotalFee").val(tfs);
                }
                else {
                    var tfss = getvalu($("#MembershipFee").val()) + getvalu($("#RegistrationFee").val()) + getvalu($("#Tshirt").val()) + getvalu($("#Trips").val()) + getvalu($("#Transportation").val()) + getvalu($("#Meals").val()) + getvalu($("#BeforeCare").val()) + getvalu($("#AfterCare").val()) + getvalu($("#Other").val());
                    tfss = tfss + (getvalu($("#PerSessionFee").val()) * getvalu($("#NumberofSessions").val()));
                    $("#txtTotalFee").val(tfss);
                }
            });
            $(".signin").click(function (e) {
                e.preventDefault();
                $("fieldset#signin_menu").toggle();
                $(".signin").toggleClass("menu-open");
            });

            $(".ButtonBar").find('input[type="submit"]').click(function (e) {
                $("#hdnCtrlId").val($(this).val());
                return true;
            });

            $("fieldset#signin_menu").mouseup(function () {
                return false
            });
            $(document).mouseup(function (e) {
                if ($(e.target).parent("a.signin").length == 0) {
                    $(".signin").removeClass("menu-open");
                    $("fieldset#signin_menu").hide();
                }
            });

        });

    </script>

    <script src="<%: Url.Content("~/Scripts/jquery-ui-1.8.16.custom.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery-ui-1.6.2.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.ui.datepicker-en-GB.js") %>" type="text/javascript"></script>
    <div>
        <% using (Html.BeginForm("NewCAF", "CAF", FormMethod.Post))
           { %>
        <%: Html.ValidationSummary(true, "Adding new CAF was unsuccessful. Please correct the errors and try again.") %>
        <div>
            <%--<div style=" float:left; padding-top:10px">
                Reference # <%:Html.TextBox("CafRefNum", ViewData["CafRefNum"].ToString(), new { disabled = "disabled" })%>                             
            </div>--%>
            <div style=" float:left; padding-top:12px">
                <%:Html.Label("Reference #:  " + ViewData["CafRefNum"].ToString())%>                             
            </div>
        </div>
        <div class="ButtonBar" style="padding-top: 10px; padding-bottom: 10px;  float:right">
            <%--<input type="submit" value="Edit" id="btnEdit" />&nbsp;--%>
            <input type="submit" value="Save" style="float: left" /> <span style="float: left">&nbsp;&nbsp;</span>
            <input type="submit" value="Submit" style="float: left" /> <span style="float: left">&nbsp;</span>
            <%:Html.ActionLink("Print", "PrintCAF", "Print", new { style = "float:left", @class = "link" })%>
            <%: Html.Hidden("hdnCtrlId", "")%>

            <div id="container" style="float: left">
                <div id="topnav" class="topnav">
                    <a href="login" class="signin"><span>Print Letters</span></a>
                </div>
                <fieldset id="signin_menu">
                    <ul class="ulbtns">
                        <li>
                            <%:Html.ActionLink("Approval", "PrintCAF", "Print")%>                            
                        </li>
                        <li>
                            <div class="clear"></div>
                            <%:Html.ActionLink("Denial", "PrintCAF", "Print")%>
                        </li>
                        <li>
                            <%:Html.ActionLink("Incomplete", "PrintCAF", "Print")%></li>
                        <li>
                            <%:Html.ActionLink("Camp Monitoring Form", "PrintCAF", "Print")%></li>
                    </ul>
                </fieldset>
            </div>
        </div>
        <div id="tabs" style="background-color: White; clear: both;">
            <ul>
                <li><a href="#tabs-1" class="Content" style="font-weight: bold">Child Info</a></li>
                <li><a href="#tabs-2" class="Content" style="font-weight: bold">Camp & Fees Info</a></li>
                <li><a href="#tabs-3" class="Content" style="font-weight: bold">Referral Source</a></li>
                <li><a href="#tabs-4" class="Content" style="font-weight: bold">Notes</a></li>
            </ul>
            <div id="tabs-1" class="Content">
                <table class="Content" align="left">
                    <tr>
                        <td style="width: 110px;">
                            <div class="editor-label">Child Name</div>
                        </td>
                        <td style="padding-left: 0px">
                            <table class="body" style="width: 200px">
                                <tr>
                                    <td style="width: 100px" align="left">
                                        <%:Html.TextBoxFor(m1 => m1.ApplicantRec.Name.First, new { style = "width:180px;" })%>
                                        <%:Html.ValidationMessageFor(m1 => m1.ApplicantRec.Name.First)%>
                                    </td>
                                    <td style="width: 50px">
                                        <%:Html.TextBoxFor(m1 => m1.ApplicantRec.Name.Middle, new { style = "width:70px;" })%>
                                        <%:Html.ValidationMessageFor(m1 => m1.ApplicantRec.Name.Middle)%>
                                    </td>
                                    <td style="width: 100px">
                                        <%:Html.TextBoxFor(m1 => m1.ApplicantRec.Name.Last, new { style = "width:180px;" })%>
                                        <%:Html.ValidationMessageFor(m1 => m1.ApplicantRec.Name.Last)%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">Child's DOB</div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.ApplicantRec.DOB, new { style = "width:180px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.ApplicantRec.DOB)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">Primary Diagnosis</div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.AxisI, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.AxisI)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Secondary Diagnosis
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.AxisII, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.AxisII)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="font-family: Arial; padding:10px 0px 10px 0px; font-size: 12px; font-weight: bold;">
                            Parent / Guardian Info:
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                <asp:Label ID="Label1" Text="Name" runat="server"></asp:Label>
                            </div>
                        </td>
                        <td style="padding-left: 0px">
                            <table class="body" style="width: 200px">
                                <tr>
                                    <td style="width: 100px" align="left">
                                        <%:Html.TextBoxFor(m1 => Model.ApplicantRec.Parent.Name.First, new { style = "width:180px;" })%>
                                        <%:Html.ValidationMessageFor(m1 => Model.ApplicantRec.Parent.Name.First)%>
                                    </td>
                                    <td style="width: 50px">
                                        <%:Html.TextBoxFor(m1 => Model.ApplicantRec.Parent.Name.Middle, new { style = "width:70px;" })%>
                                        <%:Html.ValidationMessageFor(m1 => Model.ApplicantRec.Parent.Name.Middle)%>
                                    </td>
                                    <td style="width: 100px">
                                        <%:Html.TextBoxFor(m1 => m1.ApplicantRec.Parent.Name.Last, new { style = "width:180px;" })%>
                                        <%:Html.ValidationMessageFor(m1 => Model.ApplicantRec.Parent.Name.Last)%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Has Parent/Guardian Signature?
                            </div>
                        </td>
                        <td align="left">
                            <div class="editor-field">
                                <%:Html.CheckBoxFor(m1 => Model.IsApplicationSigned, new Dictionary<string, object>() { { "id", "chkApplicationSigned" }, { "Text", "Application has been signed" } })%>
                                <%:Html.ValidationMessageFor(m1 => Model.IsApplicationSigned)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="editor-field" style="width: 100%">
                                <table width="100%" class="Maintable">
                                    <tr>
                                        <td class="DatatdLeftnMiddle" style="width: 110px;">
                                            <div class="editor-label">
                                                <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                            </div>
                                        </td>
                                        <td class="DatatdLeftnMiddle">
                                            <div class="text-box.multi-line">
                                                <%:Html.TextAreaFor(m1 => Model.ApplicantRec.Address.line1, new Dictionary<string, object>() { { "id", "txtAddress1" }, { "style", "width:450px;height:20px" } })%>
                                                <%:Html.ValidationMessageFor(m1 => Model.ApplicantRec.Address.line1)%>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="editor-label">
                                            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                        </td>
                                        <td>
                                            <%:Html.TextBoxFor(m1 => Model.ApplicantRec.Address.city, new { style = "width:450px;" })%>
                                            <%:Html.ValidationMessageFor(m1 => Model.ApplicantRec.Address.city)%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="editor-label">
                                            <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                                        </td>
                                        <td>
                                            <%:Html.TextBoxFor(m1 => Model.ApplicantRec.Address.state, new { style = "width:450px;" })%>
                                            <%:Html.ValidationMessageFor(m1 => Model.ApplicantRec.Address.state)%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="editor-label">
                                            <asp:Label ID="lblZip" runat="server" Text="Zip"></asp:Label>
                                        </td>
                                        <td>
                                            <%:Html.TextBoxFor(m1 => Model.ApplicantRec.Address.zip, new { style = "width:450px;" })%>
                                            <%:Html.ValidationMessageFor(m1 => Model.ApplicantRec.Address.zip)%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="editor-label">
                                            <asp:Label ID="lblPhone1" runat="server" Text="Phone"></asp:Label>
                                        </td>
                                        <td>
                                            <%:Html.TextBoxFor(m1 => Model.ApplicantRec.Tel, new { style = "width:450px;" })%>
                                            <%:Html.ValidationMessageFor(m1 => Model.ApplicantRec.Tel)%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="editor-label">
                                            <asp:Label ID="lblEmail1" runat="server" Text="Email"></asp:Label>
                                        </td>
                                        <td>
                                            <%:Html.TextBoxFor(m1 => Model.ApplicantRec.EmailAddress, new { style = "width:450px;" })%>
                                            <%--<%: Html.TextBox("Email", "", new { style = "width:250px;" })%>--%>
                                            <%:Html.ValidationMessageFor(m1 => Model.ApplicantRec.EmailAddress)%>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="tabs-2" class="Content">
                <div id="commonMessage"></div>
                <table class="Content" align="left">
                    <tr>
                        <td colspan="4">
                            <div id="CampContainer">
                                <%=Html.Action("SelectedCamp") %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px">
                            <div class="editor-label">Encampment From</div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.HiddenFor(m1 => Model.CampRec.AppID)%>  
                                <%:Html.HiddenFor(m1 => Model.CampName)%>                                
                                <%:Html.TextBoxFor(m1 => Model.EncampmentDateFrom1, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.EncampmentDateFrom1)%>
                            </div>
                        </td>
                    
                        <td>
                            <div class="editor-label">Encampment To</div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.EncampmentDateTo1, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.EncampmentDateTo1)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 140px">
                            <div class="editor-label">Encampment From</div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.EncampmentDateFrom2, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.EncampmentDateFrom2)%>
                            </div>
                        </td>
                    
                        <td>
                            <div class="editor-label">Encampment To</div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.EncampmentDateTo2, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.EncampmentDateTo2)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">Membership fee</div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.MembershipFee, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.MembershipFee)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">Registration fee</div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.RegistrationFee, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.RegistrationFee)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">Session Type</div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <% 
               int nSessionType = 0;
               if (Model != null && Model.SessionType != null)
               {
                   nSessionType = Model.SessionType;
               } %>
                                <%: Html.DropDownListFor(m1 => Model.SessionType, new SelectList(new List<Object> { new { value = 0, text = "Entire camp" }, new { value = 1, text = "Weekly" }, new { value = 2, text = "Session" } }, "value", "text", nSessionType), new { onchange = "hideShowPerSessionFee(this)", style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.SessionType)%>
                            </div>
                                  <td style="width: 120px">
                                            <div class="editor-label">
                                                Number of Sessions/ Weeks
                                            </div>
                                        </td>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div id="divPerSessionFee">
                                <table border="0">
                                    <tr>
                                        <td style="width: 120px">
                                            <div class="editor-label">
                                                Camp Fee
                                            </div>
                                        </td>
<%--                                        <td>
                                            <div class="editor-field">
                                                <%:Html.TextBoxFor(m1 => Model.PerSessionFee, new { style = "width:200px;" })%>
                                                <%:Html.ValidationMessageFor(m1 => Model.PerSessionFee)%>
                                            </div>
                                        </td>
--%>                                    </tr>
                                    <tr>
                                        <td style="width: 120px">
                                            <div class="editor-label">
                                                Number of Sessions/Weeks
                                            </div>
                                        </td>
                                        <td>
                                            <div class="editor-field">
                                                <%:Html.TextBoxFor(m1 => Model.NumberofSessions, new { style = "width:200px;" })%>
                                                <%:Html.ValidationMessageFor(m1 => Model.NumberofSessions)%>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                T-shirt
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.Tshirt, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.Tshirt)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Trips
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.Trips, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.Trips)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Transportation
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.Transportation, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.Transportation)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Meals
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.Meals, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.Meals)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Before care
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.BeforeCare, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.BeforeCare)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                After care
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.AfterCare, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.AfterCare)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Other
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.Other, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.Other)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Please Specify
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextAreaFor(m1 => Model.OtherDescription, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.OtherDescription)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Total cost of camp
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBox("txtTotalFee","", new { style = "width:200px;" })%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                <asp:Label ID="lblamtReq" Text="Amount being requested" runat="server"></asp:Label>
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.AmtRequested , new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.AmtRequested )%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            (maximum $600 for a preferred camp/$300 for non-preferred camp)
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Is Signed
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.CheckBoxFor(m1 => Model.IsSigned, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.IsSigned)%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%--<div class="editor-label">
                                <%: Html.LabelFor(m1 => Model.AgencyRec.Title)%>
                            </div>--%>
                            Name/Title
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.AgencyRec.Title, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.AgencyRec.Title)%>
                            </div>
                        </td>
                    </tr>
                    <%--<tr>
                        <td>
                            <div class="editor-label">Signed On</div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.SignedOn, new { style = "width:200px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.SignedOn)%>
                            </div>
                        </td>
                    </tr>--%>
                </table>
            </div>
            <div id="tabs-3" class="Content">
                <table class="Content" align="left">
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
                                        <%:Html.TextBoxFor(m1 => Model.ReferralRec.Name.First, new { style = "width:180px;" })%>
                                        <%:Html.ValidationMessageFor(m1 => Model.ReferralRec.Name.First)%>
                                    </td>
                                    <td style="width: 50px">
                                        <%:Html.TextBoxFor(m1 => Model.ReferralRec.Name.Middle, new { style = "width:70px;" })%>
                                        <%:Html.ValidationMessageFor(m1 => Model.ReferralRec.Name.Middle)%>
                                    </td>
                                    <td style="width: 100px">
                                        <%:Html.TextBoxFor(m1 => Model.ReferralRec.Name.Last, new { style = "width:180px;" })%>
                                        <%:Html.ValidationMessageFor(m1 => Model.ReferralRec.Name.Last)%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-label">
                                Agency Name 
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.AgencyName, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.AgencyName)%>
                            </div>
                        </td>
                    </tr>
                     <tr>
                        <td width="105px">
                            <div class="editor-label">
                                Address Line 1
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.ReferralRec.Address.line1, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.ReferralRec.Address.line1)%>
                            </div>
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
                                <%:Html.TextBoxFor(m1 => Model.ReferralRec.Address.city, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.ReferralRec.Address.city)%>
                            </div>
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
                                <%:Html.TextBoxFor(m1 => Model.ReferralRec.Address.state, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.ReferralRec.Address.state)%>
                            </div>
                        </td>
                    </tr>
                    <%--<tr>
                        <td width="105px">
                            <div class="editor-label">
                                Address Line 2
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextAreaFor(m1 => Model.AgencyRec.Address, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.AgencyRec.Address.line2)%>
                            </div>
                        </td>
                    </tr>--%>
                    <tr>
                        <td width="105px">
                            <div class="editor-label">
                                Zip
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.ReferralRec.Address.zip, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.ReferralRec.Address.zip)%>
                            </div>
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
                                <%:Html.TextBoxFor(m1 => Model.ReferralRec.Tel, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.AgencyRec.Tel)%>
                            </div>
                        </td>
                    </tr>
                    <%--<tr>
                        <td width="105px">
                            <div class="editor-label">
                                Cell Phone # 
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.ReferralRec.FaxNo, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.AgencyRec.FaxNo)%>
                            </div>
                        </td>
                    </tr>--%>
                    <tr>
                        <td width="105px">
                            <div class="editor-label">
                                Fax # 
                            </div>
                        </td>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextBoxFor(m1 => Model.AgencyRec.FaxNo, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.AgencyRec.FaxNo)%>
                            </div>
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
                                <%:Html.TextBoxFor(m1 => Model.AgencyRec.EmailAddress, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.AgencyRec.EmailAddress)%>
                            </div>
                        </td>
                    </tr>                    
                    <tr>
                        <td>
                            <%--<div class="editor-label">
                                <%: Html.LabelFor(m1 => Model.Reason)%>
                            </div>--%>
                        </td>
                        <td>
                            <%--<div class="editor-field">
                                <%:Html.TextAreaFor(m1 => Model.Reason, new { style = "width:450px;" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.Reason)%>
                            </div>--%>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="tabs-4" class="Content">
                <table class="Content" align="left">
                    <tr>
                        <td valign="top" align="left">
                            <div class="editor-label">
                                Notes
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="editor-field">
                                <%:Html.TextAreaFor(m1 => Model.Notes, new { style = "width:710px; height:450px" })%>
                                <%:Html.ValidationMessageFor(m1 => Model.Notes)%>
                            </div>
                        </td>
                    </tr> 
                
                </table>
            </div>
        </div>
        <%} %>
    </div>
    <script type="text/javascript">
        $(function () {
            $("#DOB").datepicker({
                changeMonth: true,
                changeYear: true
            });
            $("#encampFrom").datepicker({
                changeMonth: true,
                changeYear: true
            });
            $("#encampTo").datepicker({
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
</asp:Content>
