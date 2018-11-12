function dropdownOnCreate(args) {
    drpdwnobj = this;
}
function treeViewOnCreate(args) {
    treeobj = this;
}
// check & uncheck the checkbox when click on text
$(function () {
    $("body").on("click", ".e-treeview ul li a.e-text", function (e) {
        if (!$(e.target).siblings(".e-chkbox-wrap").children("input.nodecheckbox")[0].checked)
            treeobj.checkNode($(e.target).closest("li"));
        else
            treeobj.uncheckNode($(e.target).closest("li"));
    });
});

//Function triggers while check the checkbox in tree view and it adds the checked item text to dropdownlist value
function checkScroll(args) {
    var scrolpos = drpdwnobj.scrollerObj.model.scrollTop;
    drpdwnobj._refreshScroller();
    drpdwnobj.popupList.css("display", "block");
    drpdwnobj.scrollerObj.setModel({ "scrollTop": scrolpos });
}

function onNodeCheck(args) {
    if (args.currentCheckedNodes != null) {
        var checkeditems = args.currentCheckedNodes;
        for (var i = 0; i < checkeditems.length; i++) {
            if ((checkeditems[i] != null) && !isContains(checkeditems[i].text))
                addOrRemoveItem(checkeditems[i].text, true);
        }
    }
}
//Function triggers while uncheck the checkbox in tree view and it removes the unchecked item text from dropdownlist value
function onNodeUnCheck(args) {
    if (args.currentUncheckedNodes != null) {
        var uncheckeditems = args.currentUncheckedNodes;
        for (var i = 0; i < uncheckeditems.length; i++) {
            if (uncheckeditems[i] != null && isContains(uncheckeditems[i].text))
                addOrRemoveItem(uncheckeditems[i].text);
        }
    }
    ensureRootCheck(args);
}

function ensureRootCheck(args) {
    var rootEle = $(args.currentElement).parents("ul.e-treeview-ul");
    for (var i = 0; i < rootEle.length; i++) {
        if ($(rootEle[i]).parent("li").length) {
            if (isContains($(rootEle[i]).siblings("[role=presentation]").text()))
                addOrRemoveItem($(rootEle[i]).siblings("[role=presentation]").text());
        }
    }
}

function addOrRemoveItem(currentValue, isAdd) {
    drpdwnobj._hiddenValue = currentValue;
    isAdd ? drpdwnobj._addText(currentValue) : drpdwnobj._removeText(currentValue);
    drpdwnobj.model.value = drpdwnobj.model.text = drpdwnobj.element.val();
}
function isContains(val) {
    var data = drpdwnobj.getValue().split(","), matched;
    for (k = 0; k < data.length; k++) {
        if (data[k] == val) {
            matched = 1;
            break;
        }
    }
    return matched;
}