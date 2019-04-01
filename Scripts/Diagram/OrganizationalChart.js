//region event handlers
$(window).on("load", function () {
    hideSubTreeOptions();

    //Property panel
    $("#sampleProperties").ejPropertiesPanel();

    //Ej check box to expand or collapse nodes
    $("#expand").ejCheckBox({
        change: function (args) {
            var diagram = $("#ProjectChart").ejDiagram("instance");
            if (diagram.model.selectedItems.length != 0)
            diagram.updateNode(diagram.model.selectedItems.children[0].name, { isExpanded: args.isChecked ? true : false })
        }
    });

    //Drop down list to change subtree orientation
    $("#orientation").ejDropDownList({
        text: "VERTICAL", value: "Vertical", targetID: "horizontalVertical", width: "130px",
        change: function (args) {
            updateSubTreeOrientation({ orientation: args.value });
            if (args.value == "horizontal") {
                $("#typeCenter").show();
                $("#typeAlter").hide();
            }
            else if (args.value == "vertical") {
                $("#typeCenter").hide();
                $("#typeAlter").show();
            }
        }
    });

    //Drop down to change the vertical subtree orientation
    $("#typeAlternate").ejDropDownList({
        watermarkText: "Type", targetID: "rightLeftAlternate", text: "ALTERNATE", value: "alternate", width: "130px",
        change: function (args) {
            updateSubTreeOrientation({ type: args.value });
        }
    });

    //Drop down to change the horizontal subtree orientation
    $("#typeCentered").ejDropDownList({
        watermarkText: "Type", text: "CENTER", value: "center", width: "130px", targetID: "rightLeftCenter",
        change: function (args) {
            updateSubTreeOrientation({ type: args.value });
        }
    });

});

//Selection change event
function selectionChanged(args) {
    if (args.state === "changing") {
        var node, expanded;
        if (args.selectedItems.length == 1 && args.selectedItems[0].type == "basic") {
            node = args.selectedItems[0];
            expanded = node.isExpanded;
            hideSubTreeOptions(node.outEdges.length);
            $("#expand").ejCheckBox({ checked: expanded ? true : false });
            $("#orientation").ejDropDownList({ checked: expanded ? true : false });
            $("#typeAlternate").ejDropDownList({ checked: expanded ? true : false });
            $("#typeCentered").ejDropDownList({ checked: expanded ? true : false });
            if (node.addInfo.orientation) {
                $("#orientation").ejDropDownList({ value: node.addInfo.orientation });
            }
            if (node.addInfo.type) {
                if (node.addInfo.type !== "center")
                    $("#typeAlternate").ejDropDownList({ value: node.addInfo.type });
                if (node.addInfo.type !== "alternate")
                    $("#typeCentered").ejDropDownList({ value: node.addInfo.type });
            }
        }
        else {
            hideSubTreeOptions();
        }
    }
}

//click event handler
function diagramClick(args) {
    if (!args.element || args.element.type != "basic") {
        var diagram = $("#ProjectChart").ejDiagram("instance");
        diagram.clearSelection();
    }
}

$(window).on("load", function () {
    //Hide all dropdowns on loading
    hideSubTreeOptions();
});

//Bind custom JSON with node properties
function nodeTemplate(diagram, node) {
    node.labels[0].text = node.Function;
    node.fillColor = node.Color;

    if (node.Id == "parent") {
        node.fillColor = "#3484bb";
    }
    if (node.Phase == "parent") {
        node.fillColor = "#9ace7f";
    }
    if (node.Phase == "1") {
        node.fillColor = "#9264aa";
    }
    if (node.Phase == "2") {
        node.fillColor = "#9264aa";
    }
    if (node.Phase == "3") {
        node.fillColor = "#9264aa";
    }
}

//Customize layout orientation
function getLayoutInfo(diagram, node, options) {
    if (!options.hasSubTree) {
        options.orientation = node.addInfo.orientation;
        options.type = node.addInfo.type;
    }
}

//Update layout orientation
function changeOrientation(args) {
    var marginx = 0, marginy = 0;
    switch (args.value) {
        case "toptobottom":
            marginy = 50;
            break;
        case "bottomtotop":
            marginy = 100;
            break;
        case "lefttoright":
            marginx = 10;
            break;
        case "righttoleft":
            marginx = -150;
            break;
    }
    $("#ProjectChart").ejDiagram({
        layout: {
            orientation: args.value,
            marginX: marginx,
            marginY: marginy
        }
    });
    $("#marginX").ejNumericTextbox({ value: marginx });
    $("#marginY").ejNumericTextbox({ value: marginy });
}


//Update horizontal spacing
function changeHorizontalSpacing(args) {
    $("#ProjectChart").ejDiagram({
        layout: {
            horizontalSpacing: args.value
        }
    });
}

//Update vertical spacing
function changerVerticalSpacing(args) {
    $("#ProjectChart").ejDiagram({
        layout: {
            verticalSpacing: args.value
        }
    });
}

//Update layout margin
function changeMarginX(args) {
    $("#ProjectChart").ejDiagram({
        layout: {
            marginX: args.value
        }
    });
}

//Update layout margin
function changeMarginY(args) {
    $("#ProjectChart").ejDiagram({
        layout: {
            marginY: args.value
        }
    });
}
//endregion

//region helper methods

function updateSubTreeOrientation(options) {
    var diagram = $("#ProjectChart").ejDiagram("instance");
    if (diagram.model.selectedItems.children[0]) {
        var selectedNode = diagram.model.selectedItems.children[0];
        if (options.type) { selectedNode.addInfo.type = options.type; }
        if (options.orientation) { selectedNode.addInfo.orientation = options.orientation; }
        diagram.model.layout.fixedNode = selectedNode.name;
        diagram.layout();
        diagram.addSelection(selectedNode);
    }
}

function hideSubTreeOptions(show) {
    if (show) {
        $("#expandHide").show();
        $("#orientationHide").show();
        $("#typeAlter").show();
    }
    else {
        $("#expandHide").hide();
        $("#orientationHide").hide();
        $("#typeAlter").hide();
        $("#typeCenter").hide();
    }
}

//endregion