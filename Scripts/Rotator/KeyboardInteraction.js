$(function () {

    //Control focus key
    $(document).on("keydown", function (e) {
        if (e.altKey && e.keyCode === 74) { // j- key code.
            $("#LayoutSection_ControlsSection_Keyboardevent")[0].focus();
        }
    });
    $("#sampleProperties").ejPropertiesPanel();
});