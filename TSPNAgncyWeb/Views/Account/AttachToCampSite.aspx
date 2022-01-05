<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MasterPageWithoutLeftPane.Master"
    Inherits="System.Web.Mvc.ViewPage<com.rti.tailspinnew.Models.WcfAppService.localCampSite>" %>
<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

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
        $(document).ready(function () {
            $(".signin").click(function (e) {
                e.preventDefault();
                $("fieldset#signin_menu").toggle();
                $(".signin").toggleClass("menu-open");
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

        function validateFile() {
            var isvalid = true;
            $('input[type=file]').each(function () {
                var fileval = $(this).val();
                
                if (!fileval) {
                }
                else {
                    var ext = fileval.substring(fileval.length - 4, fileval.length);
                    if (ext.toLowerCase() != ".pdf") {
                        //alert('Invalid file');
                        isvalid= false;
                    }
                }
            });
            if (isvalid == false) {
                alert("Sorry, Invalid files are there...");
                return false;
            }
            return true;
        }
        
    </script>
    <%using (Html.BeginForm("AttachToCampSite", "Account", FormMethod.Post, new { enctype = "multipart/form-data", id="attachfiles" }))
      {%>
    <%:Html.ValidationSummary(true)%>
    <fieldset>
        <legend>Attach Documents Form</legend>
        <table cellpadding="0" cellspacing="0" width="450px" border="0">
            <tr>
                <td colspan="2" style="height: 18px;">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left: 12px;">
                    <table>
                        <tr>
                            <td>
                                <input type="file" name="fileUpload1" id="fileUpload1"  />
                            </td>
                            <td style="width: 6px;">
                                &nbsp;
                            </td>
                            <td>
                                <div class="editor-field">
                                    <%: Html.DropDownList("AttachmentType1", new SelectList(new List<Object> { new { value = 0, text = "Attachment Type" }, new { value = "Camp Brochure/Flyer", text = "Camp Brochure/Flyer" }, new { value = "Camp Registration", text = "Camp Registration" }, new { value = "CBH Authorization", text = "CBH Authorization" } }, "value", "text"), new { style = "width:165px;" })%>
                                </div>
                            </td>
                            <td style="width: 6px;">
                                &nbsp;
                            </td>
                            <td>
                                <input type="date" name="expirdate1" id="expirdate1"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="file" name="fileUpload2" id="fileUpload2" />
                            </td>
                            <td style="width: 6px;">
                                &nbsp;
                            </td>
                            <td class="DatatdLeftnMiddle">
                                <div class="editor-field">
                                    <%: Html.DropDownList("AttachmentType2", new SelectList(new List<Object> { new { value = 0, text = "Attachment Type" }, new { value = "Camp Brochure/Flyer", text = "Camp Brochure/Flyer" }, new { value = "Camp Registration", text = "Camp Registration" }, new { value = "CBH Authorization", text = "CBH Authorization" } }, "value", "text"), new { style = "width:165px;" })%>
                                </div>
                            </td>
                            <td style="width: 6px;">
                                &nbsp;
                            </td>
                            <td>
                                <input type="date" name="expirdate2" id="expirdate2"  />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="file" name="fileUpload3" id="fileUpload3" />
                            </td>
                            
                            <td style="width: 6px;">
                                &nbsp;
                            </td>
                            <td class="DatatdLeftnMiddle">
                                <div class="editor-field">
                                    <%: Html.DropDownList("AttachmentType3", new SelectList(new List<Object> { new { value = 0, text = "Attachment Type" }, new { value = "Camp Brochure/Flyer", text = "Camp Brochure/Flyer" }, new { value = "Camp Registration", text = "Camp Registration" }, new { value = "CBH Authorization", text = "CBH Authorization" } }, "value", "text"), new { style = "width:165px;" })%>
                                </div>
                            </td>
                            <td style="width: 6px;">
                                &nbsp;
                            </td>
                            <td>
                                <input type="date" name="expirdate3" id="expirdate3"  />
                            </td>
                        </tr>                       
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 18px;">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-right: 8px;">
                    <input type="submit" value="Attach" name="AttachCampDocs"  onclick="return validateFile();" />
                </td>
                <td style="text-align: left;">
                    <input type="submit" value="Cancel" name="CancelAttach" onclick="return true" />
                </td>
            </tr>
        </table>
    </fieldset>
    <% } %>
</asp:Content>