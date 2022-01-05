<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.Models.WcfAppService.localCAF>" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>COVER SHEET</title>
    <link href="../../Content/webstyle.css" rel="stylesheet" type="text/css" />
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
                    <td>
                        <a href="<%=strURl%>">Back to TCAF</a>
                    </td>
                </tr>
                <tr>
                    <td class="MainHadingWithBold" align="center" colspan="2" style=" font-size:24px;">
                        COVER SHEET
                    </td>
                </tr>
                <tr>
                    <td class="MainHading" align="center" colspan="2">
                        2013 Madeline Moore Summer Camp Grant
                    </td>
                </tr>
                <tr>
                    <td class="MainHadingWithBold" align="center" colspan="2">
                        <b>Fax Number: 215-685-5564</b>
                    </td>
                </tr>
                <tr>
                    <td class="MainHadingWithBold" align="center" colspan="2">
                        Email: 
                    </td>
                </tr>
                <tr>
                    <td class="Notes" align="center" colspan="2">
                       <u>Sending additional cover sheets will delay processing.</u>
                    </td>
                </tr>
                <tr>
                    <td class="MainHadingWithBold" align="left" colspan="2">
                       1 application per cover sheet
                    </td>
                </tr>                
                <tr>
                    <td valign="top" colspan="2">
                        <table width="100%" cellpadding="4" cellspacing="0" style="border: 1px solid #000000">
                            <tr>
                                <td width="50%"  style=" padding:10px; border:1px solid #000000">Date:&nbsp;&nbsp; <%:Html.DisplayFor(m1=>m1.CAFSubmitedOn)%></td>
                                <td width="50%"  style=" padding:10px; border:1px solid #000000">
                                Pages:&nbsp;&nbsp;<br />
                                (Including cover sheet)

                                </td>
                            </tr>
                            <tr>
                                <td style=" padding:10px; border:1px solid #000000">Agency Name:&nbsp;&nbsp;<%:Html.DisplayFor(m1=>m1.Agency)%></td>
                                
                                <td style=" padding:10px; border:1px solid #000000">
                                Agency Fax #:&nbsp;&nbsp;<%:Html.DisplayFor(m1=>m1.AgencyFaxNo)%>
                                </td>
                            </tr>
                            <tr>
                                <td style=" padding:10px; border:1px solid #000000">
                                Agency Address:&nbsp;&nbsp;<%:Html.DisplayFor(m1=>m1.AgencyAddress)%>
                                </td>
                                
                                <td style=" padding:10px; border:1px solid #000000">
                                Supervisor’s Phone #:&nbsp;&nbsp;<%:Html.DisplayFor(m1 => m1.AgencyContactPhone)%>

                                </td>
                            </tr>
                            <tr>
                                <td style=" padding:10px; border:1px solid #000000">
                                Agency Supervisor:&nbsp;&nbsp;<%:Html.DisplayFor(m1=>m1.AgencyAgent)%> 
                                </td>
                                
                                <td style=" padding:10px; border:1px solid #000000">
                                Supervisor’s Email Address: &nbsp;&nbsp;<%:Html.DisplayFor(m1=>m1.AgencyContactEmail)%>

                                </td>
                            </tr>
                        </table>
                    </td>                    
                </tr>
                <tr>
                    <td valign="top" colspan="2" style=" padding-top:20px">
                        <table width="100%" cellpadding="4" cellspacing="0" style="border: 1px solid #000000">
                            <tr>
                                <td width="50%" style=" padding:10px; border:1px solid #000000">Child’s Name:&nbsp;&nbsp; <%:Html.DisplayFor(m1=>m1.Child)%></td>
                                <td width="50%" style=" padding:10px; border:1px solid #000000">Name of Camp:&nbsp;&nbsp;<%:Html.DisplayFor(m1=>m1.Camp)%></td>
                            </tr>                           
                        </table>
                    </td>                    
                </tr>
                <tr>
                    <td class="MainHadingWithBold" align="center" colspan="2">
                       Document Check List
                    </td>
                </tr>
                <tr>
                    <td class="Notes" align="center" colspan="2">
                       Check to indicate you are sending the required documentation.
                    </td>
                </tr>
                <tr>
                    <td class="MainHadingWithBold" align="left" colspan="2">
                       Preferred Camp
                    </td>
                </tr>
                <tr>
                    <td class="Notes" style=" padding-left:100px" align="left" colspan="2">
                       <input type="checkbox" id="Checkbox1" name="Checkbox1" />
                       <label for="Checkbox1">Madeline Moore Summer Camp Grant fax cover sheet</label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" style=" padding-left:100px" align="left" colspan="2">
                       <input type="checkbox" id="Checkbox2" name="Checkbox2" />
                       <label for="Checkbox2">Madeline Moore Summer Camp Grant application</label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" style=" padding-left:100px" align="left" colspan="2">
                       <input type="checkbox" id="Checkbox3" name="Checkbox3" />
                       <label for="Checkbox3">Copy of camp brochure/flyer (<u>must include: camp fees, dates and camp activities</u>)</label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" style=" padding-left:100px" align="left" colspan="2">
                       <input type="checkbox" id="Checkbox4" name="Checkbox4" />
                       <label for="Checkbox4">Copy of completed camp registration form</label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" style=" padding-left:100px" align="left" colspan="2">
                       <input type="checkbox" id="Checkbox5" name="Checkbox5" />
                       <label for="Checkbox5">Copy of <u>current</u> Behavioral Health services authorization.</label>
                    </td>
                </tr>

                <tr>
                    <td class="MainHadingWithBold" align="left" colspan="2">
                       Non-Preferred Camp 
                    </td>
                </tr>
                <tr>
                    <td class="Notes" style=" padding-left:100px" align="left" colspan="2">
                       <input type="checkbox" id="Checkbox6" name="Checkbox6" />
                       <label for="CheCheckbox6ckbox1">Madeline Moore Summer Camp Grant fax cover sheet</label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" style=" padding-left:100px" align="left" colspan="2">
                       <input type="checkbox" id="Checkbox7" name="Checkbox7" />
                       <label for="Checkbox7">Madeline Moore Summer Camp Grant application</label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" style=" padding-left:100px" align="left" colspan="2">
                       <input type="checkbox" id="Checkbox8" name="Checkbox8" />
                       <label for="Checkbox8">Madeline Moore Summer Camp Agreement </label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" style=" padding-left:100px" align="left" colspan="2">
                       <input type="checkbox" id="Checkbox9" name="Checkbox9" />
                       <label for="Checkbox9">Copy of camp brochure/flyer (<u>must include: camp fees, dates and camp activities</u>)</label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" style=" padding-left:100px" align="left" colspan="2">
                       <input type="checkbox" id="Checkbox10" name="Checkbox10" />
                       <label for="Checkbox10">Copy of completed camp registration form</label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" style=" padding-left:100px" align="left" colspan="2">
                       <input type="checkbox" id="Checkbox11" name="Checkbox11" />
                       <label for="Checkbox11">Copy of <u>current</u> Behavioral Health services authorization.</label>
                    </td>
                </tr>
                <tr>
                    <td class="Notes" style=" padding-top:20px" align="right" colspan="2">
                       Updated 10/17/11
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
