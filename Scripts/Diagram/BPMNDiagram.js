var updateNode = true;
function diagramSelectionChange(args) {
    if (args.state == "changed") {
        var changeType = args.changeType;
        disableProperties();
        if (changeType && changeType != "remove") {
            $(".cols-prop-area").css("display", "block");
            if (args.element) {
                if (args.element.type === "bpmn")
                    enableProperties(args.element)
            }
        }
        else {
            $(".cols-prop-area").css("display", "none");
        }
    }
}

function disableProperties() {

    var ctrls = ["basic_shape1", "BPMNEvents1", "BPMNTriggers1", "BPMNGateways1", "BPMNDataObjects1", "BPMNActivity1",
    "BPMNLoops1", "BPMNTasks1", "BPMNSubProcess1", "BPMNBoundary1", "BPMNFlows1",
   "CompensationShape1", "TaskCall1", "AddHoc1", "BPMNCollection1"];

    for (var i in ctrls)
        $("#" + ctrls[i]).data("ejDropDownList").disable();


    var ids = ["basic_shape1_prop", "BPMNEvents1_prop", "BPMNTriggers1_prop", "BPMNGateways1_prop", "BPMNDataObjects1_prop",
   "BPMNActivity1_prop", "BPMNLoops1_prop", "BPMNTasks1_prop", "BPMNSubProcess1_prop", "BPMNBoundary1_prop",
   "BPMNFlows1_prop", "CompensationShape1_prop", "TaskCall1_prop", "AddHoc1_prop", "BPMNCollection1_prop"];
    for (var i in ids)
        $("#" + ids[i]).css("display", "none");

}

function matchItem(id, value) {
    var control = $('#' + id).data("ejDropDownList")
    $("#" + id + "_prop").css("display", "");
    var items = control.popupListItems;
    value = value.toLowerCase();
    for (var i = 0; i < items.length; i++) {
        var item1 = items[i].text.toLowerCase()
        if (item1 === value) {
            $('#' + id).data("ejDropDownList").selectItemByText(items[i].text);
        }
    }
}

function enableProperties(node) {
    updateNode = false;
    if (node) {
        shape = node.shape;
        switch (shape) {
            case "gateway":
                $('#BPMNGateways1').data("ejDropDownList").enable();
                matchItem("BPMNGateways1", node.gateway);
                break;
            case "dataobject":

                $('#BPMNDataObjects1').data("ejDropDownList").enable();
                if (node.data && node.data.type) matchItem("BPMNDataObjects1", node.data.type);

                $('#BPMNCollection1').data("ejDropDownList").enable();
                matchItem("BPMNCollection1", node.data.collection ? "Collection" : "None");
                break;
            case "activity":
                $('#BPMNLoops1').data("ejDropDownList").enable();
                if (node.activity == "task")
                    matchItem("BPMNLoops1", node.task.loop);
                else
                    matchItem("BPMNLoops1", node.subProcess.loop);

                $('#CompensationShape1').data("ejDropDownList").enable();
                if (node.activity == "task")
                    matchItem("CompensationShape1", node.task.compensation ? "Compensation" : "None");
                else
                    matchItem("CompensationShape1", node.subProcess.compensation ? "Compensation" : "None")

                $('#BPMNActivity1').data("ejDropDownList").enable();
                matchItem("BPMNActivity1", node.activity === "Task" ? "task" : "subprocess");

                matchItem("BPMNLoops1", node.subProcess.loop);
                if (node.activity == "task") {
                    $('#BPMNTasks1').data("ejDropDownList").enable();
                    matchItem("BPMNTasks1", node.task.type);

                    $('#TaskCall1').data("ejDropDownList").enable();
                    matchItem("TaskCall1", node.task.call ? "Call" : "None");
                }
                else {
                    $('#AddHoc1').data("ejDropDownList").enable();
                    matchItem("AddHoc1", node.subProcess.adhoc ? "Ad-Hoc" : "None");


                    $('#BPMNBoundary1').data("ejDropDownList").enable();
                    matchItem("BPMNBoundary1", node.subProcess.boundary);

                    $('#BPMNSubProcess1').data("ejDropDownList").enable();
                    matchItem("BPMNSubProcess1", node.subProcess.type);

                    if (node.subProcess.type == "event") {
                        $('#BPMNEvents1').data("ejDropDownList").enable();
                        matchItem("BPMNEvents1", node.subProcess.event);
                        $('#BPMNTriggers1').data("ejDropDownList").enable();
                        matchItem("BPMNTriggers1", node.subProcess.trigger);
                    }
                }
                break;
            case "event":
                $('#BPMNEvents1').data("ejDropDownList").enable();
                matchItem("BPMNEvents1", node.event);
                $('#BPMNTriggers1').data("ejDropDownList").enable();
                matchItem("BPMNTriggers1", node.trigger);
                break;
        }
    }
    updateNode = true;
}

function dropDownChanged(args) {
    if (updateNode) {
        var diagram = $("#DiagramContent").ejDiagram("instance");

        var menuselect = (args.model.targetID).split("_list")[0];
        var node = diagram.selectionList[0];
        var options = {}, loop;
        if (node && node.type === "bpmn") {
            options.task = {};
            options.subProcess = {};
            options.data = {};
            switch (menuselect) {
                case "BPMNTriggers1":
                    if (node.shape == "activity") options.subProcess.trigger = args.text.toLowerCase();
                    else options.trigger = args.text.toLowerCase();
                    break;
                case "BPMNEvents1":
                    var obj;
                    obj = ej.datavisualization.Diagram.BPMNEvents[args.text];
                    if (node.shape == "activity") options.subProcess.event = obj;
                    else options.event = obj;
                    break;
                case "BPMNGateways1":
                    options.gateway = ej.datavisualization.Diagram.BPMNGateways[args.text];
                    break;
                case "BPMNDataObjects1":
                    if (args.text === "Input") options.data.type = "input";
                    else if (args.text === "Output") options.data.type = "output";
                    else options.data.type = "none";
                    break;
                case "BPMNCollection1":
                    options.data.collection = (args.text === "Collection") ? true : false;
                    break;
                case "BPMNLoops1":
                    loop = ej.datavisualization.Diagram.BPMNLoops[args.text];
                    if (node.activity == "task") options.task.loop = loop;
                    else options.subProcess.loop = loop;
                    break;
                case "BPMNTasks1":
                    options.task.type = ej.datavisualization.Diagram.BPMNTasks[args.text];
                    break;
                case "BPMNSubProcess1":
                    options.subProcess.events = [];
                    if (args.text === "Default") options.subProcess.type = args.text.charAt(0).toUpperCase();
                    else if (args.text === "Event") options.subProcess.type = args.text.charAt(0).toUpperCase();
                    else if (args.text === "Transaction") {
                        options.subProcess.type = args.text.charAt(0).toUpperCase();
                        options.subProcess.events = [{ event: "intermediate", trigger: "cancel", offset: { x: 0.25, y: 1 } }, { event: "intermediate", trigger: "error", offset: { x: 0.75, y: 1 } }];
                    }
                    break;
                case "CompensationShape1":
                    if (node.activity == "task") options.task.compensation = (args.text === "Compensation") ? true : false;
                    else options.subProcess.compensation = (args.text === "Compensation") ? true : false;
                    break;
                case "AddHoc1":
                    options.subProcess.adhoc = (args.text === "Ad-Hoc") ? true : false;
                    break;
                case "TaskCall1":
                    options.task.call = (args.text === "Call") ? true : false;
                    break;
                case "BPMNBoundary1":
                    options.subProcess.boundary = ej.datavisualization.Diagram.BPMNBoundary[args.text];
                    break;
                case "BPMNActivity1":
                    options.activity = (args.text === "Task") ? "task" : "subprocess";
                    break;
                default:
                    return;
            }
            if (node.segments) diagram.updateConnector(node.name, { segments: node.segments, });
            else diagram.updateNode(node.name, options);
        }
    }
}

$(window).on("load", function () {
    $("#sampleProperties").ejPropertiesPanel();
});