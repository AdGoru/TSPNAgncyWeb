<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.Models.WcfAppService.localCAF>" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>COVER SHEET</title>
    <link href="../../Content/webstyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            top:0;
            background-color: White;
        }
        h4
        {
            margin-top: 0in;
            margin-right: 0in;
            margin-bottom: 0in;
            margin-left: -.5in;
            margin-bottom: .0001pt;
            text-indent: .5in;
            page-break-after: avoid;
            font-size: 14.0pt;
            font-family: "Arial" , "sans-serif";
            font-weight: normal;
        }
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 495px;
            height: 151px;
        }
        .style4
        {
            font-size: medium;
            font-family: Arial;
        }
        .style5
        {
            font-family: Arial;
            font-size: 10px;
        }
    p.MsoFooter
	{margin-bottom:.0001pt;
	tab-stops:center 3.0in right 6.0in;
	font-size:12.0pt;
	font-family:"Arial","sans-serif";
	        margin-left: 0in;
            margin-right: 0in;
            margin-top: 0in;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <%
        string strURl = Page.ResolveUrl("~/CAF/TCAF/");
        strURl += Url.RequestContext.RouteData.Values["id"].ToString();
    %>
    <div id="DivMain" class="printpage">
        <div id="divToPrint" class="printpage">
            <table cellpadding="0px" cellspacing="0px" width="100%">
                <tr>
                    <td class="MainHadingWithBold" align="left" colspan="2">
                        <table class="style1">
                            <tr>
                                <td width="60%">
                                    <img class="style3" src="../../Images/mmr.png" />
                                </td>
                                <td width="35%">
                                    <table class="style1">
                                        <tr>
                                            <td class="Notes">
                                                Arthur C. Evans, Jr., Ph.D.<br />
                                                <span style="margin-top:-2px; position:absolute; font-size:9px; font-weight:normal">Director</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Notes" align="left" colspan="2" style="padding: 16px 0px 6px 0px;">
                                                <strong>Michael J. Covone </strong><br />
                                                <span style="margin-top:-2px; position:absolute; font-size:9px; font-weight:normal">Deputy Director</span>
                                            </td>
                                        </tr>                                        
                                        <tr>
                                            <td class="Notes" align="left" colspan="2" style="padding: 14px 0px 6px 0px;">
                                                <strong>Sadé Ali </strong><br />
                                                <span style="margin-top:-2px; position:absolute; font-size:9px; font-weight:normal">Deputy Director</span>
                                            </td>
                                        </tr>     
                                    </table>
                                </td>
                                <td width="5%">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="MainHadingWithBold" align="left">
                        <asp:Label ID="Label5" Text="Reference #: " runat="server"></asp:Label>
                        <%:Html.DisplayFor(m1=>m1.Reference)%>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr class="Fields">
                    <td align="center" colspan="2" style="font-size: 24px;">
                    </td>
                </tr>
                <tr class="Fields">
                    <td align="center" colspan="2">
                        2014 Madeline Moore Summer Camp Grant
                    </td>
                </tr>
                <tr class="Fields">
                    <td align="center" colspan="2">
                        Summer Camp Monitoring
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr class="Fields">
                    <td align="center" colspan="2">
                        Fax completed form to: 215-685-5564
                    </td>
                </tr>
                <tr class="Fields">
                    <td align="center" colspan="2">
                        (No fax cover sheet needed.)
                    </td>
                </tr>
                <tr>
                    <td class="MainHadingWithBold" align="center" colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="MainHadingWithBoldAndBorder" align="center" colspan="2" style="font-size: 18px;">
                        IT IS MANDATORY FOR THIS FORM TO BE SUBMITTED BY AUGUST 15, 2014.
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-bottom: 5px">
                        <table width="100%">
                            <tr class="Fields">
                                <td align="left" style="width: 10%">
                                    &nbsp;
                                </td>
                                <td align="left" width="40%">
                                </td>
                                <td align="left" style="width: 10%">
                                    &nbsp;
                                </td>
                                <td align="left" width="40%">
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label71" Text="Child’s Name:  " runat="server"></asp:Label>&nbsp;
                                    <%:Html.DisplayFor(m1=>m1.Child)%>
                                </td>

                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label73" Text="Name of Camp:  " runat="server"></asp:Label>&nbsp;
                                    <%:Html.DisplayFor(m1=>m1.Camp)%>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label19" Text="Encampment dates ___________ to ___________ " runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label75" Text="Camp Contact Person: " runat="server"></asp:Label>&nbsp;
                                    <%:Html.DisplayFor(m1 => m1.CampContactName)%>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label76" Text="Phone # __________________________" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label77" Text="Person Completing Form:  __________________________ "
                                        runat="server"></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label1" Text="Phone # __________________________" runat="server"></asp:Label>
                                </td>
                            </tr>

                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>

                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label771" Text="Signature: ___________________________________________ "
                                        runat="server"></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label711" Text="Date: _____________________________________" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="Border" align="left" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label79" runat="server" Text="Did the child attend the entire encampment? "></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label2" Text="Yes ___    No ___ " runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label6" runat="server" Text="Was programming provided as advertised? "></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label3" Text="Yes ___    No ___ " runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label61" runat="server" Text="Did the camp appear to be clean and safe? "></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label31" Text="Yes ___    No ___ " runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label9" runat="server" Text="Was adequate supervision provided for the campers? "></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label4" Text="Yes ___    No ___ " runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label12" runat="server" Text="Did the child enjoy the camping experience? "></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label7" Text="Yes ___    No ___ " runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label15" runat="server" Text="Did the child have TSS for the entire encampment? "></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label8" Text="Yes ___    No ___ " runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label62" runat="server" Text="Was family satisfied with camping experience? "></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label32" Text="Yes ___    No ___ " runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label63" runat="server" Text="Was family satisfied with TSS experience? "></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label33" Text="Yes ___    No ___ " runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>


                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label181" runat="server" Text="If no to any of the above, please explain "></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>  
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>                                
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>

                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>

                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label21" runat="server" Text="If the child did not attend camp for any reason, was DBH notified?  "></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label10" Text="Yes ___    No ___ " runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label24" runat="server" Text="If yes, give date and person contacted at DBH: "></asp:Label>
                                </td>
                                <td colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="2">
                                    <asp:Label ID="Label18" runat="server" Text="What was the reason the child did not attend? "></asp:Label>
                                </td>
                                <td align="left" colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>  
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>                                
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>

                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    <asp:Label ID="Label20" runat="server" Text="If you have any concerns or comments about the camp, please note those here: "></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="FieldBorder" colspan="4">
                                    <br />
                                    &nbsp;
                                </td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;</td>
                            </tr>
                            <tr class="Fields">
                                <td align="left" colspan="4">
                                    &nbsp;
                                    <div style="mso-element:para-border-div;border:none;border-top:solid windowtext 1.0pt;
mso-border-top-alt:solid windowtext .5pt;padding:1.0pt 0in 0in 0in">
                                        <p align="center" class="MsoFooter" style="text-align:center;border:none;
mso-border-top-alt:solid windowtext .5pt;padding:0in;mso-padding-alt:1.0pt 0in 0in 0in">
                                            <span style="font-size:9.0pt;mso-bidi-font-family:Arial;mso-bidi-font-weight:bold">
                                            1101 Market St 7<sup>th</sup> Fl. Philadelphia, PA 19107<span 
                                                style="mso-spacerun:yes">&nbsp; </span>(215) 685-5400<o:p></o:p></span></p>
                                    </div>

                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
