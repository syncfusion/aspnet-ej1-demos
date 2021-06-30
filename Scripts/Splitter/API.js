
var splitterObj, i = 0;
$(function () {
    splitterObj = $("#LayoutSection_ControlsSection_outterSplitter").data("ejSplitter");
    $("#sampleProperties").ejPropertiesPanel();
});
function expandpane() {
    splitterObj.expand(parseInt($('#LayoutSection_PropertySection_paneindex').val()));
}
function collapsepane() {
    splitterObj.collapse(parseInt($('#LayoutSection_PropertySection_paneindex').val()));
}
function add() {
    var property = {};
    property["paneSize"] = parseInt($('#LayoutSection_PropertySection_size').val()) || 0;
    property["minSize"] = parseInt($('#LayoutSection_PropertySection_min').val()) || 0;
    property["maxSize"] = parseInt($('#LayoutSection_PropertySection_max').val()) || null;
    splitterObj.addItem("<div class = 'content'> <h3 class='h3'> New Pane " + (i++) + "</h3>" + " </div>", property, parseInt($('#LayoutSection_PropertySection_index').val()));
    $("#LayoutSection_PropertySection_index, #LayoutSection_PropertySection_removepaneidx, #LayoutSection_PropertySection_paneindex").ejNumericTextbox({ maxValue: splitterObj.panes.length - 1 });
}
function removepane() {
    if ($("#" + splitterObj._id + ">.e-pane").length > 1)
        splitterObj.removeItem(parseInt($('#LayoutSection_PropertySection_removepaneidx').val()));
    $("#LayoutSection_PropertySection_index, #LayoutSection_PropertySection_removepaneidx, #LayoutSection_PropertySection_paneindex").ejNumericTextbox({ maxValue: splitterObj.panes.length - 1 });
}
function validate() {
    var panesize = $("#LayoutSection_PropertySection_size").ejNumericTextbox("model.value");
    var minsize = $("#LayoutSection_PropertySection_min").ejNumericTextbox("model.value");
    var maxsize = $("#LayoutSection_PropertySection_max").ejNumericTextbox("model.value");
    if (isNaN(panesize) || panesize < minsize || panesize > maxsize) {
        $("#error").html("Please enter the Pane size based on min and max size");
        $("#LayoutSection_PropertySection_Button3").ejButton("disable");
    }
    else {
        $("#error").html("");
        $("#LayoutSection_PropertySection_Button3").ejButton("enable");
    }
}