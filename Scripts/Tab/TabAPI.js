function onDisableChange(args) {
    if (tabObj.model) {
        tabObj.option({ disabledItemByIndex: parseInt(args.value) });
        $("#optEnable").ejDropDownList("clearText");
        $("#optRemove").ejDropDownList("clearText");
    }
}
function onEnableChange(args) {
    if (tabObj.model) {
        tabObj.option({ enabledItemIndex: parseInt(args.value) });
        $("#optDisable").ejDropDownList("clearText");
        $("#optRemove").ejDropDownList("clearText");
    }
}
function onRemoveChange(args) {
    if (tabObj.model) {
        tabObj.remove(parseInt(args.value));
        $("#optDisable").ejDropDownList("clearText");
        $("#optEnable").ejDropDownList("clearText");
    }
}
function onDestoryRestore(args) {
    i = 0;
    if (args.isChecked)
        tabObj.destroy();
    else {
        $("#apiTab").ejTab();
        tabObj = $("#apiTab").data("ejTab");
    }
}