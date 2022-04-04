var rteObj;
$(function () {
    // declaration
    rteObj = $("#LayoutSection_ControlsSection_RTEEvents").data("ejRTE")
    $("#LayoutSection_EventSection_selectControls").ejDropDownList({
        popupShown: "adjustpopupposition",
        showCheckbox: true,
        checkAll: true,
        change: "evtpropscheckedevent"
    });
});

function evtpropscheckedevent(args) {
    if (args.isChecked) {
        switch (args.selectedValue) {
            case "create": rteObj.option(args.selectedValue, "oncreate"); break;
            case "prerender": rteObj.option(args.selectedValue, "OnPreRender"); break;
            case "keydown": rteObj.option(args.selectedValue, "onKeydown"); break;
            case "keyup": rteObj.option(args.selectedValue, "onKeyup"); break;
            case "change": rteObj.option(args.selectedValue, "onchange"); break;
            case "execute": rteObj.option(args.selectedValue, "onExecute"); break;
            
        }
    }
    else rteObj.option(args.selectedValue, null);
}


function onCreate(args) {
            jQuery.addEventLog("RTE has been <span class='eventTitle'>created</span>.");
}
        function OnPreRender() {
            jQuery.addEventLog("RTE <span class='eventTitle'>preRender</span> event has been triggered.");
        }
        function onChange(args) {
            jQuery.addEventLog("RTE value has been <span class='eventTitle'>changed</span>.");
        }

        function onKeydown(args) {
            jQuery.addEventLog("<span class='eventTitle'>Keydown</span> event is fired.");
        }

        function onKeyup(args) {
            jQuery.addEventLog("<span class='eventTitle'>Keyup</span> event is fired.");
        }

        function onExecute(args) {
            jQuery.addEventLog(args.commandName + " command has been <span class='eventTitle'>Executed</span>");
        }

        function onClear() {
            jQuery.clearEventLog();
        }