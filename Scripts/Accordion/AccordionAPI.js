 function onEnaleDisableAll(args) {
            if (acrdnObj) {
                if (args.isChecked){
                    acrdnObj.disable(); 
                    activeObj.disable();
                    disableObj.disable();
				}
                else{
                    acrdnObj.enable();
                    activeObj.enable();
                    disableObj.enable();
				}
            }
        }
        function onDestoryRestore(args) {
            if (args.isChecked) {
                acrdnObj.destroy();
                acrdnObj = null;
            }
            else {
                $("#LayoutSection_ControlsSection_APIAccordion").ejAccordion();
                acrdnObj = $("#LayoutSection_ControlsSection_APIAccordion").data("ejAccordion");
            }
        }
        function onActiveChange(args) {
            if (acrdnObj) {
                acrdnObj.option({ selectedItemIndex: args.itemId });
                $("#LayoutSection_PropertySection_optDisableChange").ejDropDownList("clearText");
                $("#LayoutSection_PropertySection_optEnableChange").ejDropDownList("clearText");
            }
        }
        function onDisableChange(args) {
         var arrIndex = [], uncheck = [];
            if (args.isChecked) arrIndex.push(parseInt(args.itemId));
            else uncheck.push(parseInt(args.itemId));
            if (acrdnObj != null) {
                acrdnObj.disableItems(arrIndex); acrdnObj.enableItems(uncheck);
                $("#LayoutSection_PropertySection_optActiveChange").ejDropDownList("clearText");
                $("#LayoutSection_PropertySection_optEnableChange").ejDropDownList("clearText");
            }
        }
        function onEnableChange(args) {
            var arrayIndex = [], uncheck = [];
            if (args.isChecked) arrayIndex.push(parseInt(args.itemId));
            else uncheck.push(parseInt(args.itemId));
            if (acrdnObj != null) {
                acrdnObj.enableItems(arrayIndex); acrdnObj.disableItems(uncheck);
                $("#LayoutSection_PropertySection_optActiveChange").ejDropDownList("clearText");
                $("#LayoutSection_PropertySection_optDisableChange").ejDropDownList("clearText");
            }
        }
        function onShowHide(args) {
            if (acrdnObj) {
                if (args.isChecked)
                    acrdnObj.show();
                else
                    acrdnObj.hide();
            }
        }
		function onHeightAdjust(args) {
            if (acrdnObj) {
				acrdnObj.element.find(">.e-content").css("height","");
				acrdnObj.option("heightAdjustMode", args.value);
			}
        }
        function onShowHideCloseBtn(args) {
            acrdnObj && acrdnObj.option("showCloseButton", args.isChecked);
        }