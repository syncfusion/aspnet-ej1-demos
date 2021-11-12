
var menuObj;
jQuery(function ($) {

    menuObj = $("#LayoutSection_ControlsSection_JobSearch").data("ejMenu");
    $("#sampleProperties").ejPropertiesPanel();
});
function onEnable(args) {
    var mobj = $("#LayoutSection_ControlsSection_JobSearch").data("ejMenu");
    mobj.enableItem(args.text);
    $("#LayoutSection_PropertySection_Disable").ejDropDownList("clearText");
}
function onDisable(args) {
    var mobj = $("#LayoutSection_ControlsSection_JobSearch").data("ejMenu");
    mobj.disableItem(args.text);
    $("#LayoutSection_PropertySection_Enable").ejDropDownList("clearText");
}
function onCheckUncheckAll(args) {
       $("#LayoutSection_PropertySection_Disable").ejDropDownList("clearText");
        $("#LayoutSection_PropertySection_Enable").ejDropDownList("clearText");
        if (args.isChecked) {
            if (menuObj) menuObj.disable();
        }
        else
            if (menuObj) menuObj.enable();
    
}
