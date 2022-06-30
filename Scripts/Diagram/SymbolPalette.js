var symbolpalette = null;
$(window).on("load", function () {
    $("#sampleProperties").ejPropertiesPanel();
});
function setHeaderHeight(args) {
    symbolpalette = $("#SymbolPaletteControl").ejSymbolPalette("instance");
    symbolpalette.setHeaderHeight(args.value);
}

function change(args) {
    symbolpalette = $("#SymbolPaletteControl").ejSymbolPalette("instance");
    if (symbolpalette.activePalette && args && args.model) {
        switch (args.model.id) {
            case "headervisibility":
                symbolpalette.updatePalette(symbolpalette.activePalette.name, { constraints: symbolpalette.activePalette.constraints ^ ej.datavisualization.Diagram.PaletteConstraints.HeaderVisibility });
                break;
            case "headerinteraction":
                symbolpalette.updatePalette(symbolpalette.activePalette.name, { constraints: symbolpalette.activePalette.constraints ^ ej.datavisualization.Diagram.PaletteConstraints.Expandable });
                break;
            case "visiblepalette":
                symbolpalette.updatePalette(symbolpalette.activePalette.name, { constraints: symbolpalette.activePalette.constraints ^ ej.datavisualization.Diagram.PaletteConstraints.Visible });
                break;
        }
        if (args.model.id == "itemtext") {
            symbolpalette.showPaletteItemText(!symbolpalette.model.showPaletteItemText)
        }
    }
}
function selectedPaletteChange(args) {
    symbolpalette = $("#SymbolPaletteControl").ejSymbolPalette("instance");
    if (args && args.selectedValue)
        $("#SymbolPaletteControl").ejSymbolPalette({ selectedPaletteName: args.selectedValue });
    $("#itemtext").ejCheckBox({ checked: symbolpalette.model.showPaletteItemText ? "checked" : "" });
    var constraints = symbolpalette.activePalette.constraints & ej.datavisualization.Diagram.PaletteConstraints.HeaderVisibility;
    $("#headervisibility").ejCheckBox({ checked: constraints ? "checked" : "" });
    constraints = symbolpalette.activePalette.constraints & ej.datavisualization.Diagram.PaletteConstraints.Visible;
    $("#visiblepalette").ejCheckBox({ checked: constraints ? "checked" : "" });
    constraints = symbolpalette.activePalette.constraints & ej.datavisualization.Diagram.PaletteConstraints.Expandable;
    $("#headerinteraction").ejCheckBox({ checked: constraints ? "checked" : "" });
}
