
$(function () {
    //Control focus key
    $(document).on("keydown", function (e) {
        if (e.altKey && e.keyCode === 74) { // j- key code.
            $("#LayoutSection_ControlsSection_keyboardDialog_wrapper").focus();
        }
    });
    $("#sampleProperties").ejPropertiesPanel();

});
function btnclick() {
    var dialogObj = $("#LayoutSection_ControlsSection_keyboardDialog").data("ejDialog");
    dialogObj.open();
    $("#LayoutSection_ControlsSection_btnOpen").hide();
}
function onDialogClose(args) {
    $("#LayoutSection_ControlsSection_btnOpen").show();
}
