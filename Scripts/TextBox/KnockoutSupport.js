/* KnockoutSupport.js */

var numobject, percentobject, currencyobject, maskobject;
window.viewModel = {
    //editors
    nvalue: ko.observable(100),
    cvalue: ko.observable(80),
    pvalue: ko.observable(50),
    mvalue: ko.observable("")
}
jQuery(function ($) {
    ko.applyBindings(viewModel);
    maskobject = $("#maskedit").data("ejMaskEdit");
    maskobject.option("maskFormat", "(999)999-9999");
    $("#sampleProperties").ejPropertiesPanel();
});
