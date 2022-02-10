<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.Models.WcfAppService.localCAF>" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>PrintCAF</title>
    <link href="../../Content/webstyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <%
        string strURl = Page.ResolveUrl("~/CAF/TCAF/");
        strURl += Url.RequestContext.RouteData.Values["id"].ToString();
    %>
    <div id="DivMain" class="printpage">
        <div id="divToPrint" class="printpage">
            <table cellpadding="0px" cellspacing="0px" width="100%">
                <tr>
                    <td class="MainHadingWithBold" align="left">
                        <asp:Label ID="Label5" Text="Reference #: " runat="server"></asp:Label>
                        <%:Html.DisplayFor(m1=>m1.Reference)%>
                    </td>
                    <%--<td>
                        <a href="<%=strURl%>">Back to TCAF</a>
                    </td>--%>
                </tr>
                <tr>
                    <td class="MainHadingWithBold" align="center" colspan="2">
                        <asp:Label ID="Label4" Text="2014 Madeline Moore Summer Camp Grant Application" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="MainHading" align="center" colspan="2">
                        <asp:Label ID="Label3" Text="Department of Behavioral Health, Intellectual disAbility Services"
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="Notes" align="center" colspan="2">
                        <asp:Label ID="Label2" Text="This grant is not an entitlement. Funding is limited and granted on a first come, first served basis."
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" align="center" colspan="2">
                        <asp:Label ID="df" Text="On-line application " runat="server"></asp:Label>
                        <asp:Label ID="Label7" Text="must" runat="server" CssClass="TextWithUnderLine"></asp:Label>
                        <asp:Label ID="Label1" Text=" be submitted prior to faxing/emailing this form along with supporting documentation."
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" align="center" colspan="2">
                        <asp:Label ID="Label6" Text="Application will not be considered until all supporting documentation is received."
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    </td>
                </tr>
                <tr>
                    <td valign="top" width="50%" style="border-right: solid 2px black; border-left: solid 2px black;
                        border-bottom: solid 2px black; border-top: solid 2px black; ">
                        <table width="100%">
                            <tr>
                                <td align="center" colspan="2" class="FieldsWithBold" valign="top">
                                    <asp:Label ID="Label8" Text="APPLICANT INFORMATION" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" valign="top">
                                    <asp:Label ID="Label9" Text="Child’s name" runat="server" Width="100px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <%:Html.DisplayFor(m1 => m1.ChildFirstName)%>
                                    &nbsp;
                                    <%:Html.DisplayFor(m1 => m1.ChildMiddleName)%>
                                    &nbsp;
                                    <%:Html.DisplayFor(m1 => m1.ChildLastName)%>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" valign="top">
                                    <asp:Label ID="Label10" Text="Child’s DOB" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%" valign="top">
                                    <%:Html.DisplayFor(m1 => m1.ChildDOB)%>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" valign="top">
                                    <asp:Label ID="Label12" Text="Primary" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%" valign="top">
                                    <asp:Label ID="Label25" Text="" runat="server"></asp:Label>&nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" valign="top">
                                    <asp:Label ID="Label13" Text="Secondary" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%" valign="top">
                                    <asp:Label ID="Label37" Text="" runat="server"></asp:Label>&nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2" class="FieldsWithBold" valign="top">
                                    <asp:Label ID="Label19" Text="Parent/Guardian Info" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" valign="top">
                                    <asp:Label ID="Label14" Text="Name" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%" valign="top">
                                    <%:Html.DisplayFor(m1 => m1.ParentFirstName)%>
                                    &nbsp;
                                    <%:Html.DisplayFor(m1 => m1.ParentMiddleName)%>
                                    &nbsp;
                                    <%:Html.DisplayFor(m1 => m1.ParentLastName)%>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label27" Text="Street address" runat="server" Width="150px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <%:Html.DisplayFor(m1=>m1.ChildAddressLine1)%> &nbsp;
                                    <%:Html.DisplayFor(m1=>m1.ChildAddressLine2)%>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" valign="top">
                                    <asp:Label ID="Label15" Text="City, State, Zip" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%" valign="top">
                                    <%:Html.DisplayFor(m1 => m1.ChildCity)%>
                                    <%:Html.DisplayFor(m1 => m1.ChildState)%>
                                    <%:Html.DisplayFor(m1 => m1.ChildZip)%>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" valign="top">
                                    <asp:Label ID="Label16" Text="Home phone #" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%" valign="top">
                                    <%:Html.DisplayFor(m1=>m1.ChildPhone)%>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" valign="top">
                                    <asp:Label ID="Label17" Text="Cell phone #" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%" valign="top">
                                    <%--<%:Html.DisplayFor(m1=>m1.ParentAddress.Phone2)%>--%>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" width="150px" valign="top">
                                    <asp:Label ID="Label18" Text="E-mail address" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%" valign="top">
                                    <%:Html.DisplayFor(m1=>m1.ChildEmail)%>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="FieldsWithBold">
                                <td align="left" colspan="2" valign="top">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="FieldsWithBold">
                                <td align="left" colspan="2" valign="top">
                                    <asp:Label ID="Label20" Text="Parent/Guardian Signature" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="FieldsWithBold">
                                <td align="left" colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="FieldsWithBold">
                                <td align="left" colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Border">
                                <td align="left" colspan="2" class="FieldBorder">
                                &nbsp;
                                </td>
                            </tr>
                            <tr class="FieldsWithBold">
                                <td align="left" colspan="2" valign="top">
                                    <asp:Label ID="Label21" Text="Please note: this application cannot be processed without parent or guardian signature."
                                        runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td width="50%" style="border-right: 2px solid #000000; border-bottom: 2px solid #000000; border-top: 2px solid #000000">
                        <table>
                            <tr>
                                <td align="center" colspan="2" class="FieldsWithBold">
                                    <asp:Label ID="Label22" Text="CAMP INFORMATION" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label23" Text="Name of camp" runat="server" Width="100px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <%:Html.DisplayFor(m1=>m1.Camp)%>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label24" Text="Camp street address" runat="server" Width="150px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <%:Html.DisplayFor(m1=>m1.CampLine1)%> &nbsp;
                                    <%:Html.DisplayFor(m1=>m1.CampLine2)%>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label30" Text="City, State, Zip" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <%:Html.DisplayFor(m1=>m1.CampCity)%>,
                                    <%:Html.DisplayFor(m1=>m1.CampState)%>,
                                    <%:Html.DisplayFor(m1=>m1.CampZip)%>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label26" Text="Camp contact person" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <%:Html.DisplayFor(m1=>m1.CampContactName)%>&nbsp;
                                </td>
                            </tr>
                            <%--<tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label27" Text="Axis II" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <%:Html.DisplayFor(m1=>m1.AxisII)%>
                                </td>
                            </tr>--%>
                            <tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label29" Text="Camp phone #" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <%:Html.DisplayFor(m1=>m1.CampPhone)%>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label31" Text="Camp fax #" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <%:Html.DisplayFor(m1=>m1.CampFaxNo)%>
                                </td>
                            </tr>
                            <%--<tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label32" Text="Cell phone #" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <%:Html.DisplayFor(m1=>m1.ParentAddress.Phone2)%>
                                </td>
                            </tr>--%>
                            <tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label33" Text="E-mail address" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <%:Html.DisplayFor(m1=>m1.CampEmail)%>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label69" Text="Encampment Dates:" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <table class="style1">
                                        <tr>
                                            <td width="50%">
                                                <asp:Label ID="Label70" Text="From " runat="server"></asp:Label>
                                            </td>                                            
                                            <td width="50%">
                                                <asp:Label ID="Label80" Text="To " runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="50%">
                                                <%:Html.DisplayFor(m1=>m1.EncampmentDateFrom1)%>
                                            </td>
                                            <td width="50%">
                                                <%:Html.DisplayFor(m1=>m1.EncampmentDateTo1)%>
                                            </td>
                                       </tr>
                                       <tr>                                            
                                            <td width="50%">
                                                <%:Html.DisplayFor(m1=>m1.EncampmentDateFrom2)%>
                                            </td>
                                            
                                            <td width="50%">
                                                <%:Html.DisplayFor(m1=>m1.EncampmentDateTo2)%>
                                            </td>
                                        </tr>
                                        <tr>
                                            
                                            <td width="50%">
                                                <%:Html.DisplayFor(m1=>m1.EncampmentDateFrom3)%>
                                            </td>
                                            
                                            <td width="50%">
                                                <%:Html.DisplayFor(m1=>m1.EncampmentDateTo3)%>
                                            </td>
                                        </tr>
                                        <tr>
                                            
                                            <td width="50%">
                                                <%:Html.DisplayFor(m1=>m1.EncampmentDateFrom4)%>
                                            </td>
                                           
                                            <td width="50%">
                                                <%:Html.DisplayFor(m1=>m1.EncampmentDateTo4)%>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label28" Text="Breakdown of Fees (Fees must be listed on brochure.)"
                                        runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder">
                                    <asp:Label ID="Label35" Text="$" runat="server"></asp:Label>
                                    <%:Html.DisplayFor(m1=>m1.MembershipFee)%>
                                </td>
                                <td align="left" width="150px">
                                    <asp:Label ID="Label39" Text="Membership fee" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder">
                                    <asp:Label ID="Label50" Text="$" runat="server"></asp:Label>
                                    <%:Html.DisplayFor(m1=>m1.RegistrationFee)%>
                                </td>
                                <td align="left" width="150px">
                                    <asp:Label ID="Label34" Text="Registration fee" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder">
                                    <asp:Label ID="Label51" Text="$" runat="server"></asp:Label>
                                    <%:Html.DisplayFor(m1=>m1.PerSessionFee)%>
                                </td>
                                <td align="left">
                                    <asp:Label ID="Label36" Text="Fee: Weekly /Session/ Entire camp fee (circle one)"
                                        runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="FieldBorder" width="140px">
                                    <%:Html.DisplayFor(m1=>m1.NumberOfsessions)%>
                                </td>
                                <td align="left" >
                                    <asp:Label ID="Label40" Text="Number of weeks/sessions" runat="server"></asp:Label>
                                    <asp:Label ID="Label45" Text="(If fee reflects entire camp fee, leave blank)" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder">
                                    <asp:Label ID="Label53" Text="$" runat="server"></asp:Label>
                                    <%:Html.DisplayFor(m1=>m1.Tshirt)%>
                                </td>
                                <td align="left">
                                    <asp:Label ID="Label41" Text="T-shirt" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder">
                                    <asp:Label ID="Label54" Text="$" runat="server"></asp:Label>
                                    <%:Html.DisplayFor(m1=>m1.Trips)%>
                                </td>
                                <td align="left" width="150px">
                                    <asp:Label ID="Label42" Text="Trips" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder">
                                    <asp:Label ID="Label55" Text="$" runat="server"></asp:Label>
                                    <%:Html.DisplayFor(m1=>m1.Transportation)%>
                                </td>
                                <td align="left" width="150px">
                                    <asp:Label ID="Label43" Text="Transportation" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder">
                                    <asp:Label ID="Label56" Text="$" runat="server"></asp:Label>
                                    <%:Html.DisplayFor(m1=>m1.Meals)%>
                                </td>
                                <td align="left" width="150px">
                                    <asp:Label ID="Label44" Text="Meals" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder">
                                    <asp:Label ID="Label57" Text="$" runat="server"></asp:Label>
                                    <%:Html.DisplayFor(m1=>m1.BeforeCare)%>
                                </td>
                                <td align="left" width="150px">
                                    <asp:Label ID="Label47" Text="Before care" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder">
                                    <asp:Label ID="Label58" Text="$" runat="server"></asp:Label>
                                    <%:Html.DisplayFor(m1=>m1.AfterCare)%>
                                </td>
                                <td align="left" width="150px">
                                    <asp:Label ID="Label48" Text="After care" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder">
                                    <asp:Label ID="Label59" Text="$" runat="server"></asp:Label>
                                    <%:Html.DisplayFor(m1=>m1.Other)%>
                                </td>
                                <td align="left">
                                    <asp:Label ID="Label49" Text="Other, please specify: " runat="server"></asp:Label>
                                    <U><%:Html.DisplayFor(m1=>m1.OtherDescription)%></U>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder">
                                    <asp:Label ID="Label60" Text="$" runat="server"></asp:Label>
                                    <%:Html.DisplayFor(m1=>m1.TotalCost)%>
                                </td>
                                <td align="left" width="150px">
                                    <asp:Label ID="Label46" Text="Total cost of camp" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="FieldsWithBold">
                                <td align="left" colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="NotesWithBold" align="center" colspan="2">
                        <asp:Label ID="Label52" Text="Grants approved for up to a maximum $600."
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="NotesWithBold" align="left" colspan="2">
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Label ID="Label61" Text="If total encampment fees exceed grant limits, who is responsible for payment of balance?"
                                        runat="server" Width="500px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="100%">
                                    <%:Html.DisplayFor(m1=>m1.ExcessFeesOwnership)%>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="NotesWithBold" align="left" colspan="2">
                        <asp:Label ID="Label62" Text=" By signing below, I acknowledge that the above child has registered with my camp and the fees indicated are correct and included on my brochure."
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" align="left" colspan="2">
                        <table width="100%">
                            <tr>
                                <td class="NotesWithBold" align="left" nowrap="nowrap" width="auto">
                                    <asp:Label ID="Label63" Text="Camp Signature " runat="server"></asp:Label>
                                </td>
                                <td class="FieldBorder" width="30%">
                                    <asp:Label ID="Label38" Text="" runat="server"></asp:Label>&nbsp;
                                </td>
                                <td width="2%">
                                </td>
                                <td class="NotesWithBold" align="left" width="auto">
                                    <asp:Label ID="Label65" Text="Title" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="30%">
                                    <asp:Label ID="Label79" Text="" runat="server"></asp:Label>&nbsp;
                                </td>
                                <td width="2%">
                                </td>
                                <td class="NotesWithBold" align="left" width="auto">
                                    <asp:Label ID="Label66" Text="Date" runat="server"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="30%">
                                    <asp:Label ID="Label81" Text="" runat="server"></asp:Label>&nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="NotesWithBold" align="center" colspan="2">
                        <asp:Label ID="Label64" Text="Please note: this application cannot be processed without camp signature. "
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="Border" align="left" colspan="2">
                    &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="FieldsWithBold" align="center" colspan="2" style="padding: 2px 0px 2px 0px">
                        <asp:Label ID="Label67" Text="REFERRAL SOURCE INFORMATION " runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2" width="100%">
                        <asp:Label ID="Label68" Text="(Referral source MUST be an approved Behavioral Health Provider for the DBH.)"
                            runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-bottom: 5px">
                        <table width="100%">
                            <tr class="Fields">
                                <td align="left" style="width: 10%">
                                    <asp:Label ID="Label71" Text="Name & Title" runat="server" Width="120px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="40%">
                                    <%:Html.DisplayFor(m1=>m1.AgencyReferral)%>
                                </td>
                                <td align="left" style="width: 10%">
                                    <asp:Label ID="Label72" Text="Office Phone# " runat="server" Width="120px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder" width="40%">
                                    <%:Html.DisplayFor(m1 => m1.ReferralPhone)%>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label73" Text="Agency Name " runat="server" Width="120px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder">
                                    <%:Html.DisplayFor(m1=>m1.Agency)%>
                                </td>
                                <td align="left">
                                    <asp:Label ID="Label74" Text="Cell Phone # " runat="server" Width="120px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder">
                                    <%--<%:Html.DisplayFor(m1=>m1.AgencyPhone)%>--%> &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label75" Text="Street Address" runat="server" Width="120px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder">
                                    <%:Html.DisplayFor(m1=>m1.ReferralLine1)%>, &nbsp;
                                    <%:Html.DisplayFor(m1=>m1.ReferralLine2)%>
                                </td>
                                <td align="left">
                                    <asp:Label ID="Label76" Text="Fax # " runat="server" Width="120px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder">
                                    <%:Html.DisplayFor(m1=>m1.ReferralFax)%>&nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left">
                                    <asp:Label ID="Label77" Text="City, State, Zip " runat="server" Width="120px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder">
                                    <%:Html.DisplayFor(m1=>m1.ReferralCity)%>, &nbsp;
                                    <%:Html.DisplayFor(m1=>m1.ReferralState)%>, &nbsp;
                                    <%:Html.DisplayFor(m1=>m1.ReferralZip)%>
                                    &nbsp;
                                </td>
                                <td align="left">
                                    <asp:Label ID="Label78" Text="E-mail Address " runat="server" Width="120px"></asp:Label>
                                </td>
                                <td align="left" class="FieldBorder">
                                    <%:Html.DisplayFor(m1=>m1.ReferralEmailAddress)%> &nbsp;
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="Border" align="left" colspan="2">
                    &nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <table width="100%">
                            <tr>
                                <td align="left" class="FieldsWithBold" width="50%">
                                    2014 Madeline Moore Summer Camp Grant Application 1.rtf
                                </td>
                                <td class="MainHadingWithBold" align="left">
                                    <asp:Label ID="Label11" Text="Reference #: " runat="server"></asp:Label>
                                    <%:Html.DisplayFor(m1=>m1.Reference)%>
                                </td>
                                <td align="right" class="FieldsWithBold" width="25%">
                                    Updated: 10/19/11
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        window.print();
        
    </script>
</body>
</html>
