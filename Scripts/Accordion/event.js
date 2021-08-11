// Client side Events
        function onCreate(args) {
            jQuery.addEventLog("Accordion has been <span class='eventTitle'>created</span>.");
        }
        function onBeforeActive(args) {
            jQuery.addEventLog("<span class='eventTitle'>BeforeActive</span> event is fired for Index " + args.activeIndex + ".");
        }
        function onActive(args) {
            jQuery.addEventLog("Index " + args.activeIndex + " is on <span class='eventTitle'>Active</span>.");
        }
        function onBeforeLoad(args) {
            jQuery.addEventLog("<span class='eventTitle'>BeforeLoad</span> event is fired.");
        }
        function onLoad(args) {
            jQuery.addEventLog("Ajax content is <span class='eventTitle'>loaded</span>.");
        }
        function onAjaxSuccess(args) {
            jQuery.addEventLog("Ajax content is loaded <span class='eventTitle'>successfully</span>.");
        }
        function onError(args) {
            jQuery.addEventLog("Ajax content is loaded with an <span class='eventTitle'>error</span>.");
        }
        function onClear() {
            jQuery.clearEventLog();
        }
        // Event wire and unwire
        function evtpropscheckedevent(args) {
            if (args.isChecked) {
                switch (args.model.text) {
                    case "create": acrdnObj.option(args.model.text, "onCreate"); break;
                    case "beforeActive": acrdnObj.option(args.model.text, "onBeforeActive"); break;
                    case "active": acrdnObj.option(args.model.text, "onActive"); break;
                    case "ajaxBeforeLoad": acrdnObj.option(args.model.text, "onBeforeLoad"); break;
                    case "ajaxLoad": acrdnObj.option(args.model.text, "onLoad"); break;
                    case "ajaxSuccess": acrdnObj.option(args.model.text, "onAjaxSuccess"); break;
                    case "ajaxError": acrdnObj.option(args.model.text, "onError"); break;
                }
            }
            else acrdnObj.option(args.model.text, null);
        }