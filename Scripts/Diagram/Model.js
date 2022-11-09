$(window).on("load", function () {
    $("#sampleProperties").ejPropertiesPanel();
});


function changeDirection(args) {
    $("#Diagrammodel").ejDiagram({ bridgeDirection: args.value });
}

function changeWidth(args) {
    $("#Diagrammodel").ejDiagram({ width: args.value });
}

function changeHeight(args) {
    $("#Diagrammodel").ejDiagram({ height: args.value });
}

function contextMenu(args) {

    $("#Diagrammodel").ejDiagram({ enableContextMenu: args.isChecked });

}

function changeColor(args) {
    $("#Diagrammodel").ejDiagram({ backgroundColor: args.value });
}

function constraintschecked(args) {
    if (args.isChecked) {
        if (args.value === "None")
            $("#Diagrammodel").ejDiagram({ constraints: ej.datavisualization.Diagram.DiagramConstraints.None });
        else
            $("#Diagrammodel").ejDiagram({ constraints: ej.datavisualization.Diagram.DiagramConstraints.Default | ej.datavisualization.Diagram.DiagramConstraints[args.value] });
    }
    else {
        if (args.value === "None")
            $("#Diagrammodel").ejDiagram({ constraints: ej.datavisualization.Diagram.DiagramConstraints.None });
        else
            $("#Diagrammodel").ejDiagram({ constraints: ej.datavisualization.Diagram.DiagramConstraints.Default & ~ej.datavisualization.Diagram.DiagramConstraints[args.value] });
    }
}

function changeAlignment(args) {
    $("#Diagrammodel").ejDiagram({ backgroundImage: { alignment: args.value } });
}

function changeScale(args) {
    $("#Diagrammodel").ejDiagram({ backgroundImage: { scale: args.value } });
}


