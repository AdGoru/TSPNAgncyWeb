<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<com.rti.tailspinnew.Models.WcfAppService.localInbox>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    FaxList</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="<%: Url.Content("~/Scripts/jquery-ui-1.8.16.custom.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery-ui-1.6.2.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.ui.datepicker-en-GB.js") %>" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowPDF(pdfid) {
            var url = '<%: Request.Url.AbsoluteUri %>';
            url = url.substring(0, url.toLowerCase().lastIndexOf('/faxlist')) + "/PDFFile/" + pdfid;
            $("#ancViewPDF").attr("href", url);
            pdfhtl = '<embed id="pdfcntrl" src="' + url + '" type="application/pdf" wmode="transparent" style="z-index:10" width="450px" height="660px"></embed>'
            $("#divPDFContainer").html(pdfhtl);
        }
    </script>
    <h2>
        Rejected Faxes</h2>
    <% using (Html.BeginForm("FaxList", "FAX", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    <%:Html.ValidationSummary(true) %>
    <table>
        <tr>
            <td style="vertical-align: top; width: 50%;">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="grid">
                    <tr>
                        <th align="left" nowrap="nowrap">
                            Received On
                        </th>
                        <th align="left" nowrap="nowrap">
                            Subject
                        </th>
                    </tr>
                    <% foreach (var item in Model)
                       { %>
                    <%if (item.Status == "REJECT")
                      {%>
                    <tr>
                        <td>
                            <a href="javascript:void(0);" onclick="return ShowPDF('<%: item.DocAppIDList[0] %>')">
                                <%: item.ReceivedOn%></a>
                        </td>
                        <td>
                            <%: Html.DisplayFor(modelItem => item.Subject)%>
                        </td>
                    </tr>
                    <% }
                       } %>
                </table>
            </td>
            <td id="tdRightPDF" runat="server" valign="top" style="visibility: visible; text-align: right;">
                <table cellpadding="0" cellspacing="0" width="100%" border="0">
                    <tr>
                        <td style="vertical-align: middle; height: 24px; text-align: right; background-color: #e5e5e5;">
                            <a href="<%:(string) ViewBag.Message %>" target="_blank">View PDF in a separate window</a><br />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="z-index: 50px;">
                            <%--<embed src="<%: (string)ViewBag.Message %>" type="application/pdf" width="450px"
                                height="660px"></embed>--%>
                            <div id="divPDFContainer" style="z-index: 1 !important; position: relative">
                                <center>
                                    <param name="wmode" value="transparent" />
                                    <embed id="pdfcntrl" src="<%: (string)ViewBag.Message %>" type="application/pdf"
                                        wmode="transparent" style="z-index: 1 !important; position: relative" width="450px"
                                        height="660px"></embed>
                                </center>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <%}%>
</asp:Content>
