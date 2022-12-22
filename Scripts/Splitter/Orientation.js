var splitterOutter, splitterInner;
$(function () {

    splitterOutter = $("#LayoutSection_ControlsSection_outersplitter").data("ejSplitter");
    splitterInner = $("#LayoutSection_ControlsSection_outersplitter_ctl00_innersplitter").data("ejSplitter");

    $("#sampleProperties").ejPropertiesPanel();
});
function onOrientationChange(args) {
    switch (args.text) {
        case "Vertical":
            splitterInner.option("width", "169");
            splitterOutter.option("orientation", "horizontal");
            splitterInner.option("orientation", "vertical");

            break;
        case "Horizontal":
            splitterInner.option("width", "408");
            splitterOutter.option("orientation", "vertical");
            splitterInner.option("orientation", "horizontal");

            break;
    }
}