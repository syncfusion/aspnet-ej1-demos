﻿$(window).on("load", function () {
    $("#DiagramWebControl1").ejDiagram({
        selectedItems: { userHandles: userHandle },
    });
    // Properties Panel
    $("#sampleProperties").ejPropertiesPanel();

    var data = [
        { category: "Image", value: "image", text: "Image1", eimg: "Icons-32" },
        { category: "Path", value: "path", text: "Path1", eimg: "Clone-01" },
    ];
    //Dropdown to change the shape
    $('#shape').ejDropDownList({
        width: "100%",
        watermarkText: "Select a shape type",
        change: "changed",
        cssClass: "shape",
        dataSource: data,
        fields: { text: "skill", category: "category" },
        allowGrouping: true,
        enableloadOnDemand: false,
        template: '<div><img class="eimg" src="../Content/images/diagram/${eimg}.png" alt="ShapeType"/>' +
            '<div class="ename"> ${text} </div>'
    });

});
var SettingsTool = (function (base) {
    ej.datavisualization.Diagram.extend(SettingsTool, base);
    function SettingsTool(name) {
        base.call(this, name);
        this.singleAction = true;
        this.cursor = "pointer";
    }
    SettingsTool.prototype.mouseup = function (evt) {
		$(".cols-prop-area").css("display", "block");
        base.prototype.mouseup.call(this, evt);
    }
    return SettingsTool;
})(ej.datavisualization.Diagram.ToolBase);

var userHandle = [];
var settingHandle = ej.datavisualization.Diagram.UserHandle();
settingHandle.name = "Settings";
settingHandle.size = 30;
settingHandle.margin = { right: -25, bottom: -25 };
settingHandle.offset = ej.datavisualization.Diagram.Point(1, 1);
settingHandle.horizontalAlignment = ej.datavisualization.Diagram.HorizontalAlignment.Center;
settingHandle.verticalAlignment = ej.datavisualization.Diagram.VerticalAlignment.Center;
settingHandle.borderWidth = 0;
settingHandle.tool = new SettingsTool(settingHandle.name);
settingHandle.size = 30;
settingHandle.borderWidth = 0;
settingHandle.backgroundColor = "#4D4D4D";
settingHandle.pathData = "M22.0542,27.332C20.4002,27.332,19.0562,25.987,19.0562,24.333C19.0562,22.678,20.4002,21.333,22.0542,21.333C23.7082,21.333,25.0562,22.678,25.0562,24.333C25.0562,25.987,23.7082,27.332,22.0542,27.332 M30.6282,22.889L28.3522,22.889C28.1912,22.183,27.9142,21.516,27.5272,20.905L29.1392,19.293C29.3062,19.126,29.3062,18.853,29.1392,18.687L27.7032,17.251C27.6232,17.173,27.5152,17.125,27.3982,17.125C27.2862,17.125,27.1782,17.173,27.0952,17.251L25.4872,18.863C24.8732,18.476,24.2082,18.201,23.5002,18.038L23.5002,15.762C23.5002,15.525,23.3092,15.333,23.0732,15.333L21.0422,15.333C20.8062,15.333,20.6122,15.525,20.6122,15.762L20.6122,18.038C19.9072,18.201,19.2412,18.476,18.6292,18.863L17.0192,17.252C16.9342,17.168,16.8242,17.128,16.7162,17.128C16.6052,17.128,16.4972,17.168,16.4112,17.252L14.9752,18.687C14.8952,18.768,14.8492,18.878,14.8492,18.99C14.8492,19.104,14.8952,19.216,14.9752,19.293L16.5872,20.905C16.2002,21.516,15.9242,22.183,15.7642,22.889L13.4852,22.889C13.2502,22.889,13.0572,23.08,13.0572,23.316L13.0572,25.35C13.0572,25.584,13.2502,25.777,13.4852,25.777L15.7612,25.777C15.9242,26.486,16.2002,27.15,16.5872,27.764L14.9752,29.374C14.8092,29.538,14.8092,29.813,14.9752,29.979L16.4112,31.416C16.4912,31.494,16.6022,31.541,16.7162,31.541C16.8272,31.541,16.9382,31.494,17.0192,31.416L18.6252,29.805C19.2412,30.191,19.9072,30.467,20.6122,30.63L20.6122,32.906C20.6122,33.141,20.8062,33.333,21.0422,33.333L23.0732,33.333C23.3092,33.333,23.5002,33.141,23.5002,32.906L23.5002,30.63C24.2082,30.467,24.8732,30.191,25.4872,29.805L27.0952,31.416C27.1812,31.499,27.2892,31.541,27.3982,31.541C27.5102,31.541,27.6202,31.499,27.7032,31.416L29.1392,29.979C29.2202,29.899,29.2662,29.791,29.2662,29.677C29.2662,29.563,29.2202,29.453,29.1392,29.374L27.5312,27.764C27.9142,27.149,28.1912,26.486,28.3522,25.777L30.6282,25.777C30.8652,25.777,31.0552,25.584,31.0552,25.35L31.0552,23.316C31.0552,23.08,30.8652,22.889,30.6282,22.889";
settingHandle.visible = "true";
userHandle.push(settingHandle);
//End region

function selectionChanged(args) {
    if (args.state === "changing") {
        if (args.changeType !== "insert")
            $(".cols-prop-area").css("display", "none");
    }
}

var isBinding = false;
function changed(args) {
    var diagram = $("#DiagramWebControl1").ejDiagram("instance");
    var handles = diagram.model.selectedItems.userHandles;
    var options = args.model.cssClass;
    switch (options) {
        case "shape":
            handles[0].backgroundColor = "Goldenrod"
            if (args.value != "path") {
                handles[0].source = "../Content/images/diagram/Icons-32.png";
            }
            else {
                handles[0].backgroundColor = "black";
                handles[0].pathData = "M60.3,18H27.5c-3,0-5.5,2.4-5.5,5.5v38.2h5.5V23.5h32.7V18z M68.5,28.9h-30c-3,0-5.5,2.4-5.5,5.5v38.2c0,3,2.4,5.5,5.5,5.5h30c3,0,5.5-2.4,5.5-5.5V34.4C73.9,31.4,71.5,28.9,68.5,28.9z M68.5,72.5h-30V34.4h30V72.5z";
            }
            handles[0].shape = args.value;
            break;
        case "offsetx":
            handles[0].offset.x = args.value;
            break;
        case "offsety":
            handles[0].offset.y = args.value;
            break;
        case "horizontalalignment":
            handles[0].horizontalAlignment = args.value;
            break;
        case "verticalalignment":
            handles[0].verticalAlignment = args.value;
            break;
        case "size":
            handles[0].size = args.value;
            break;
        case "backgroundcolor":
            handles[0].backgroundColor = args.value;
            break;
        case "bordercolor":
            handles[0].borderColor = args.value;
            break;
        case "borderwidth":
            handles[0].borderWidth = args.value;
            break;
        case "pathcolor":
            handles[0].pathColor = args.value;
            break;
        default:
            return;
    }
	diagram.updateUserHandles(diagram.model.selectedItems.children[0]);
}