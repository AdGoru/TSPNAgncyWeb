$(function () {

    $.ajaxSetup({
        cache: false
    });

    // Wire up the click event of any current or future dialog links
    $('.dialogLink').live('click', function () {
        var element = $(this);

        // Retrieve values from the HTML5 data attributes of the link        
        var dialogTitle = element.attr('data-dialog-title');
        var updateTargetId = '#' + element.attr('data-update-target-id');
        var updateUrl = element.attr('data-update-url');
        var digTit = dialogTitle.replace(" ", "");
        // Generate a unique id for the dialog div
        var dialogId = 'uniqueName-' + Math.floor(Math.random() * 1000)
        var dialogDiv = "<div id='" + dialogId + "' class='" + digTit + "'></div>";

        // Load the form into the dialog div
        $(dialogDiv).load(this.href, function () {
            $(this).dialog({
                modal: true,
                resizable: false,
                title: dialogTitle,
                width: 700,
                height: 400,
                close: function (e) {//Added to Enhance the search functionality 
                    $(this).empty();
                    //will destroy the popup dialog.
                    $(this).dialog('destroy');
                    //enable the pdf                    
                    var Right = document.getElementById('MainContent_tdRightPDF');
                    if (Right.style.visibility == "hidden") {
                        Right.style.visibility = "visible";
                    }
                },
                buttons: null
                //                buttons: {
                //                    "Submit":null, //function () {
                //                        // Manually submit the form                        
                //                        var form = $('form', this);
                //                        $(form).submit();
                //                    },
                //                   "Cancel": function () { $(this).dialog('close'); }
                //              }
            });

            // Enable client side validation
            $.validator.unobtrusive.parse(this);

            // Setup the ajax submit logic
            wireUpForm(this, updateTargetId, updateUrl);

            // Setup the ajax submit logic
            ajaxPaging(this, updateTargetId, updateUrl);
        });
        return false;
    });
});

function wireUpForm(dialog, updateTargetId, updateUrl) {
    $('form', dialog).submit(function () {

        // Do not submit if the form
        // does not pass client side validation
        if (!$(this).valid())
            return false;

        // Client side validation passed, submit the form
        // using the jQuery.ajax form
        $.ajax({
            url: this.action,
            type: this.method,
            data: $(this).serialize(),
            success: function (result) {
                // Check whether the post was successful
                if (result.success) {                    
                    // Close the dialog 
                    $(dialog).dialog('close');

                    // Reload the updated data in the target div
                    $(updateTargetId).load(updateUrl);
                } else {
                    // Reload the dialog to show model errors                    
                    $(dialog).html(result);

                    // Enable client side validation
                    $.validator.unobtrusive.parse(dialog);

                    // Setup the ajax submit logic
                    wireUpForm(dialog, updateTargetId, updateUrl);

                    // Setup the ajax submit logic
                    ajaxPaging(dialog, updateTargetId, updateUrl);
                }
            }
        });
        return false;
    });
}

function ajaxPaging(dialog, updateTargetId, updateUrl) {
    $('.pager > a').click(function (event) {
        event.preventDefault();
        $.ajax({
            url: this.href,
            type: "GET",
            data: $(this).serialize(),
            success: function (result) {
                // Check whether the post was successful
                if (result.success) {
                    // Close the dialog 
                    $(dialog).dialog('close');

                    // Reload the updated data in the target div
                    $(updateTargetId).load(updateUrl);
                } else {
                    // Reload the dialog to show model errors                    
                    $(dialog).html(result);

                    // Enable client side validation
                    $.validator.unobtrusive.parse(dialog);

                    // Setup the ajax submit logic
                    ajaxPaging(dialog, updateTargetId, updateUrl);

                    // Setup the ajax submit logic
                    wireUpForm(dialog, updateTargetId, updateUrl);
                }
            }
        });
    });
}