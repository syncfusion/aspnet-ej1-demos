function onSelectChange(args) {
            toolbar1.selectItemByID(args.value);
        }
        function onDeselectChange(args) {
            toolbar1.deselectItemByID(args.value);
        }
        function onDisableChange(args) {
            toolbar1.disableItemByID(args.value);
        }
        function onEnableChange(args) {
            toolbar1.enableItemByID(args.value);
        }

        function onEnableDisableAll(args) {
            toolbar1 = $("#LayoutSection_ControlsSection_toolbarMethods").data("ejToolbar");
            if (args.isChecked)

                toolbar1.disable();
            else
                toolbar1.enable();
            $("#optDisableId").data('ejDropDownList').option('selectedItemIndex', 0);
            $("#optEnableId").data('ejDropDownList').option('selectedItemIndex', 0);
        }
        function onShowHide(args) {
            toolbar1 = $("#LayoutSection_ControlsSection_toolbarMethods").data("ejToolbar");
            if (args.isChecked)
                toolbar1.hide();
            else
                toolbar1.show();
        }
