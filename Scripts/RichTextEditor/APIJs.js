        function ongetHtmlString() {
            if (rte)
                alert(rte.getHtml());
        }
        function ongetText() {
            if (rte)
                alert(rte.getText());
        }
        function onexec() {
            if (rte)
                rte.executeCommand("bold", true);
        }
        function oncmdStatus() {
            if (rte)
                alert(rte.getCommandStatus("bold"));
        }
        function onDestoryRestore(args) {
            if (args.isChecked) {
                rte.destroy();
                rte = null;
            }
            else {
                $("#LayoutSection_ControlsSection_rteSample").ejRTE();
                rte = $("#LayoutSection_ControlsSection_rteSample").data("ejRTE");
            }
        }
        function onSelectAll() {
            rte.selectAll();
        }
        function onSeletcRange() {
            var range = rte.createRange();
            var liTag = rte.getDocument().getElementsByTagName("li");
            if (!rte._isIE8()) {
                range.setStart(liTag[2], 1);
                range.setEnd(liTag[4], 0);
            }
            else {
                range = rte.getDocument().body.createTextRange()
                range.moveToElementText(liTag[3]);
            }
            rte.selectRange(range);
        }
        function onPasteContent() {
            select = rte.getSelectedHtml();
            rte.pasteContent("<p style='background-color:yellow;color:skyblue'> " + select + " </p>");
        }
         