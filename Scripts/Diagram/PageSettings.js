
function diagramCreate() {
    $("#sampleProperties").ejPropertiesPanel();
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    diagram.fitToPage();
}

function propertyChange(args) {
    var option = {};
    var isPageSettings = true;
    switch (args.model.cssClass) {
        case "pageHeight":
            option.pageHeight = args.value;
            break;
        case "pageWidth":
            option.pageWidth = args.value;
            break;
        case "multiplePage":
            option.multiplePage = checkbox.isChecked;
            break;
        case "pageBorderWidth":
            option.pageBorderWidth = args.value;
            break;
        case "pageBackgroundColor":
            option.pageBackgroundColor = args.value;
            break;
        case "pageBorderColor":
            option.pageBorderColor = args.value;
            break;
        case "pageMargin":
            option.pageMargin = args.value;
            break;
        case "showPageBreak": 
            option.showPageBreak = args.isChecked;
            break;
        case "pageOrientation":
            option.pageOrientation = args.value;
            break;
        case "boundaryConstraints":
            option.boundaryConstraints = args.value;
            break;
        case "enableSnapToObject":
            isPageSettings = false;
            var checkbox = $("#snaping").ejCheckBox("instance");
            option.enableSnapToObject = checkbox.isChecked;
            break;
        case "snapAngle":
            isPageSettings = false;
            option.snapAngle = args.value;
            break;
        case "snapObjectDistance":
            isPageSettings = false;
            option.snapObjectDistance = args.value;
            break;
        case "snapConstraints":
            isPageSettings = false;
            var snap = ej.datavisualization.Diagram.SnapConstraints[args.value];
            option.snapConstraints = snap;
            break;
    }
    if (option) {
        if (isPageSettings) $("#DiagramWebControl1").ejDiagram({ pageSettings: option });
        else $("#DiagramWebControl1").ejDiagram({ snapSettings: option });
    }
}