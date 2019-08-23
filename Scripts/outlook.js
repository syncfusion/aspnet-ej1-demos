var list, list1, data;
$(function () {

    var listsource,dataList,listsource1,menusource = [];

    $.validator.setDefaults({
        ignore: [],
        errorClass: 'e-validation-error',
        errorPlacement: function (error, element) {
            $(error).insertAfter(element.closest(".e-widget"));
        }
        // any other default options and/or rules
    });
    //listview,treeview and menu loaded with outlook information
    var dataManger1 = ej.DataManager({
        url: "http://js.syncfusion.com/ejServices/api/webmail/loaddata",
    });

    dataManger1.executeQuery(ej.Query()).done(function (e) {
        $("#templatelist").ejListView({ dataSource: e.result.outlookItem });
        list = e.result.outlookItem;
        $("#templatelist1").ejListView({ dataSource: e.result.outlookItem1 });
        list1 = e.result.outlookItem1;


        $("#treeView").ejTreeView({
            fields: { dataSource: e.result.treeviewDB.treeData }
        });

        $("#menujson").ejMenu({
            fields: { dataSource: e.result.menuDB.menuData }
        });
    });

    //$("#iconAccordion").ejAccordion({
    //    enableMultipleOpen: true,
    //    customIcon: {
    //        header: "ej-icon-expander-down---01",
    //        selectedHeader: "ej-icon-up-arrow---01"
    //    },
    //    events: "click",
    //    beforeInactivate: "onbeforeInActivate",
    //    inActivate: "onInActivate",
    //    beforeActivate: "beforeActivate",
    //    activate: "InActivate"
    //});

    //$("#autoTo").ejAutocomplete({
    //	dataSource:contact,
    //	filterType:"contains",
    //	width:"593px",
    //	popupWidth:"230px",
    //	popupHeight:"250px",
    //	multiSelectMode:ej.MultiSelectMode.VisualMode,
    //	 validationRules: {
    //         required: true
    //     },
    //     validationMessage: {
    //        required: " The message must have at least one recipient."
    //     }
    //});



    //$("#rteSample").ejRTE({
    //	width:"710px",
    //	height:"350px",
    //	toolsList:["formatStyle", "font", "style", "effects", "alignment", "lists", "indenting", "clipboard", "doAction", "clear", "casing", "print"]
    //});

    $("#textform").submit(function (e) {
        e.preventDefault();
    });

});


function searchAutoOpen(args) {
    var obj = $("#searchAuto").data("ejAutocomplete");
    obj.suggestionList.attr("style", "top:85px;width:216px");
}

//list item click
function onMouseDown(args) {
    var selectnode, countnode, initialNode, initialNode1, data;
    selectnode = $("#treeView").data("ejTreeView").model.selectedNode;
    countnode = $(".e-treeview").find(".e-active").find("#count");
    initialNode = $($(".e-treeview").find("ul:not(ul:first)")[0]).find("li:first").find("#count");
    initialNode1 = $($(".e-treeview").find("ul:not(ul:first)")[1]).find("li:first").find("#count");
    data = $($(".e-treeview").find(".e-active").closest("ul").parent()).next().length !== 0 ? $($(".e-treeview").find(".e-active").closest("ul").parent()).next() : $($(".e-treeview").find(".e-active").closest("ul").parent()).prev();
    if (args.item.closest("#templatelist") && args.item.find(".subjectstyle").attr("style") != "undefined") {
        if (selectnode == -1 && args.item.find(".subjectstyle").css("font-weight") == "bold") {
            initialNode.text(initialNode.text() - 1);
            initialNode1.text(initialNode1.text() - 1);
            if (initialNode.text() == "0")
                initialNode.text("");
            if (initialNode1.text() == "0")
                initialNode1.text("");

        }
        if (countnode.length !== 0 && args.item.find(".subjectstyle").css("font-weight") == "bold") {
            for (var j = 0; j < data.find("li").length; j++) {

                if ($(".e-treeview").find(".e-active").find(".treeitem").text() == $(data.find("li")[j]).find(".treeitem").text()) {
                    $(data.find("li")[j]).find("#count").text($(data.find("li")[j]).find("#count").text() - 1);
                    countnode.text(countnode.text() - 1);
                    if ($(data.find("li")[j]).find("#count").text() == "0")
                        $(data.find("li")[j]).find("#count").text("");
                    if (countnode.text() == "0")
                        countnode.text("");
                }
            }
        }
    }
    $(".e-acrdn").css("display", "block");
    $(".paneltxt").css("display", "none");
    if ($(args.item).find(".descriptionstyle").text() == " No preview is available ")
        $("#accContent").attr("style", "display:none");
    else {
        $("#accCont").text($(args.item).find(".descriptionstyle").text());
        $("#accFrom").text($(args.item).find(".templatetext").text().trim().concat("."));
        $("#accTo").text($(args.item).find(".receiver").text().trim().concat(","));
    }
    $("#sub").text($(args.item).find(".subjectstyle").text());
    $("#date").text($(args.item).find(".designationstyle").text());
    $("#to").text($(args.item).find(".receiver").text());
    $(args.item).find(".designationstyle").css({ "font-weight": "normal", "font-family": "Segoe UI", color: "#333" });
    $(args.item).find(".subjectstyle").css({ "font-weight": "normal", "font-family": "Segoe UI", color: "#333" });
    $("#mailarea").addClass("hidden");
    $("#menujson li:nth-child(n+2)").css("display", "inline-block");
}

//compose menu item click
function menuClick(args) {
    if (args.text == "New") {
        $("#autoTo").data("ejAutocomplete").clearText();
        $("#autoTo").data("ejAutocomplete").clearText();
        $("#mailsubject").ejMaskEdit({ "value": "" });
        $("#rteSample").ejRTE({ "value": "" });
        $("#mailarea").removeClass("hidden");
        $(".paneltxt").attr("style", "display:none");
        $("#iconAccordion").attr("style", "display:none");
        $("#menujson li:nth-child(n+2)").css("display", "none");
    }
};

//treenode click
function nodeClick(args) {
    switch (args.currentElement.textContent) {
        case "Inbox":
            $("#templatelist").ejListView({ "dataSource": list });
            $("#templatelist1").ejListView({ "dataSource": list1 });
            $("#ItemTitle").text("Inbox");
            args.currentElement.nextElementSibling.textContent = "3";
            setCount(args);
            break;
        case "Clutter":
            $("#templatelist").ejListView({ "dataSource": list });
            $("#templatelist1").attr("style", "display:none");
            $("#ItemTitle").text("Clutter");
            args.currentElement.nextElementSibling.textContent = "3";
            setCount(args);
            break;
        case "Sent Items":
            $("#templatelist1").ejListView({ "dataSource": list1 });
            $("#templatelist").attr("style", "display:none");
            $("#ItemTitle").text("Sent Items");
            break;
        case "Drafts":
            $("#templatelist").ejListView({ "dataSource": list });
            $("#templatelist1").attr("style", "display:none");
            $("#ItemTitle").text("Drafts");
            args.currentElement.nextElementSibling.textContent = "3";
            setCount(args);
            break;
    }
    $("#iconAccordion").css("display", "none");
    $("#mailarea").addClass("hidden");
    $("#menujson li:nth-child(n+2)").css("display", "none");
    $(".paneltxt").attr("style", "display:block");
}

function setCount(args) {
    var value = $(args.currentElement).closest("li").parent().parent().next().length !== 0 ? $(args.currentElement).closest("li").parent().parent().next().find("ul") : $(args.currentElement).closest("li").parent().parent().prev().find("ul");
    for (var i = 0; i < value.children().length; i++) {
        if (args.currentElement.textContent == $(value.children()[i]).find(".treeitem").text()) {
            $(value.children()[i]).find("#count").text("3");
        }
    }
}

//send button click
function Click(args) {
    var val = $("#autoTo").ejAutocomplete("option", "value");
    var name = val.substr(0, val.indexOf('@'));
    var title = $("#mailsubject").ejMaskEdit("option", "value") == null ? "(No Subject)" : $("#mailsubject").ejMaskEdit("option", "value");
    var msg = $("#rteSample").ejRTE("option", "value") == "" ? "No preview is available" : $("#rteSample").ejRTE("option", "value");
    if (val == "")
        return false;
    else {
        var obj = $("#templatelist1").ejListView('instance');
        obj.addItem({ "ContactName": name, "ContactTitle": title, "Time": "9.00AM", "Message": msg, "To": "Krish Kael" }, 0);
        list1 = obj.model.dataSource;
        $("#mailarea").addClass("hidden");
        $(".paneltxt").attr("style", "display:block");
    }
}

// function onInActivate(args) {
// $("#accContent").attr("style","display:none");
// }

// function beforeActivate(args) {
// $("#accContent").attr("style","display:none");
// }
// function onbeforeInActivate(args) {
// $("#accContent").attr("style","display:none");
// }
// function InActivate(args) {
// $("#accContent").attr("style","display:none");
// }
// function AccClick(args) {
// $("#accContent").attr("style","display:none");
// }


