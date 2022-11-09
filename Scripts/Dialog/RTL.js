function btnclick() {
    var dialogObj = $("#LayoutSection_ControlsSection_rtlDialog").data("ejDialog");
    dialogObj.open();
    $("#LayoutSection_ControlsSection_btnOpen").hide();
}
function onDialogClose(args) {
    $("#LayoutSection_ControlsSection_btnOpen").show();
}