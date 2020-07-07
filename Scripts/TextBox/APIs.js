/* APIs.js */

var numobject, percentobject, currencyobject, maskobject;
jQuery(function ($) {

    numobject = $("#LayoutSection_ControlsSection_numeric").data("ejNumericTextbox");
    percentobject = $("#LayoutSection_ControlsSection_percent").data("ejPercentageTextbox");
    currencyobject = $("#LayoutSection_ControlsSection_currency").data("ejCurrencyTextbox");
    maskobject = $("#LayoutSection_ControlsSection_maskedit").data("ejMaskEdit");
            
    });
    function onMaskChange(args) {
        maskobject.option("maskFormat", args.value);
	    maskobject.option("watermarkText", args.value);
    }
    function applyChanges(args) {
        var val = parseFloat($("#LayoutSection_PropertySection_incrementStep").val());
        var minVal = parseFloat($("#LayoutSection_PropertySection_minValue").val());
        var maxVal = parseFloat($("#LayoutSection_PropertySection_maxValue").val());
        var decVal = parseInt($("#LayoutSection_PropertySection_decimalValue").val());
        if (!isNaN(val)) {
            numobject.option("incrementStep", val);
            percentobject.option("incrementStep", val);
            currencyobject.option("incrementStep", val);
        }
        if (!isNaN(decVal)) {
            numobject.option("decimalPlaces", decVal);
            percentobject.option("decimalPlaces", decVal);
            currencyobject.option("decimalPlaces", decVal);
        }
        if ((!isNaN(minVal)) && (!isNaN(maxVal)) && (maxVal < minVal))
            $("#error").html("Min value exceeds Max value");
        else {
            if (!isNaN(minVal)) {
                numobject.option("minValue", minVal);
                percentobject.option("minValue", minVal);
                currencyobject.option("minValue", minVal);
                $("#error").html("");
            }
            if (!isNaN(maxVal)) {
                numobject.option("maxValue", maxVal);
                percentobject.option("maxValue", maxVal);
                currencyobject.option("maxValue", maxVal);
                $("#error").html("");
            }
        }
    }
    function changeState(args) {
        if (args.isChecked) {
            numobject.disable();
            percentobject.disable();
            currencyobject.disable();
            maskobject.disable();
            $("#LayoutSection_PropertySection_incrementStep").ejNumericTextbox("disable");
            $("#LayoutSection_PropertySection_minValue").ejNumericTextbox("disable");
            $("#LayoutSection_PropertySection_maxValue").ejNumericTextbox("disable");
            $("#LayoutSection_PropertySection_decimalValue").ejNumericTextbox("disable");
        }
        else {
            numobject.enable();
            percentobject.enable();
            currencyobject.enable();
            maskobject.enable();
            $("#LayoutSection_PropertySection_incrementStep").ejNumericTextbox("enable");
            $("#LayoutSection_PropertySection_minValue").ejNumericTextbox("enable");
            $("#LayoutSection_PropertySection_maxValue").ejNumericTextbox("enable");
            $("#LayoutSection_PropertySection_decimalValue").ejNumericTextbox("enable");
        }
    }