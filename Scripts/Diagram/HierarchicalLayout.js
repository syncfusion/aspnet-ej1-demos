function nodeTemplate(diagram, node) {
    node.labels[0].text = node.Name;
}

function selectionChange(args) {
    if (args.state === "changing") {
        if (args.selectedItems.length == "1") {
            $("#hide").show();
            if (args.selectedItems[0].isExpanded) {
                $("#expand").ejCheckBox({
                    "checked": true
                });
            }

            else {
                $("#expand").ejCheckBox({
                    "checked": false
                });
            }
        }
        else {
            $("#hide").hide();

        }
    }
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

$("#expand").ejCheckBox({
    "change": function (args) {
        var diagram = $("#DiagramWebControl1").ejDiagram("instance");
        if (diagram.model.selectedItems.length != 0)
            diagram.updateNode(diagram.model.selectedItems.children[0].name, { isExpanded: args.isChecked ? true : false })
    }
});
$(window).on("load", function () {
    var diagram;
    diagram = $("#DiagramWebControl1").ejDiagram("instance");
    $("#hide").hide();
    $("#sampleProperties").ejPropertiesPanel();
});

function changeorientation(args) {
    var marginx = 0, marginy = 0;
    switch (args.value) {
        case "toptobottom":
        case "bottomtotop":
            marginy = 50;
            break;
        case "lefttoright":
            marginx = 10;
            break;
        case "righttoleft":
            marginx = -150;
            break;
    }
    $("#DiagramWebControl1").ejDiagram({
        layout: {
            orientation: args.value,
            marginX: marginx,
            marginY: marginy
        }
    });

    $("#marginX").ejNumericTextbox({ value: marginx });
    $("#marginY").ejNumericTextbox({ value: marginy });
}
function changeexpand(args) {
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    diagram.updateNode(diagram.model.selectedItems.children[0].name, { isExpanded: args.isChecked ? true : false })
}
