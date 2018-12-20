/* TagCloud Events.js */
var tagObj;
$(function () {
    tagObj = $("#LayoutSection_ControlsSection_tagEvents").data("ejTagCloud");
});

function evtpropscheckedevent(args) {
    if (args.isChecked) {
        switch (args.data.itemValue) {
            case "mouseover": tagObj.option(args.data.itemValue, "onmouseover"); break;
            case "mouseout": tagObj.option(args.data.itemValue, "onmouseout"); break;
            case "click": tagObj.option(args.data.itemValue, "onclick"); break;
        }
    }
    else tagObj.option(args.data.itemValue, null);
}

function oncreate(args) {
    jQuery.addEventLog("Tagcloud has been <span class='eventTitle'>created</span>.");
}
function onmouseover(args) {
    jQuery.addEventLog("Mouse pointer is <span class='eventTitle'>hovered </span> on " + args.value + ".</br>");
}
function onmouseout(args) {
    jQuery.addEventLog("Mouse pointer is <span class='eventTitle'>hovered away</span> from " + args.value + ".</br>");
}
function onclick(args) {
    jQuery.addEventLog(args.value + " is <span class='eventTitle'>clicked</span>.</br>");
}
function onClear() {
    $("#EventLog").html("");
}