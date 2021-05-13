var rteObj;
$(function () {
    // declaration
    rteObj = $("#LayoutSection_ControlsSection_fileExplorer").data("ejFileExplorer")
    $("#LayoutSection_EventSection_selectControls").ejDropDownList({
        popupShown: "adjustpopupposition",
        showCheckbox: true,
        checkAll: true,
        change: "evtpropscheckedevent"
    });
});

function evtpropscheckedevent(args) {
    if (args.isChecked) {
        switch (args.value) {
            case "layoutChange": rteObj.option(args.value, "onLayoutChange"); break;
            case "select": rteObj.option(args.value, "onSelect"); break;
            case "unselect": rteObj.option(args.value, "onUnselect"); break;
            case "createFolder": rteObj.option(args.value, "onCreateFolder"); break;
            case "remove": rteObj.option(args.value, "onRemove"); break;
            case "cut": rteObj.option(args.value, "onCut"); break;
            case "copy": rteObj.option(args.value, "onCopy"); break;
            case "paste": rteObj.option(args.value, "onPaste"); break;
            case "open": rteObj.option(args.value, "onOpen"); break;
        }
    }
    else rteObj.option(args.value, null);
}


function onLayoutChange(args) {
    jQuery.addEventLog("<span class='eventTitle'>Layout changed</span> to '" + args.layoutType + "' view.");
}
function onSelect(args) {
    jQuery.addEventLog("'" + args.name + "' " + args.nodeType + " has been <span class='eventTitle'>selected</span>.");
}
function onUnselect(args) {
    jQuery.addEventLog("'" + args.name + "' " + args.nodeType + " has been <span class='eventTitle'>unselected</span>.");
}
function onCreateFolder(args) {
    jQuery.addEventLog("'" + args.data.files[0].name + "' Directory has been <span class='eventTitle'>created</span>.");
}
function onRemove(args) {
    jQuery.addEventLog("'" + args.name + "' " + args.selectedItems[0].type + " has been <span class='eventTitle'>removed</span>.");
}
function onCut(args) {
    jQuery.addEventLog("'" + args.name + "' " + args.selectedItems[0].type + " has been <span class='eventTitle'>cut</span>.");
}
function onCopy(args) {
    jQuery.addEventLog("'" + args.name + "' " + args.selectedItems[0].type + " has been <span class='eventTitle'>copied</span>.");
}
function onPaste(args) {
    jQuery.addEventLog("'" + args.selectedItems[0].name + "' " + args.selectedItems[0].type + " has been <span class='eventTitle'>pasted</span>.");
}
function onOpen(args) {
    jQuery.addEventLog("'" + args.selectedItems[0].name + "' " + args.itemType + " has been <span class='eventTitle'>opened</span>.");
}
function onClear() {
    jQuery.clearEventLog();
}