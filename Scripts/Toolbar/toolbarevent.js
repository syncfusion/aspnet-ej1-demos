
        function toolbarLoad(args) {
            jQuery.addEventLog("Toolbar control has been <span class='eventTitle'>created </span>.");
        }
        function toolbarClick(args) {
            jQuery.addEventLog("Toolbar item " + args.text + " is <span class='eventTitle'>clicked </span>.");
        }
        function toolbarhover(args) {
            jQuery.addEventLog("Mouse pointer <span class='eventTitle'>hovered on</span> toolbar item. </br>");
        }
        function toolbarmouseout(args) {
            jQuery.addEventLog("Mouse pointer <span class='eventTitle'>hovered away</span> from toolbar item. </br>");
        }

        function onClear() {
            jQuery.clearEventLog();
        }
        function evtpropscheckedevent(args) {
                if (args.isChecked) {
                    switch (args.selectedValue) {
                        case "create": toolbarObj.option(args.selectedValue, "toolbarLoad"); break;
                        case "click": toolbarObj.option(args.selectedValue, "toolbarClick"); break;
                        case "itemHover": toolbarObj.option(args.selectedValue, "toolbarhover"); break;
                        case "itemLeave": toolbarObj.option(args.selectedValue, "toolbarmouseout"); break;
                }
            }
                else toolbarObj.option(args.selectedValue, null);
        }