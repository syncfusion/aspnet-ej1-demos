$(window).on("load", function () {

    $("#sampleProperties").ejPropertiesPanel();
});
function changeoptions(args) {
    var node, diagram;
    diagram = $("#DiagramWebControl1").ejDiagram("instance");
    $("#DiagramWebControl1").ejDiagram({ tooltip: { relativeMode: ej.datavisualization.Diagram.RelativeMode[args.value] } });
}

function changehorizontalalign(args) {
    $("#DiagramWebControl1").ejDiagram({
        tooltip: {
            alignment: { horizontal: args.value }
        }
    });
}

function changeverticalalign(args) {
    $("#DiagramWebControl1").ejDiagram({
        tooltip: {
            alignment: { vertical: args.value }
        }
    });
}

function changemargin(args) {
    $("#DiagramWebControl1").ejDiagram({
        tooltip: {
            margin: { left: args.value, right: args.value, top: args.value, bottom: args.value }
        }
    });
}

//End region