
jQuery(function ($) {

    $(document).on("keydown", function (e) {
        if (e.altKey && e.keyCode === 74) { // j- key code.
            $("#LayoutSection_ControlsSection_keyboard").focus();
        }
    });

    $("#sampleProperties").ejPropertiesPanel();
});