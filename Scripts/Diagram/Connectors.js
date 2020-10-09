$(window).on("load", function () {
    $("#sampleProperties").ejPropertiesPanel();
});
function changeDrag() {
    updateConnectors("dragable", ej.datavisualization.Diagram.ConnectorConstraints.Drag);
}
function dragSource() {
    updateConnectors("dragablesource", ej.datavisualization.Diagram.ConnectorConstraints.DragSourceEnd);
}
function dragTarget() {
    updateConnectors("dragabletarget", ej.datavisualization.Diagram.ConnectorConstraints.DragTargetEnd);
}
function dragSegment() {
    updateConnectors("dragablesegment", ej.datavisualization.Diagram.ConnectorConstraints.DragSegmentThumb);
}
function changeLineBridge() {
    updateConnectors("bridge", ej.datavisualization.Diagram.ConnectorConstraints.Bridging);
}

function changeBridgeObstacle() {
    updateConnectors("bridgeobstacle", ej.datavisualization.Diagram.ConnectorConstraints.BridgeObstacle);
}

function changeDirection(args) {
    $("#DiagramWebControl1").ejDiagram({ bridgeDirection: args.value });
}
function updateConnectors(id, constraints) {
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    var checkbox = $("#" + id).ejCheckBox("instance");
    var selectedConnectors = getSelectedConnectors(diagram.model.selectedItems.children);
    var connectors = selectedConnectors.length ? selectedConnectors : diagram.model.connectors;
    for (var i = 0; i < connectors.length; i++) {
        var connector = connectors[i];
        if (diagram.getObjectType(connector) == "connector") {
            diagram.updateConnector(connector.name, {
                constraints: checkbox.isChecked() ?
                    connector.constraints | constraints : connector.constraints & ~constraints
            });
        }
    }
}

//Modify the segment type
function changeSegment(args) {
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    var selectedConnectors = getSelectedConnectors(diagram.model.selectedItems.children);
    var connectors = selectedConnectors.length ? selectedConnectors : diagram.model.connectors;
    for (var i = 0; i < connectors.length; i++) {
        var connector = connectors[i];
        if (args.value == "orthogonal") {
            diagram.updateConnector(connector.name, { segments: connector.addInfo.segments });
        }
        else
            diagram.updateConnector(connector.name, { segments: [{ type: args.value }] });
    }
}

//Update the corner radius
function changeCornerRadius(args) {
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    var selectedConnectors = getSelectedConnectors(diagram.model.selectedItems.children);
    var connectors = selectedConnectors.length ? selectedConnectors : diagram.model.connectors;
    for (var i = 0; i < connectors.length; i++) {
        var connector = connectors[i];
        diagram.updateConnector(connector.name, { cornerRadius: args.value });
    }
}

//Selection change event handler
function selectionchanged(args) {
    if (args.state === "changing") {
        var diagram = $("#DiagramWebControl1").ejDiagram("instance");
        var ConnectorConstraints = ej.datavisualization.Diagram.ConnectorConstraints;
        var selectedConnectors = getSelectedConnectors(args.selectedItems);
        var connectors = selectedConnectors.length ? selectedConnectors : diagram.model.connectors;
        updateCheckBox("dragable", connectors, ConnectorConstraints.Drag);
        updateCheckBox("dragablesource", connectors, ConnectorConstraints.DragSourceEnd);
        updateCheckBox("dragabletarget", connectors, ConnectorConstraints.DragTargetEnd);
        updateCheckBox("dragablesegment", connectors, ConnectorConstraints.DragSegmentThumb);
        updateCheckBox("bridge", connectors, ConnectorConstraints.Bridging);
        updateCheckBox("bridgeobstacle", connectors, ConnectorConstraints.BridgeObstacle);

        var checked;
        var radius = connectors[0].cornerRadius;
        for (i = 1; i < connectors.length; i++) {
            if (radius != connectors[i].cornerRadius) {
                $("#cornerRadius").ejNumericTextbox({ enabled: false });
                checked = true;
                break;
            }
        }
        if (!checked) {
            $("#cornerRadius").ejNumericTextbox({ enabled: true });
            $("#cornerRadius").ejNumericTextbox({ value: radius });
        }
    }
}

//Get the selected connectors
function getSelectedConnectors(selectedItems) {
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    var connectors = [];
    for (var i = 0; i < selectedItems.length; i++) {
        if (diagram.getObjectType(selectedItems[i]) == "connector")
            connectors.push(selectedItems[i]);
    }
    return connectors;
}

//Update the check boxes based on the selected connectors
function updateCheckBox(id, connectors, constraints) {
    var enabled, connector, checked;
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    enabled = connectors[0].constraints & constraints ? true : false;
    if (connectors.length == 1) $("#" + id).ejCheckBox({ enabled: enabled });
    else {
        for (var i = 1; i < connectors.length; i++) {
            connector = connectors[i];
            if (diagram.getObjectType(connector) == "connector") {
                if ((connector.constraints & constraints ? true : false) != enabled) {
                    $("#" + id).ejCheckBox({ enabled: false });
                    checked = true;
                    break;
                }
            }
        }
    }
    if (!checked) {
        $("#" + id).ejCheckBox({ enabled: true });
        $("#" + id).ejCheckBox({ checked: enabled });
    }
}