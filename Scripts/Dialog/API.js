var eDialog;
$(function () {
    eDialog = $("#LayoutSection_ControlsSection_dialogAPI").data("ejDialog");
    $("#sampleProperties").ejPropertiesPanel();
});
function onDialogClose(args) {
    $("#LayoutSection_PropertySection_btnDialogMinimize").ejToggleButton("disable");
    $("#LayoutSection_PropertySection_btnDialogMaximize").ejToggleButton("disable");
    $("#LayoutSection_PropertySection_btnDialogCollapse").ejToggleButton("disable");
	$("#LayoutSection_PropertySection_btnDialogOpen").ejButton("enable");
}
function onOpen() {
    if (eDialog.model) {
        eDialog.open();
    }
}
function onClose() {
    eDialog.close();
	$("#LayoutSection_PropertySection_btnDialogOpen").ejButton("enable");
}
function onMinimize(args) {
    if (args.isChecked) {
        if ($("#LayoutSection_PropertySection_btnDialogMaximize").ejToggleButton("model.toggleState") == true)
            $("#LayoutSection_PropertySection_btnDialogMaximize").ejToggleButton("model.toggleState", false);
        eDialog.minimize();
        $("#LayoutSection_PropertySection_btnDialogMinimize").ejToggleButton("model.toggleState", true)
        $("#LayoutSection_PropertySection_btnDialogCollapse").ejToggleButton("disable");
    }
    else {
        eDialog.restore();
        $("#LayoutSection_PropertySection_btnDialogCollapse").ejToggleButton("enable");
        if ($("#LayoutSection_PropertySection_btnDialogCollapse").ejToggleButton("model.toggleState") == true)
            $("#LayoutSection_PropertySection_btnDialogCollapse").ejToggleButton("model.toggleState", false);
    }
}
function onMaximize(args) {
    if (args.isChecked) {
        if ($("#LayoutSection_PropertySection_btnDialogMinimize").ejToggleButton("model.toggleState") == true)
            $("#LayoutSection_PropertySection_btnDialogMinimize").ejToggleButton("model.toggleState", false);
        eDialog.maximize();
        if ($("#LayoutSection_PropertySection_btnDialogCollapse").ejToggleButton("model.toggleState") == true)
            $("#LayoutSection_PropertySection_btnDialogCollapse").ejToggleButton("model.toggleState", false);
    }
    else {
        eDialog.restore();
        if ($("#LayoutSection_PropertySection_btnDialogMinimize").ejToggleButton("model.toggleState") == true)
            $("#LayoutSection_PropertySection_btnDialogMinimize").ejToggleButton("model.toggleState", false);
        if ($("#LayoutSection_PropertySection_btnDialogCollapse").ejToggleButton("model.toggleState") == true)
            $("#LayoutSection_PropertySection_btnDialogCollapse").ejToggleButton("model.toggleState", false);
    }
    $("#LayoutSection_PropertySection_btnDialogCollapse").ejToggleButton("enable");
}
function onCollapse(args) {
    (args.isChecked) ? eDialog.collapse() : eDialog.expand();
}
function enableBtn(args) {
	eDialog = $("#LayoutSection_ControlsSection_dialogAPI").data("ejDialog");
    $("#LayoutSection_PropertySection_btnDialogMinimize").ejToggleButton("enable");
    $("#LayoutSection_PropertySection_btnDialogMaximize").ejToggleButton("enable");
	$("#LayoutSection_PropertySection_btnDialogOpen").ejButton("disable");
    if(!eDialog._minimize)
        $("#LayoutSection_PropertySection_btnDialogCollapse").ejToggleButton("enable");
}
