
     var splitterOutter, splitterInner;
$(function () {
          
    splitterOutter = $("#LayoutSection_ControlsSection_outersplitter").data("ejSplitter");
    splitterInner = $("#LayoutSection_ControlsSection_outersplitter_ctl00_innersplitter").data("ejSplitter");
});

function evtpropscheckedevent(args) {
    if (args.isChecked) {
        switch (args.selectedValue) {
            case "expandCollapse":
                splitterOutter.option(args.selectedValue, "oncollapse");
                splitterInner.option(args.selectedValue, "oncollapse");
                break;
            case "resize":
                splitterOutter.option(args.selectedValue, "onresize");
                splitterInner.option(args.selectedValue, "onresize");
                break;
        }
    }
    else {
        splitterOutter.option(args.selectedValue, null);
        splitterInner.option(args.selectedValue, null);
    }
}

function oncreate(args) {
    splitterid=("LayoutSection_ControlsSection_outersplitter" == this.element[0].id)?"outersplitter":"innersplitter";
    jQuery.addEventLog(splitterid + " has been <span class='eventTitle'>created</span>.");
}
function oncollapse(args) {
    collapsedid = ("LayoutSection_ControlsSection_outersplitter_ctl00_innersplitter" == args.collapsed.item[0].id) ? "innersplitter" : args.collapsed.item[0].id;
    expandedid = ("LayoutSection_ControlsSection_outersplitter_ctl00_innersplitter" == args.expanded.item[0].id) ? "innersplitter" : args.expanded.item[0].id;
    jQuery.addEventLog(collapsedid + " has been <span class='eventTitle'>collapsed</span> and " +
        expandedid + " has been <span class='eventTitle'>expanded</span>.");
}
function onresize(args) {
	splitterid=("LayoutSection_ControlsSection_outersplitter" == this.element[0].id)?"outersplitter":"innersplitter";
    jQuery.addEventLog(splitterid + " has been <span class='eventTitle'>resized</span>.");
}
function onClear() {
    $("#EventLog").html("");
}
