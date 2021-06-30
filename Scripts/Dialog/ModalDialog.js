

function coupeClick() {
    $("#r8Coupe").ejDialog("open");
}
function spyderClick() {
    $("#r8Spyder").ejDialog("open");
}
function onDialogClose(args) {
    $("#LayoutSection_ControlsSection_btnOpen").show();
}
function btnclick() {
    var dialogObj = $("#LayoutSection_ControlsSection_lognForm").data("ejDialog");
    dialogObj.open();
    $("#LayoutSection_ControlsSection_btnOpen").hide();
}