function evtpropscheckedevent(args) {
    var diagram = $("#diagram").ejDiagram("instance");
    if (args.isChecked) {
        switch (args.value) {
            case "selectionChange":
                diagram.option(args.value, "selectionChange");
                break;
            case "connectorCollectionChange":
            case "nodeCollectionChange":
                diagram.option(args.value, "collectionChanged");
                break;
            case "sizeChange":
                diagram.option(args.value, "sizeChanged");
                break;
            case "segmentChange":
                diagram.option(args.value, "segmentChanged");
                break;
            case "connectorTargetChange":
            case "connectorSourceChange":
                diagram.option(args.value, "endPointChanged");
                break;
            case "drag":
                diagram.option(args.value, "dragd");
                break;
            case "textChange":
                diagram.option(args.value, "textChanged");
                break;
            case "scrollChange":
                diagram.option(args.value, "scrollChanged");
                break;
            case "doubleClick":
                diagram.option(args.value, "doubleClickd");
                break;
            case "click":
                diagram.option(args.value, "clicked");
                break;
            case "connectionChange":
                diagram.option(args.value, "connectionChanged");
                break;
            case "contextMenuClick":
                diagram.option(args.value, "contextMenuClicked");
                break;
            case "mouseOver":
            case "mouseEnter":
            case "mouseLeave":
                diagram.option(args.value, "mouseEvents");
                break;
            default:
                diagram.option(args.value, "eventLog");
                break;
        }
    }
    else diagram.option(args.value, "");
}

function onClear() {
    jQuery.clearEventLog();
}

function selectionChange(args) {
    if (args.state === "changing") {
        if (args.element)
            jQuery.addEventLog(args.element.name + "<span class='eventTitle'> is selected </span>");
        else
            jQuery.addEventLog(args.oldItems.length + " <b> items </b><span class='eventTitle'> is cleared </span>");
    }
}

function collectionChanged(args) {
    if (args.state === "changed") {
        var type = args.elementType;
        if (args.changeType === "insert")
            jQuery.addEventLog(args.element.name + "<span class='eventTitle'> - " + type + " is added </span>");
        else
            jQuery.addEventLog(args.element.name + "<span class='eventTitle'> - " + type + " is removed </span>");
    }

}
function sizeChanged(args) {
    if (args.element) {
        var state = args.resizeState;
        if (state === "starting")
            state = "resize started";
        else if (state === "completed")
            state = "resize completed";
        jQuery.addEventLog(args.element.name + "<span class='eventTitle'> is " + state + "</span>");
    }
}
function textChanged(args) {
    jQuery.addEventLog(args.element.name + "<span class='eventTitle'> text value is changed </span>");
}

function segmentChanged(args) {
    var state = args.dragState;
    if (state === "starting")
        state = "segment change started";
    else if (state === "completed")
        state = "segment change completed";
    jQuery.addEventLog(args.element.name + "<span class='eventTitle'> is " + state + "</span>");
}

function scrollChanged(args) {
    jQuery.addEventLog(args.type + "<span class='eventTitle'> Event is Triggers through " + args.cause + " </span>");
}

function endPointChanged(args) {
    var state = args.dragState;
    var endPoint = "source";
    if (args.type === "connectorTargetChange")
        endPoint = "target";
    if (state === "starting")
        state = endPoint + " change started";
    else if (state === "completed")
        state = endPoint + " changed";
    jQuery.addEventLog(args.element.name + "<span class='eventTitle'> is " + state + "</span>");
}

function doubleClickd(args) {
    if (args.element && args.element.name)
        jQuery.addEventLog("Double Clicked on <span class='eventTitle'>" + args.element.name + "</span>");
    else
        jQuery.addEventLog("Double Clicked on <span class='eventTitle'> Diagram</span>");
}

function dragd(args) {
    if (args.element) {
        var state = args.dragState;
        if (state === "starting")
            state = "drag started";
        else if (state === "completed")
            state = "drag completed";
        jQuery.addEventLog(args.element.name + "<span class='eventTitle'> is " + state + "</span>");
    }
}

function eventLog(args) {
    jQuery.addEventLog(args.type + "<span class='eventTitle'> Event is raised </span>");
}

function mouseEvents(args) {
    jQuery.addEventLog(args.type + "On <span class='eventTitle'>" + args.element.name + "</span>");
}

function clicked(args) {
    if (args.element && args.element.name)
        jQuery.addEventLog("Clicked on <span class='eventTitle'>" + args.element.name + "</span>");
    else
        jQuery.addEventLog("Clicked on <span class='eventTitle'>  Diagram </span>");
}

function contextMenuClicked(args) {
    jQuery.addEventLog(args.text + "<span class='eventTitle'> context menu item is clicked </span>");
}