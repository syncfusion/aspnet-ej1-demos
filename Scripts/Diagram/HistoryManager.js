$(window).on("load", function () {

    $("#sampleProperties").ejPropertiesPanel();
});

function DiagramStack(args) {
    var diagram = $("#DiagramContent").ejDiagram("instance");
    diagram.model.historyManager.stackLimit = args.value;
}

function undo(args) {
    var diagram = $("#DiagramContent").ejDiagram("instance");
    diagram.undo();
}

function redo(args) {
    var diagram = $("#DiagramContent").ejDiagram("instance");
    diagram.redo();
}

//end region
function historyChange(args) {
    getValue();
}

function clearHistory() {
    var diagram = $("#DiagramContent").ejDiagram("instance");
    diagram.clearHistory();
    getValue();
}
         

function getValue() {
    var diagram = $("#DiagramContent").ejDiagram("instance");
    var undoStack = diagram.model.historyManager.undoStack;
    var redoStack = diagram.model.historyManager.redoStack;

    var undoList = [];
    for (var i = 0; i < undoStack.length; i++) {
        undoList.push({ "text": undoStack[i].type, "value": undoStack[i].type });
    }

    var redoList = [];
    for (var i = 0; i < redoStack.length; i++) {
        redoList.push({ "text": redoStack[i].type, "value": redoStack[i].type });
    }
    $('#undoList').ejDropDownList({
        dataSource: undoList,
        fields: { text: "text", value: "text" },
        itemsCount: diagram.model.historyManager.stackLimit
    });

    $('#redoList').ejDropDownList({
        dataSource: redoList,
        fields: { text: "text", value: "text" },
        itemsCount: diagram.model.historyManager.stackLimit
    });

}
var nodeName = "";
function nodecollectionchange(args) {
    //getValue();
    if (args.changeType === "insert") {
        nodeName = args.element.name;
        $("#basicDialogToLoad").ejDialog("open");
    }
}

function onchange(args) {
    var diagram = $("#DiagramContent").ejDiagram("instance");
    $("#basicDialogToLoad").ejDialog("close");
    diagram.updateNode(nodeName, { source: "Images/" + args.value + ".png" });
}





//End region