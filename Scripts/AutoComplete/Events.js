/* Events.js */

var autocompleteObj;
$(function () {
    // declaration
    autocompleteObj = $("#LayoutSection_ControlsSection_selectCountry").data("ejAutocomplete");

    $("#LayoutSection_EventSection_selectControls").ejDropDownList({
        popupShown: "adjustpopupposition",
        showCheckbox: true,
        checkAll: true
    });
});
function evtpropscheckedevent(args) {
    if (args.isChecked) {
        switch (args.value) {
            case "focusOut": autocompleteObj.option(args.value, "onFocusOut"); break;
            case "select": autocompleteObj.option(args.value, "onSelect"); break;
        }
    }
    else autocompleteObj.option(args.value, null);
}
// Client side Events

function onClear() {
    jQuery.clearEventLog();
}