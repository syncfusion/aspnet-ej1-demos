var slideObj;
$(function () {
    // declaration
    slideObj = $("#LayoutSection_ControlsSection_Rotatorcontent").data("ejRotator");
    $("#selectControls").ejDropDownList({
        popupShown: "adjustpopupposition",
        showCheckbox: true,
        checkAll: true,
        change: "evtpropscheckedevent"
    });
});

function evtpropscheckedevent(args) {
    if (args.isChecked) {
        switch (args.selectedValue) {
            case "create": slideObj.option(args.selectedValue, "oncreate"); break;
            case "start": slideObj.option(args.selectedValue, "onstart"); break;
            case "stop": slideObj.option(args.selectedValue, "onstop"); break;
            case "change": slideObj.option(args.selectedValue, "onchange"); break;
            case "thumbItemClick": slideObj.option(args.selectedValue, "onnavClick"); break;
            case "pagerClick": slideObj.option(args.selectedValue, "onpagerClick"); break;
        }
    }
    else slideObj.option(args.selectedValue, null);
}
function oncreate(args) {
    jQuery.addEventLog("Rotator control has been <span class='eventTitle'>created</span>. <br/>");
}
function onstart(args) {
    jQuery.addEventLog("Autoplay has been <span class='eventTitle'>started</span> at index " + args.activeItemIndex + ". <br/>");
}
function onstop(args) {
    jQuery.addEventLog("Autoplay has been <span class='eventTitle'>stopped</span> at index " + args.activeItemIndex + ". <br/>");
}
function onchange(args) {
    jQuery.addEventLog("Slide index has been <span class='eventTitle'>changed</span> to " + args.activeItemIndex + ". <br/>");
}
function onnavClick(args) {
    jQuery.addEventLog("Thumbnail Element has been <span class='eventTitle'>clicked</span>  at index " + args.activeItemIndex + ". <br/>");
}
function onpagerClick(args) {
    jQuery.addEventLog("Pager has been <span class='eventTitle'>clicked </span> at index " + args.activeItemIndex + ". <br/>");
}
function onClear() {
    $("#EventLog").html("");
}