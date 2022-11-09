/* APIs.js */
var i = 0, treeview;
$(function () {
    $("#sampleProperties").ejPropertiesPanel();
    var treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
});



// Client side APIs 

function onExpandAll(args) {
    treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
    if (treeview) {
        if (args.isChecked)
            treeview.expandAll();
        else
            treeview.collapseAll();
    }
}
function onCheckAll(args) {
    treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
    if (treeview) {
        if (args.isChecked)
            treeview.checkAll();
        else
            treeview.unCheckAll();
    }
}
function onExpand() {
    treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
    if (treeview)
        treeview.expandNode(treeview.getSelectedNode());
}
function onCollapse() {
    treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
    if (treeview)
        treeview.collapseNode(treeview.getSelectedNode());
}
function onCheck() {
    treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
    if (treeview)
        treeview.checkNode(treeview.getSelectedNode());
}
function onUncheck() {
    treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
    if (treeview)
        treeview.uncheckNode(treeview.getSelectedNode());
}
function onEnable() {
    treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
    if (treeview) {
        var node = $("#LayoutSection_ControlsSection_treeview").find('.e-node-disable');
        treeview.enableNode(node[0]); 
    }
}
function onDisable() {
    treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
    if (treeview)
        treeview.disableNode(treeview.getSelectedNode());
}
function onAddNew() {
    treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
    if (treeview) {
        treeview.addNode("Item" + i, treeview.getSelectedNode());
        i++;
    }
}
function onRemoveNode() {
    treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
    if (treeview)
        treeview.removeNode(treeview.getSelectedNode());
}
function onDestoryRestore(args) {
    i = 0;
    treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
    if (args.isChecked) {
        treeview && treeview.destroy();
        enableOrDisable(false);
    }
    else {
        $("#LayoutSection_ControlsSection_treeview").ejTreeView(
                     {
                         showCheckbox: true,
                         allowEditing: true
                     });
        enableOrDisable(true);
        treeview = $("#LayoutSection_ControlsSection_treeview").data("ejTreeView");
    }
}
function enableOrDisable(value) {
    var _array = ["LayoutSection_PropertySection_btnchkExpand", "LayoutSection_PropertySection_btnchkCheckAll", "LayoutSection_PropertySection_btnExpand", "LayoutSection_PropertySection_btnCollapse", "LayoutSection_PropertySection_btnCheck", "LayoutSection_PropertySection_btnUncheck", "LayoutSection_PropertySection_btnDisable", "LayoutSection_PropertySection_btnEnable", "LayoutSection_PropertySection_btnAdd", "LayoutSection_PropertySection_btnRemove"];
    for (var i = 0; i < _array.length; i++) {
        if (i == 0 || i == 1)
            enableOrDisableToggleButton(value, _array[i]);
        else
            enableOrDisableButton(value, _array[i]);
    }
}
function enableOrDisableButton(value, btnId) {
    var btnObj = $("#" + btnId).data("ejButton");
    value ? btnObj.enable() : btnObj.disable();
}
function enableOrDisableToggleButton(value, btnId) {
    var btnObj = $("#" + btnId).data("ejToggleButton");
    btnObj.option("toggleState", false);
    value ? btnObj.enable() : btnObj.disable();
}