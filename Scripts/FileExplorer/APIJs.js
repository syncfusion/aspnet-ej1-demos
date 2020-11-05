function Toolbar(args) {
    if (feObj)
        feObj.option("showToolbar", !args.isChecked);
}
function Statusbar(args) {
    if (feObj)
        feObj.option("showFooter", !args.isChecked);
}
function Treeview(args) {
    if (feObj)
        feObj.option("showNavigationPane", !args.isChecked);
}
function ContextMenu(args) {
    if (feObj)
        feObj.option("showContextMenu", !args.isChecked);
}
function Checkbox(args) {
    if (feObj)
        feObj.option("showCheckbox", !args.isChecked);
}

function onDestoryRestore(args) {
    if (args.isChecked) {
        feObj.destroy();
        feObj = null;
        if (!$("#LayoutSection_PropertySection_check6").hasClass("not-disable"))
            $("#LayoutSection_PropertySection_check6").addClass("not-disable");
        var desobj=$("#sampleProperties .e-togglebutton.e-js").not(".not-disable");
        desobj.ejToggleButton("disable");
        desobj.ejToggleButton({ "toggleState": false });
        $("#LayoutSection_PropertySection_getPath").ejButton("disable");       
    }

    else {
        var localServ = "API.aspx/FileActionDefault";
        $("#LayoutSection_ControlsSection_fileexplorer").ejFileExplorer({
            isResponsive: true,
            width: "100%",
            minWidth: "150px",
            path: "~/FileBrowser/",
            ajaxAction: localServ,
            ajaxSettings: {
                upload: {
                    url: "uploadFiles.ashx{0}"
                },
                download: {
                    url: "downloadFile.ashx{0}"
                }
            }
        });
        feObj = $("#LayoutSection_ControlsSection_fileexplorer").data("ejFileExplorer");
        $("#sampleProperties .e-togglebutton.e-js").not(".not-disable").ejToggleButton("enable");
        $("#LayoutSection_PropertySection_getPath").ejButton("enable");
    }
}
function getCurrentPath() {
    if (feObj)
        alert(feObj.option("selectedFolder"));
}
function onDisableEnable(args) {
    if (args.isChecked) {
        if (feObj){
            feObj.disableToolbarItem("NewFolder");
			feObj.disableMenuItem("New folder");
			}
    }
    else
        if (feObj){
            feObj.enableToolbarItem("NewFolder");
			feObj.enableMenuItem("New folder");
			}
}