function nodeTemplate(diagram, node) {
    node.labels[0].text = node.Name;
}


function horizontalChange(args) {
    $("#DiagramWebControl1").ejDiagram({
        layout: {
            horizontalSpacing: args.value
        }
    });
}

function verticalChange(args) {
    $("#DiagramWebControl1").ejDiagram({
        layout: {
            verticalSpacing: args.value
        }
    });
}

function marginXChange(args) {
    $("#DiagramWebControl1").ejDiagram({
        layout: {
            marginX: args.value
        }
    });
}

function marginYChange(args) {
    $("#DiagramWebControl1").ejDiagram({
        layout: {
            marginY: args.value
        }
    });
}

function diagramCreate() {
    $("#DiagramWebControl1").ejDiagram("instance").fitToPage();
}
$(window).on("load", function () {
    var diagram;
    diagram = $("#DiagramWebControl1").ejDiagram("instance");
    $("#hide").hide();
    $("#sampleProperties").ejPropertiesPanel();
});

function changeorientation(args) {
    
   
    $("#DiagramWebControl1").ejDiagram({
        layout: {
            orientation: args.value
        }
    });
    $("#DiagramWebControl1").ejDiagram("instance").fitToPage();
}

