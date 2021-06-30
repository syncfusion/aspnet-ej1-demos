
function create(args) {

    var div = document.getElementsByClassName("sample-header")[0];
    div.style.display = "";
    div = document.getElementsByClassName("sample-main")[0];
    div.style.display = "";
    div = document.getElementsByClassName("diagram-dialog")[0];
    div.style.display = "";

    /*
        We have used lot of syncfusion controls to customize the node, connector and label appearance.
        The tab control is used to split it based on the object.
    */
    $("#tabContent").ejTab({
        itemActive: "tabItemChanged"
    });

    $("#DiagramContent").ejDiagram({
        selectedItems: {
            userHandles: createUserHandles()
        }
    });


    diagram = $("#DiagramContent").ejDiagram("instance");

    diagram._modified = false;
    diagram._selectedObject = new SelectorVMClass(); 
    updateSize();
    setToolTip(true);
    setDiagramSize();

    /*
    The below event will be triggered when mouse hover and mouse leave on the toolbar item.
    Since we have customized the parent element appearance in the "toolbarMouseEvent" function,
    We couldnt achieve this requirement via cssClass.
*/
    $(".tb-item-child").mouseover(function (evt) {
        toolbarMouseEvent(evt);
    });

    $(".tb-item-child").mouseout(function (evt) {
        toolbarMouseEvent(evt);
    });

    /*
        We have provided the enable/disable option for Overview, SnapToGrid, SmartGrid and Grid lines.
        When mouse hover on those menu item, we will highlight the image icon via cssClass. 
        you can refer this cssClass (iconhover) definition in diagrambuilder.css file.
    */
    $(".menu-item-anchor").mouseover(function (evt) {
        $("#" + evt.target.parentNode.id).find("span").addClass("iconhover");
    });
    $(".menu-item-anchor").mouseout(function (evt) {
        $("#" + evt.target.parentNode.id).find("span").removeClass("iconhover");
    });
}

function ddlColorCreate(args) {
    /*
        The below event will be triggered when mouse hover on the color palette element.
        We will highlight selected color on mouse hover and will retain to normal state once mouse leaves.
    */
    $(".ddl-color-list").mouseover(function (evt) {
        evt.target.style.width = "26px";
        evt.target.style.height = "26px";
        evt.target.style.border = "3px solid";
        evt.target.style.borderColor = "#3A3A3A";
    });

    $(".ddl-color-list").mouseout(function (evt) {
        evt.target.style.width = "30px";
        evt.target.style.height = "30px";
        evt.target.style.border = "1px solid";
        evt.target.style.borderColor = "#3A3A3A";
    });

    /*
        The below event will be triggered when mouse down on color palette item. 
        Based on the dropdown control, we will update the node, connector, label and diagram properties. 
    */
    $(".ddl-color-list").mousedown(function (evt) {
        var target = evt.target;
        while (target.parentNode && !target.parentNode.id) {
            target = target.parentNode;
        }
        var id = target.parentNode.id;
        id = id.split('_')[0];
        if (id === "pageBackgroundColor") {
            // update the diagram pageBackground Color
            setBackgroundColor(evt.target);
        }
        else {
            // update the node's fillColor/BorderColor, label's fontColor and connector's lineColor based on the dropdown id.
            PropertyChangesFromPanel(evt.target, id);
        }
    });
}