/* Script for event*/
        var numericObj, percentObj, currencyObj, maskObj;
        $(function () {

            numericObj = $("#LayoutSection_ControlsSection_numeric").data("ejNumericTextbox");
            percentObj = $("#LayoutSection_ControlsSection_percent").data("ejPercentageTextbox");
            currencyObj = $("#LayoutSection_ControlsSection_currency").data("ejCurrencyTextbox");
            maskObj = $("#LayoutSection_ControlsSection_maskedit").data("ejMaskEdit");
        });
        // Client side Events
        function onNumericCreate(args) {
            jQuery.addEventLog("NumericTextbox has been <span class='eventTitle'>created</span>.");
        }
        function onPercentageCreate(args) {
            jQuery.addEventLog("PercentageTextbox has been <span class='eventTitle'>created</span>.");
        }
        function onCurrencyCreate(args) {
            jQuery.addEventLog("CurrencyTextbox has been <span class='eventTitle'>created</span>.");
        }
        function onMaskCreate(args) {
            jQuery.addEventLog("MaskEditTextbox has been <span class='eventTitle'>created</span>.");
        }
        function numericValChange(args) {
            jQuery.addEventLog("NumericTextbox value has been <span class='eventTitle'>changed</span> to " + args.value + ".<br/>");
        }
        function percentValChange(args) {
            jQuery.addEventLog("PercentageTextbox value has been <span class='eventTitle'>changed</span> to " + args.value + ".<br/>");
        }
        function currencyValChange(args) {
            jQuery.addEventLog("CurrencyTextbox value has been <span class='eventTitle'>changed</span> to " + args.value + ".<br/>");
        }
        function maskValueChange(args) {
            jQuery.addEventLog("MaskEditTextbox value has been <span class='eventTitle'>changed</span> to " + args.value + ".<br/>");
        }
        function numericFocusIn(args) {
            jQuery.addEventLog("NumericTextbox is in <span class='eventTitle'>Focus</span>");
        }
        function numericFocusOut(args) {
            jQuery.addEventLog("NumericTextbox is out of <span class='eventTitle'>Focus</span>");
        }
        function percentFocusIn(args) {
            jQuery.addEventLog("PercentTextbox is in <span class='eventTitle'>Focus</span>");
        }
        function percentFocusOut(args) {
            jQuery.addEventLog("PercentTextbox is out of <span class='eventTitle'>Focus</span>");
        }
        function currencyFocusIn(args) {
            jQuery.addEventLog("CurrencyTextbox is in <span class='eventTitle'>Focus</span>");
        }
        function currencyFocusOut(args) {
            jQuery.addEventLog("CurrencyTextbox is out of <span class='eventTitle'>Focus</span>");
        }
        function maskFocusIn(args) {
            jQuery.addEventLog("MaskEditTextbox is in <span class='eventTitle'>Focus</span>");
        }
        function maskFocusOut(args) {
            jQuery.addEventLog("MaskEditTextbox is out of <span class='eventTitle'>Focus</span>");
        }
        function onClear() {
            jQuery.clearEventLog();
        }
        function evtpropscheckedevent(args) {
            numericObj = $("#LayoutSection_ControlsSection_numeric").data("ejNumericTextbox");
            percentObj = $("#LayoutSection_ControlsSection_percent").data("ejPercentageTextbox");
            currencyObj = $("#LayoutSection_ControlsSection_currency").data("ejCurrencyTextbox");
            maskObj = $("#LayoutSection_ControlsSection_maskedit").data("ejMaskEdit");
            if (args.isChecked) {
                switch (args.data.itemValue) {
                    case "change": numericObj.option(args.data.itemValue, "numericValChange");
                        percentObj.option(args.data.itemValue, "percentValChange");
                        currencyObj.option(args.data.itemValue, "currencyValChange");
                        maskObj.option(args.data.itemValue, "maskValueChange"); break;
                    case "focusIn": numericObj.option(args.data.itemValue, "numericFocusIn");
                        percentObj.option(args.data.itemValue, "percentFocusIn");
                        currencyObj.option(args.data.itemValue, "currencyFocusIn");
                        maskObj.option(args.data.itemValue, "maskFocusIn"); break;
                    case "focusOut": numericObj.option(args.data.itemValue, "numericFocusOut");
                        percentObj.option(args.data.itemValue, "percentFocusOut");
                        currencyObj.option(args.data.itemValue, "currencyFocusOut");
                        maskObj.option(args.data.itemValue, "maskFocusOut"); break;
                }

            }
            else {
                numericObj.option(args.data.itemValue, null);
                percentObj.option(args.data.itemValue, null);
                currencyObj.option(args.data.itemValue, null);
                maskObj.option(args.data.itemValue, null);
            }
        }