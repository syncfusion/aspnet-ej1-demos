$(window).on("load", function () {
    if ((ej.browserInfo().name === "msie" && Number(ej.browserInfo().version) < 9)) {
        alert("Diagram will not be supported in IE Version < 9");
    }
else if (document.getElementsByClassName("e-datavisualization-diagram").length) {
        var id = document.getElementsByClassName("e-datavisualization-diagram")[0].id
        diagramFitToPage(id, id == "TeamChart" ? true : false);
    }
});

function diagramFitToPage(id, preventScaling) {
    if (id && window) {
        if (ej.isMobile() && ej.isDevice()) {
            var diagram = $("#" + id).ejDiagram("instance");
            diagram.fitToPage("width", "content");
            if (!preventScaling) {
                var viewPort = ej.datavisualization.Diagram.ScrollUtil._viewPort(diagram, true);
                var bounds = diagram._getDigramBounds("content");
                var scale = { x: viewPort.width / bounds.width, y: viewPort.height / bounds.height };
                var y = bounds.y > 0 ? bounds.y : 0;
                $("#" + id).ejDiagram({ height: (y + bounds.height) * Math.min(scale.x, scale.y) });
            }
        }
    }
}