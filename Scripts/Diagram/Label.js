$(window).on("load", function () {
    $("#sampleProperties").ejPropertiesPanel();
    $(".hideNewText").css("display", "none");
});
function labelcollectionChange(args) {
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    if (args.value == "newLabel")
        addnewlabelbinding();
    else {
        var index = $('#labelcollection').ejDropDownList("instance").value();
        binding(diagram.selectionList[0].labels[Number(index)]);
        $(".hideNewText").css("display", "none");
    }
}
function propertyChange(args, propName) {
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    var index = $('#labelcollection').ejDropDownList("instance").value();
    var option = {};
    switch (args.model.cssClass) {
        case "offsetX":
            option.offset = { x: args.value };
            break;
        case "offsetY":
            option.offset = { y: args.value };
            break;
        case "rotateAngle":
            option.rotateAngle = args.value;
            break;
        case "fontColor":
            option.fontColor = args.value;
            break;
        case "fontSize":
            option.fontSize = args.value;
            break;
        case "fontFamily":
            option.fontFamily = args.value;
            break;
        case "horizontalAlignment":
            option.horizontalAlignment = args.value;
            break;
        case "verticalAlignment":
            option.verticalAlignment = args.value;
            break;
        case "textDecoration":
            option.textDecoration = args.value;
            break;
        case "wrapping":
            option.wrapping = args.value;
            break;
    }
    if (option && index && index != "newLabel")
        diagram.updateLabel(diagram.selectionList[0].name, diagram.selectionList[0].labels[Number(index)], option);
}

function enabledisable(value) {
    $("#fontsize").ejNumericTextbox(value);
    $("#offsetX").ejNumericTextbox(value);
    $("#offsetY").ejNumericTextbox(value);
    $("#rotateAngle").ejNumericTextbox(value);
    $("#fontcolor").ejDropDownList(value);
    $("#horizontalalignment").ejDropDownList(value);
    $("#verticalalignment").ejDropDownList(value);
    $("#textdecoration").ejDropDownList(value);
    $("#textwrapping").ejDropDownList(value);
    $("#fontfamily").ejDropDownList(value);
    $("#labelcollection").ejDropDownList(value);
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
    var labelcollection = []; var node = diagram.selectionList[0];
    if (node && node.labels.length) {
        for (var i = 0; i < node.labels.length; i++) {
            labelcollection.push({ "text": node.labels[i].name, "value": i });
        }
        labelcollection.push({ "text": "newLabel", "value": "newLabel" });
    }
    $('#labelcollection').ejDropDownList({
        dataSource: labelcollection,
    });
    var target = $('#labelcollection').data("ejDropDownList");
    target.option({ selectedIndex: 0 });
}
function binding(labels) {
    $("#fontsize").ejNumericTextbox({ value: labels.fontSize });
    $("#offsetX").ejNumericTextbox({ value: labels.offset.x });
    $("#offsetY").ejNumericTextbox({ value: labels.offset.y });
    $("#rotateAngle").ejNumericTextbox({ value: labels.rotateAngle });
    $("#fontcolor").ejDropDownList({ value: labels.fontColor });
    $("#horizontalalignment").ejDropDownList({ value: labels.horizontalAlignment });
    $("#verticalalignment").ejDropDownList({ value: labels.verticalAlignment });
    $("#textdecoration").ejDropDownList({ value: labels.textDecoration });
    $("#textwrapping").ejDropDownList({ value: labels.wrapping });
    $("#fontfamily").ejDropDownList({ value: labels.fontFamily });
}

function addnewlabelbinding() {
    var labels = ej.datavisualization.Diagram.LabelDefaults;
    binding(labels);
    $(".hideNewText").css("display", "block");
}
function addnewlabel() {
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    var rotateAngle = Number(document.getElementById("rotateAngle").value);
    var fontColor = document.getElementById("fontcolor").value;
    var fontSize = Number(document.getElementById("fontsize").value);
    var fontFamily = document.getElementById("fontfamily").value;
    var horizontalAlignment = document.getElementById("horizontalalignment").value;
    var offsetX = Number(document.getElementById("offsetX").value);
    var offsetY = Number(document.getElementById("offsetY").value);
    var verticalAlignment = document.getElementById("verticalalignment").value;
    var textDecoration = document.getElementById("textdecoration").value;
    var wrapping = document.getElementById("textwrapping").value;
    var text = document.getElementById("text").value;
    var label = {
        name: "label" + ej.datavisualization.Diagram.Util.randomId(), horizontalAlignment: horizontalAlignment, verticalAlignment: verticalAlignment,
        rotateAngle: rotateAngle, fontColor: fontColor, fontSize: fontSize, fontFamily: fontFamily, offset: { x: offsetX, y: offsetY }, textDecoration: textDecoration,
        wrapping: wrapping, text: text,
    };
    diagram.addLabel(diagram.selectionList[0].name, label);
    dropdownlist();
    $(".hideNewText").css("display", "none");
}