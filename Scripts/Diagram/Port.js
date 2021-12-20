$(window).on("load", function () {
    $("#sampleProperties").ejPropertiesPanel();
    $(".hideNewText").css("display", "none");
});

function portcollectionChange(args) {
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    if (args.value == "newPort")
        addnewportbinding();
    else {
        var index = $('#portcollection').ejDropDownList("instance").value();
        binding(diagram.selectionList[0].ports[Number(index)]);
        $(".hideNewText").css("display", "none");
    }
}

function propertyChange(args) {
    if (!isBinding) {
        var diagram = $("#DiagramWebControl1").ejDiagram("instance");
        var index = $('#portcollection').ejDropDownList("instance").value();
        var option = {};
        switch (args.model.cssClass) {
            case "visibility":
                option.visibility = Number(args.value);
                break;
            case "offsetX":
                option.offset = { x: args.value };
                break;
            case "offsetY":
                option.offset = { y: args.value };
                break;
            case "borderWidth":
                option.borderWidth = args.value;
                break;
            case "size":
                option.size = args.value;
                break;
            case "fillColor":
                option.fillColor = args.value;
                break;
            case "borderColor":
                option.borderColor = args.value;
                break;
            case "shape":
                option.shape = args.value;
                if (option.shape === "path" && index && index != "newPort") {
                    var port = diagram.selectionList[0].ports[Number(index)];
                    port.pathData = "M6.805,0L13.61,10.703L0,10.703z";
                }
                break;
        }
        if (args.model.cssClass != "setTool" && option && index && index != "newPort") {
            var port = diagram.selectionList[0].ports[Number(index)];
            if (option.visibility) {
                if (args.isChecked) {
                    option.visibility = port.visibility | option.visibility;
                }
                else {
                    option.visibility = port.visibility & ~option.visibility;
                }
            }
            diagram.updatePort(diagram.selectionList[0].name, port, option);
        }
        else diagram.clearSelection();
    }
}

function SetTool(args) {
    var value = document.getElementById("setTool").value;
    if (value === "drag") {
        args.action = ej.datavisualization.Diagram.ActiveTool.Drag;
    }
    else if (value === "draw") {
        args.action = ej.datavisualization.Diagram.ActiveTool.Draw;
    }
}

var isBinding = false;
function enabledisable(value) {
    $("#offsetX").ejNumericTextbox(value);
    $("#offsetY").ejNumericTextbox(value);
    $("#borderwidth").ejNumericTextbox(value);
    $("#portsize").ejNumericTextbox(value);
    $("#setTool").ejDropDownList(value);
    $("#background").ejDropDownList(value);
    $("#backgroundborder").ejDropDownList(value);
    $("#portshape").ejDropDownList(value);
    $("#visibility").ejDropDownList(value);
    $("#portcollection").ejDropDownList(value);
}
function selectionChange(args) {
    enabledisable("disable");
    if (args.state === "changed" && args.element && args.element.type != "connector" && args.changeType === "insert") {
        dropdownlist();
        enabledisable("enable");
    }
    $(".hideNewText").css("display", "none");
}
function dropdownlist() {
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    var portcollection = []; var node = diagram.selectionList[0];
    if (node && node.ports.length) {
        for (var i = 0; i < node.ports.length; i++) {
            portcollection.push({ "text": node.ports[i].name, "value": i });
        }
        portcollection.push({ "text": "newPort", "value": "newPort" });
    }
    $('#portcollection').ejDropDownList({
        dataSource: portcollection,
    });
    var target = $('#portcollection').data("ejDropDownList");
    if(target)
    target.option({ selectedIndex: 0 });
}
function binding(ports) {
    isBinding = true;
    $("#offsetX").ejNumericTextbox({ value: ports.offset.x });
    $("#offsetY").ejNumericTextbox({ value: ports.offset.y });
    $("#portshape").ejDropDownList({ value: ports.shape });
    $("#visibility").ejDropDownList({ value: ports.visibility });
    $("#borderwidth").ejNumericTextbox({ value: ports.borderWidth });
    $("#background").ejDropDownList({ value: ports.fillColor });
    $("#backgroundborder").ejDropDownList({ value: ports.borderColor });
    $("#portsize").ejNumericTextbox({ value: ports.size });
    isBinding = false;
}

function addnewportbinding() {
    var ports = ej.datavisualization.Diagram.PortDefaults;
    binding(ports);
    $(".hideNewText").css("display", "block");
}
function addnewport() {
    var pathData;
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    var borderWidth = Number(document.getElementById("borderwidth").value);
    var fillColor = document.getElementById("background").value;
    var PortSize = Number(document.getElementById("portsize").value);
    var PortShape = document.getElementById("portshape").value;
    var BorderColor = document.getElementById("backgroundborder").value;
    var offsetX = Number(document.getElementById("offsetX").value);
    var offsetY = Number(document.getElementById("offsetY").value);
    var visibility = document.getElementById("visibility").value;
    if (PortShape === "path")
        pathData = "M6.805,0L13.61,10.703L0,10.703z";
    var port = [{
        name: "port" + ej.datavisualization.Diagram.Util.randomId(), borderColor: BorderColor, borderWidth: borderWidth,
        fillColor: fillColor, shape: PortShape, pathData: pathData ? pathData : "", size: PortSize, visibility: visibility, offset: { x: offsetX, y: offsetY }
    }];
    diagram.addPorts(diagram.selectionList[0].name, port);
    dropdownlist();
    $(".hideNewText").css("display", "none");
}
