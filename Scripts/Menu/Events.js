/* Events script for Menu */
        var menuObj;
        $(function () {
            menuObj = $("#LayoutSection_ControlsSection_menuEvents").data("ejMenu");
        });
        function onCreate(args) {
            jQuery.addEventLog("Menu has been <span class='eventTitle'>created</span>.");
        }
        function mouseOver(sender) {
            jQuery.addEventLog("Menu item has been <span class='eventTitle'>hovered-in</span>.</br>");
        }
        function mouseOut(sender) {
            jQuery.addEventLog("Menu item has been <span class='eventTitle'>hovered-out</span>.</br>");
        }
        function menuClick(sender) {
            jQuery.addEventLog("Menu item is <span class='eventTitle'>clicked</span>.</br>");
        }
        function keyDown(sender) {
            jQuery.addEventLog("Menu item has been changed by <span class='eventTitle'>keys</span>.</br>");
        }
        function onClear() {
            jQuery.clearEventLog();
        }
        function evtpropscheckedevent(args) {
            if (args.isChecked) {
                switch (args.value) {
                    case "click": menuObj.option(args.value, "menuClick"); break;
                    case "mouseOver": menuObj.option(args.value, "mouseOver"); break;
                    case "mouseOut": menuObj.option(args.value, "mouseOut"); break;
                    case "keyDown": menuObj.option(args.value, "keyDown"); break;
                }
            }
            else menuObj.option(args.value, null);
        }