$(function () {
    var categoryclone = $.extend(true, [], window.categorylist);
    var doctorclone = $.extend(true, [], window.doctorName);
    var tempObj = [{ Text: "All", Color: "white", Value: "all", Designation: "All" }];
    categoryclone.splice(0, 0, tempObj[0]);
    doctorclone.splice(0, 0, tempObj[0]);

    // Controls Rendering
    $("#categorylist").ejListBox({
        width: "100%",
        height: "100%",
        showCheckbox: true,
        checkAll: true,
        dataSource: categoryclone,
        fields: { text: "Text" },
        checkChange: "onListCheck",
        template: "<div id='clist' class='categoryname'>${Text}</div><div style='float:right;'><i class='icon-category' style='color:${Color}'></i></div>"
    });
    $("#doctorsdeptlist").ejListBox({
        width: "100%",
        height: "100%",
        showCheckbox: true,
        checkAll: true,
        dataSource: window.doctorName,
        fields: { text: "Text" },
        checkChange: "onListCheck",
        template: "<div id='doctors'><div id='dtrimage'><img class='doctorimg' src='../Content/Dashboard/AppointmentPlanner/images/${Text}.png' alt='doctor'/></div><div id='dtrdetails'><div class='doctorname'>${Name}</div><div class='designation'>${Designation}</div></div><div id='dtrcategory'><i class='icon-${Value}'></i></div></div>"
    });
    $("#upcomming").ejListBox({
        width: "100%",
        height: "100%",
        dataSource: window.waitinglist,
        fields: { text: "Subject" },
        allowDragAndDrop: true,
        select: "onListClick",
        itemDrag: "onNodeDragging",
        itemDragStop: "onDragStop",
        template: "<div id='waiting'><div id='waiticon'><div class='icon-waiticon'></div></div><div id='waitid'>${Id}</div>" +
		"<div id='waitdetails'><div id='waitlist'>${Subject}</div><div id='waitcategory'>${Department} - ${Category}</div></div><div id='waitcategoryicon'><i class='icon-category' style='color:${Categorycolor}'></i></div></div>"
    });
    $('#doctorlist').ejDropDownList({
        dataSource: doctorclone,
        fields: { text: "Designation" },
        selectedIndex: 0,
        width: "100%",
        popupHide: "onDoctorlistHide"
    });
    $("#txtSearch").ejAutocomplete({
        width: "140px",
        watermarkText: "Search",
        showEmptyResultText: true,
        showPopupButton: true,
        close: "onSearchResultSelect",
		filterType: "equal"
    });
    $("#btnsubmit,#btncancel,#appsubmit,#appcancel,#recsubmit,#reccancel,#patientsave,#patientcancel,#alertok,#alertcancel,#btnok").ejButton({
        size: "normal",
        width: "70px",
        showRoundedCorner: false
    });
    $("#patientsave,#patientcancel").ejButton({ click: "onPatientDetails" });
    $("#appcancel,#appsubmit").ejButton({ click: "onAppointmentClick" });
    $("#reccancel,#recsubmit").ejButton({ click: "onRecurrenceClick" });
    $("#alertok,#alertcancel").ejButton({ click: "onAlertClick" });
    $("#btnSearch,#btnCancel").ejButton({ click: "filterClick" });
    $("#recurrenceEditor").ejRecurrenceEditor({ selectedRecurrenceType: 0, frequencies: ["daily", "weekly", "monthly", "yearly", "everyweekday"] });
    $("#customWindow").ejDialog({
        width: "auto",
        height: "auto",
        showOnInit: false,
        enableModal: true,
        title: "Patient Appointment Details",
        enableResize: false,
        allowKeyboardNavigation: false,
        close: "clearFields"
    });
    $("#patientWindow").ejDialog({
        width: "auto",
        height: "auto",
        showOnInit: false,
        enableModal: true,
        title: "Patient Details",
        enableResize: false,
        allowKeyboardNavigation: false,
        close: "clearFields"
    });
    $("#deleteWindow").ejDialog({
        width: "auto",
        height: "auto",
        showOnInit: false,
        enableModal: true,
        title: "Delete Appointment",
        enableResize: false,
        allowKeyboardNavigation: false,
        close: "clearFields"
    });
    $("#alertWindow").ejDialog({
        width: "auto",
        height: "auto",
        showOnInit: false,
        enableModal: true,
        title: "Delete Confirmation",
        enableResize: false,
        allowKeyboardNavigation: false
    });
    $("#tokenWindow").ejDialog({
        width: "auto",
        height: "auto",
        showOnInit: false,
        enableModal: true,
        title: "Appointment",
        enableResize: false,
        allowKeyboardNavigation: false,
        close: "clearFields"
    });
    $("#Department").ejDropDownList({
        width: "150px",
        dataSource: departmentName,
        fields: { text: "Text", id: "Id", value: "Text" },
        popupHide: "onDropdownHide"
    });
    $("#deptdoctors").ejDropDownList({
        width: "150px",
        dataSource: doctorName,
        fields: { text: "Text", id: "Id", value: "Text" }
    });

    // Control Customization
    onCustomization();
    onHover();
    $(".e-resourceicon").click(function (e) { onResIconClick(e); });
    $(".waitinglistli").dblclick(function (e) { onWaitingOpen(e); });
    $("#lefticon, #righticon").click(function (e) { onLeftRightPanel(e); });
    $("#appWindow").find(".recuredit").click(function () { onRecurrenceRule(); });
    $(document).click(function (e) { onPanelHide(e) });
});

/* Control Functionalities */
$(document).bind('contextmenu', function (e) { e.preventDefault(); });
$(window).on('resize', function (e) { onWindowResize(); });
var categoryCheck = true, doctorsCheck = true;
/* Window Resize Calculation */
function onWindowResize() {
    if (ej.isMobile()) return false;
    var schObj = $("#DoctorSchedule").ejSchedule('instance');
    var DoctorGrid = $("<tr></tr>").append("<div id='grid2'></div>");
    $("#DoctorSchedule").find(".e-scheduleheader").parent().append(DoctorGrid);
    $("#DoctorSchedule").find('*[id*=Appointment_]').height($("#DoctorSchedule").find(".e-workcells").height() - 1);
    $(".e-categorybar ").remove();
    var mediaQuery = window.innerWidth < 768;
    if (mediaQuery) {
        $(".leftcol").css("display", "none");
        $(".rightcol").css("display", "none");
    }
    else {
        $(".leftcol").removeClass("leftpanel");
        $(".rightcol").removeClass("rightpanel");
    }
    if ($("#searchdata").is(":visible")) $(".displayright").find(".e-togglebutton").click();
    $("#customWindow,#patientWindow,#deleteWindow,#alertWindow,#tokenWindow").ejDialog("close");
    onRefresh();
	setTimeout(function() { onCustomization(); }, 500);
}

/* Refresh Elements */
function onRefresh() {
    $("#categorylist").ejListBox('instance').refresh();
    $("#doctorsdeptlist").ejListBox('instance').refresh();
    $("#upcomming").ejListBox('instance').refresh();
    onCustomization();
}

function onSearchClick() {
    $("#searchdata").toggle();
    var btnObj = $("#searchbtn").ejToggleButton('instance');
    if (!btnObj.toggleState()) {
        $('#searchlist').ejDropDownList({ selectedIndex: 0 });
        $("#txtSearch").ejAutocomplete({ dataSource: [], enabled: true });
        $(".searchdatepicker,#datesearchpanel").css("display", "none");
    }
    onSearchClose();
}

/* Waitinglist Edit */
function onWaitingOpen(e) {
    window.waitinglistedit = true;
    var schObj = $("#DoctorSchedule").ejSchedule('instance');
    var waitAppointment = new ej.DataManager(window.waitinglist).executeLocal(new ej.Query().where("Id", ej.FilterOperators.equal, parseInt($(e.currentTarget).find("#waitid").html())));
    var schArgs = [{ appointment: waitAppointment[0], edit: true, waitinglistedit: true, type: "appointmentWindowOpen", model: schObj.model, cancel: false }];
    onAppointmentWindowOpen(schArgs[0]);
}

function onPanelHide(e) {
    if ($(".leftcol").is(":visible") && !$(e.target).hasClass("icon-left") && $(e.target).closest(".leftcol").length == 0) {
        $(".leftcol").toggle();
        $("#lefticon").css("left", "10px");
        $("#lefticon").children().addClass("icon-right").removeClass("icon-left");
    }
    if ($(".rightcol").is(":visible") && !$(e.target).hasClass("icon-right") && $(e.target).closest(".rightcol").length == 0) {
        $(".rightcol").toggle();
        $("#righticon").css("right", "0px");
        $("#righticon").children().addClass("icon-left").removeClass("icon-right");
    }
}


/* Responsive Left, Right panel Show/Hide */
function onLeftRightPanel(e) {
    var id = $(e.target).closest("#lefticon, #righticon").attr("id");
    switch (id) {
        case "lefticon":
            $(".leftcol").toggle();
            var leftshowhide = $(".leftcol").is(":visible");
            (leftshowhide) ? $(".leftcol").addClass("leftpanel") : $(".leftcol").removeClass("leftpanel");
            (leftshowhide) ? $("#lefticon").children().addClass("icon-left").removeClass("icon-right") : $("#lefticon").children().addClass("icon-right").removeClass("icon-left");
            $("#lefticon").css("left", (leftshowhide ? 260 : 10) + "px");

            var rightshowhide = $(".rightcol").is(":visible");
            if (leftshowhide && rightshowhide) {
                $(".rightcol").toggle();
                $(".rightcol").removeClass("rightpanel");
                $("#righticon").css("right", "0px");
                $("#righticon").children().addClass("icon-left").removeClass("icon-right");
            }
            onRefresh();
            break;
        case "righticon":
            $(".rightcol").toggle();
            var rightshowhide = $(".rightcol").is(":visible");
            (rightshowhide) ? $(".rightcol").addClass("rightpanel") : $(".rightcol").removeClass("rightpanel");
            (rightshowhide) ? $("#righticon").children().addClass("icon-right").removeClass("icon-left") : $("#righticon").children().addClass("icon-left").removeClass("icon-right");
            $("#righticon").css("right", (rightshowhide ? 250 : 0) + "px");

            var leftshowhide = $(".leftcol").is(":visible");
            if (leftshowhide && rightshowhide) {
                $(".leftcol").toggle();
                $(".leftcol").removeClass("leftpanel");
                $("#lefticon").css("left", "10px");
                $("#lefticon").children().addClass("icon-right").removeClass("icon-left");
            }
            onRefresh();
            break;
    }
}

/* Resource Expand and Collapse */
function onResIconClick(e) {
    var schArgs = $("#DoctorSchedule").ejSchedule('instance');
    schArgs._onResourceClick(e);
    e.stopPropagation();
    $("#DoctorSchedule").find('*[id*=Appointment_]').height($("#DoctorSchedule").find(".e-workcells").height() - 1);
    $(".e-categorybar").remove();
}

/* Listbox Hover Color */
function onHover() {
    $(".waitinglistli").mouseout(function (e) {
        $("#waitinglisttooltip").css("display", "none");
    }).mouseover(function (e) {
        var hoverId = parseInt($(e.currentTarget).find("#waitid").html());
        var hoverObj = new ej.DataManager(window.waitinglist).executeLocal(new ej.Query().where("Id", ej.FilterOperators.equal, hoverId));
        var hoverName = new ej.DataManager(window.doctorName).executeLocal(new ej.Query().where("Id", ej.FilterOperators.equal, hoverObj[0].OwnerId));
        var srtDate = hoverObj[0].StartTime;
        var endDate = hoverObj[0].EndTime;
        $("#waitinglisttooltip").css({ display: "block", top: ($(this).offset().top - $("#waitinglisttooltip").outerHeight()) + "px", left: ($(this).offset().left - 5) + "px" });
        var docText = hoverName[0].Text + "  (" + hoverName[0].Designation + ")";
        $("#docname").html(docText);
        $("#docstarttime").html(srtDate.toLocaleString());
        $("#docendtime").html(endDate.toLocaleString());
    });
}

/* Add or Delete Appointments in Waitinglist */
function onButtonClick(args) {
    if ($(args.e.currentTarget).hasClass("add")) {
        window.addlist = true;
        var schArgs = $("#DoctorSchedule").ejSchedule('instance');
        if (!schArgs.model.readOnly) {
            $("#customWindow").ejDialog({
                width: "auto",
                height: "auto",
                showOnInit: false,
                enableModal: true,
                title: "Patient Appointment Details",
                enableResize: false,
                allowKeyboardNavigation: false,
                close: "clearFields"
            });
            $("#subject").ejAutocomplete({
                width: "100%",
                dataSource: window.patientlist,
                watermarkText: "Select Patient Name",
                fields: { text: "Name" },
                showPopupButton: false
            });
            $("#customWindow").ejDialog("open");
            clearFields();
            $("#StartTime").ejDateTimePicker({ value: new Date() });
            $("#EndTime").ejDateTimePicker({ value: new Date(new Date().setMinutes(new Date().getMinutes() + 30)) });
            var resObj = $("#DoctorSchedule").ejSchedule('instance');
            if (!ej.isNullOrUndefined(resObj.model.resources)) {
                $(".department").css("display", "");
                var res = resObj.model.resources[resObj.model.resources.length - 2].resourceSettings.dataSource;
                $("#Department").ejDropDownList({ dataSource: res, fields: { text: "Text", id: "Id", value: "Text" } });
                (res.length > 0) && $("#Department").data("ejDropDownList").selectItemByText(res[0].Text);
                var res1 = new ej.DataManager(resObj.model.resources[resObj.model.resources.length - 1].resourceSettings.dataSource).executeLocal(new ej.Query().where(resObj.model.resources[resObj.model.resources.length - 2].resourceSettings["groupId"], ej.FilterOperators.equal, res[0].Id));;
                $("#deptdoctors").ejDropDownList({ dataSource: res1, fields: { text: "Text", id: "Id", value: "Text" } });
                (res1.length > 0) && $("#deptdoctors").data("ejDropDownList").selectItemByText(res1[0].Text);
            }
        }
    }
    else if ($(args.e.currentTarget).hasClass("delete")) {
        if (window.list) {
            $("#alertWindow").ejDialog("open");
        }
        else {
            $("#deleteWindow").ejDialog({
                width: "auto",
                height: "auto",
                showOnInit: false,
                enableModal: true,
                title: "Delete Appointment",
                enableResize: false,
                allowKeyboardNavigation: false,
                close: "clearFields"
            });
            $("#deleteWindow").ejDialog("open");
            clearFields();
        }
    }
}

/* Alert Window Action */
function onAlertClick(args) {
    if ($(args.e.currentTarget).hasClass("alertdone")) {
        var listObj = $("#upcomming").ejListBox('instance');
        var index = listObj.getSelectedItems()[0].index;
        window.waitinglist.splice(index, 1);
        $("#upcomming").children().remove();
        $("#upcomming").ejListBox({ dataSource: window.waitinglist });
        onWaitingList();
        window.list = false;
    }
    $("#alertWindow").ejDialog("close");
}

/* Add New Patient */
function onPatientNew() {
    $("#customWindow").ejDialog("close");
    var newpatientId = (window.patientlist.length == 0) ? 1 : window.patientlist.length + 1;
    $("#patientid").val(newpatientId);
    $("#patientname").val("");
    $("#patientdob").val("");
    $("#patientmobile").val("");
    $("#patientaddress").val("");
    $("#patientWindow").ejDialog({
        width: "auto",
        height: "auto",
        showOnInit: false,
        enableModal: true,
        title: "Patient Details",
        enableResize: false,
        allowKeyboardNavigation: false,
        close: "clearFields"
    });
    $("#patientWindow").ejDialog("open");
}

function onPatientDetails(args) {
    if ($(args.e.currentTarget).hasClass("padd")) {
        if ($.trim($("#patientname").val()) == "") {
            $("#patientname").addClass("error");
            return false;
        }
        else if ($.trim($("#patientdob").val()) == "") {
            $("#patientdob").addClass("error");
            return false;
        }
        else if ($.trim($("#patientmobile").val()) == "") {
            $("#patientmobile").addClass("error");
            return false;
        }
        else if ($.trim($("#patientaddress").val()) == "") {
            $("#patientaddress").addClass("error");
            return false;
        }
        var obj = {};
        obj["Id"] = $("#patientid").val();
        obj["Name"] = $("#patientname").val();
        obj["DOB"] = $("#patientdob").ejDatePicker("option", "value");
        obj["Mobile"] = $("#patientmobile").val();
        obj["BloodGroup"] = $("#patientbloodgroup").val();
        obj["Address"] = $("#patientaddress").val();
        window.patientlist.push(obj);
        $("#subject").ejAutocomplete({
            width: "100%",
            dataSource: window.patientlist,
            watermarkText: "Select Patient Name",
            fields: { text: "Name" },
            showPopupButton: false
        });
    }
    $("#patientWindow").ejDialog("close");
    $("#customWindow").ejDialog({
        width: "auto",
        height: "auto",
        showOnInit: false,
        enableModal: true,
        title: "Patient Appointment Details",
        enableResize: false,
        allowKeyboardNavigation: false,
        close: "clearFields"
    });
    $("#customWindow").ejDialog("open");
}

/* Schedule Customization */
function onSchedule() {
    var schObj = $("#DoctorSchedule").ejSchedule('instance');
    if (schObj.model.orientation == "vertical" && schObj.currentView() == "month") $("#DoctorSchedule").find(".e-workcellstab td:first-child").css("border-left", "1px solid #c3c3c3");
    if (schObj.model.orientation == "vertical" && schObj.currentView() != "month") $("#DoctorSchedule").find(".e-ampmdisplay").css("margin-right", "4px");
    $("#DoctorSchedule").find(".e-scheduleheader").parent().append($("<tr></tr>").append("<div id='grid2'></div>"));
}

/* Waitinglist Customization */
function onWaitingList() {
    $("#upcomming_container").css("border", "none");
    $("#upcomming").children().addClass("waitinglistli");
    $("#upcomming_container").find(".e-vscrollbar").remove();
    $("#upcomming").parent().css("width", "100%");
}

/* Appointment Save or Cancel */
function onAppointmentClick(args) {
    if ($(args.e.currentTarget).attr("id") == "appsubmit") save();
    else cancel();
}

/* RecurrenceRule Generate or Cancel */
function onRecurrenceClick(args) {
    if ($(args.e.currentTarget).attr("id") == "recsubmit") {
        var recObj = $("#recurrenceEditor").ejRecurrenceEditor('instance');
        recObj.closeRecurPublic();
        window.recurRule = recObj._recRule;
    }
    if (($(args.e.currentTarget).attr("id") == "reccancel")) {
        $("#recurrence").ejCheckBox({ checked: false });
    }
    $("#recWindow").css("display", "none");
    $("#appWindow").css("display", "");
}

/* Control Customization */
function onCustomization() {
    $("#categorylist_container").css("height", "100%");
    $("#categorylist li:first-child").find(".icon-category").hide();
    //$('*[id*=_categorylist]').css({ float: "left", marginRight: "10px" });
    $('*[id*=_doctorsdeptlist]').css({ float: "left", marginTop: "3px" });
    $("#datepicker").children().css({ border: "none", backgroundColor: "white" });
    $(".listbox").children().css("border", "none");
    $("#doctorsdeptlist_container").css("border", "none");
    $("#datepicker").find("#e-datepicker").width($(".calendarcontent").width() - 1);
    $("#datepicker").find("#e-datepicker").children().width($(".calendarcontent").width() - 1);
    $("#upcomming_container").css("border", "none");
    $("#upcomming_container").find(".e-vscrollbar").remove();
    $("#upcomming").parent().css("width", "100%");
    $("#upcomming").children().addClass("waitinglistli");
    $("#txtSearch_dropdown").css({ borderLeft: "none", backgroundColor: "white", opacity: 0.5 });
    $(".e-ampmdisplay").css("margin-right", "4px");
    $("#DoctorSchedule").find(".e-headerdays table tr").first().children().css("background-color", "#F5F5F5");
    $("#DoctorSchedule").find('*[id*=Appointment_]').height($("#DoctorSchedule").find(".e-workcells").height() - 1);
    $(".e-categorybar").remove();
    $("#DoctorSchedule").find(".e-scheduleheader").parent().append($("<tr></tr>").append("<div id='grid2'></div>"));
    onScroller();
    onHover();
    $(".showcasecontainer").ejWaitingPopup("hide");
}

/* Scroller Customization*/
function onScroller() {
    $("#categorylist_container").find(".e-vscrollbar").css({ width: "8px", borderRight: "1px solid #c3c3c3" });
    $("#categorylist_container").find(".e-vscroll").children().first().css({ fontSize: "7px", borderRight: "1px solid #c3c3c3", borderTop: "1px solid #c3c3c3" });
    $("#categorylist_container").find(".e-vscroll").children().last().css({ fontSize: "7px", borderRight: "1px solid #c3c3c3", borderBottom: "1px solid #c3c3c3" });
    $(".doctorslist").find(".e-vscrollbar").css({ width: "8px", borderRight: "1px solid #c3c3c3", marginRight: "10px" });
    $("#doctorsdeptlist_container").find(".e-vscroll").children().first().css({ fontSize: "7px", borderRight: "1px solid #c3c3c3", borderTop: "1px solid #c3c3c3" });
    $("#doctorsdeptlist_container").find(".e-vscroll").children().last().css({ fontSize: "7px", borderRight: "1px solid #c3c3c3", borderBottom: "1px solid #c3c3c3" });
    $("#upcomming_container").find(".e-vscrollbar").css({ width: "8px", borderLeft: "1px solid #c3c3c3" });
    $("#upcomming_container").find(".e-vscroll").children().first().css("width", "7px");
    $("#upcomming_container").find(".e-vscroll").children().last().css("width", "7px");
    $("#upcomming_container").find(".e-vscroll").css("border-left", "none");
}

/* Appointment Template Images */
function _appointImages(id) {
    var schObj = $("#DoctorSchedule").ejSchedule('instance');
    var resObj = new ej.DataManager(window.doctorName).executeLocal(new ej.Query().where(schObj.model.resources[schObj.model.resources.length - 1].resourceSettings["id"], ej.FilterOperators.equal, id));
    if (resObj.length != 0) var resText = resObj[0].Text;
    switch (resText) {
        case "":
            return null;
        default:
            return "<img src='../Content/Dashboard/AppointmentPlanner/images/" + resText + ".png' style='width:40px;height:40px;border-radius:50%;'/>";
    }
}

function _resourceImages(id) {
    var schObj = $("#DoctorSchedule").ejSchedule('instance');
    var resObj = new ej.DataManager(window.doctorName).executeLocal(new ej.Query().where(schObj.model.resources[schObj.model.resources.length - 1].resourceSettings["id"], ej.FilterOperators.equal, id));
    if (resObj.length != 0) var resText = resObj[0].Text;
    switch (resText) {
        case "":
            return null;
        default:
            return "<img src='../Content/Dashboard/AppointmentPlanner/images/" + resText + ".png' style='width:25px;height:20px;float:left;border-radius:50%;margin-right:10px;'/>";
    }
}

function _doctorDesignation(type) {
    var result = new ej.DataManager(window.categorylist).executeLocal(new ej.Query().where("Value", ej.FilterOperators.equal, type))[0].Text;
    return result;
}

/* Appointment Color Calculation */
function _color(cat) {
    var color = new ej.DataManager(window.categorylist).executeLocal(new ej.Query().where("Value", ej.FilterOperators.equal, cat))[0].Color;
    var col = color.split("#")[1], amt = -25;
    var num = parseInt(col, 16);
    var r = (num >> 16) + amt;
    var b = ((num >> 8) & 0x00FF) + amt;
    var g = (num & 0x0000FF) + amt;
    var newColor = g | (b << 8) | (r << 16);
    return "#" + newColor.toString(16);
}

/* Appointment Height Calculation */
function _height(start, end) {
    var obj = $("#DoctorSchedule").ejSchedule('instance');
    var rStartTime = new Date(start);
    var rEndTime = new Date(end);
    var cellHeight = $(".e-workcells,.e-monthcells").height();
    var appHeight;
    if (obj.model.currentView != "month") {
        appHeight = ((parseFloat(new Date(new Date(rEndTime).getTime()) - new Date(new Date(rStartTime).getTime()))) / (60 * 1000) * (cellHeight * obj.model.timeScale.minorSlotCount) / (obj.model.timeScale.majorSlot)) - 1;
    }
    else
        appHeight = (cellHeight - $('.e-monthheader').height() - 15);
    return appHeight + "px";
}

/* Appointment Time */
function _timeformat(time1, time2) {
    return ej.format(new Date(time1), "hh:mm") + " - " + ej.format(new Date(time2), "hh:mm");
}

/* Appointment Color */
function _appcolor(cat) {
    var color = new ej.DataManager(window.categorylist).executeLocal(new ej.Query().where("Value", ej.FilterOperators.equal, cat))[0].Color;
    return color;
}

function _getResources(id, type) {
    var result;
    var schObj = $("#DoctorSchedule").ejSchedule('instance');
    if (type == "image") {
        var resObj = new ej.DataManager(window.doctorName).executeLocal(new ej.Query().where(schObj.model.resources[schObj.model.resources.length - 1].resourceSettings["id"], ej.FilterOperators.equal, id));
        if (resObj.length != 0) var resText = resObj[0].Text;
        result = "<img src='../Content/Dashboard/AppointmentPlanner/images/" + resText + ".png' style='width:50px;height:50px;float:left;border-radius:50%;'/>";
    }
    else if (type == "room") {
        var resObj = new ej.DataManager(window.departmentName).executeLocal(new ej.Query().where(schObj.model.resources[schObj.model.resources.length - 1].resourceSettings["id"], ej.FilterOperators.equal, id));
        if (resObj.length != 0) result = resObj[0].Text;
    }
    else if (type == "owner") {
        var resObj = new ej.DataManager(window.doctorName).executeLocal(new ej.Query().where(schObj.model.resources[schObj.model.resources.length - 1].resourceSettings["id"], ej.FilterOperators.equal, id));
        if (resObj.length != 0) result = resObj[0].Text;
    }
    return result;
}

$.views.helpers({
    appoint: _appointImages,
    doctor: _doctorDesignation,
    apptime: _timeformat,
    appcolor: _color,
    appbgm: _appcolor,
    lineheight: _height,
    resimages: _resourceImages,
    format: _getResources
});

function onListClick(args) {
    window.list = true;
    $("#waitid,#waitlist,#waitcategory,.icon-waiticon").removeClass("hovercolor");
    $(args.item).find("#waitid,#waitlist,#waitcategory,.icon-waiticon").addClass("hovercolor");
}

/* Schedule Navigation */
function OnNavigation(args) {
    $("#datepicker").ejDatePicker({ value: new Date(args.currentDate) });
}

/* DatePicker Selection */
function onSelected(args) {
    $("#DoctorSchedule").ejSchedule({ currentDate: new Date(args.value) });
    if ($(".rightcol").is(":visible") && window.innerWidth < 768) {
        $(".rightcol").toggle();
        $("#righticon").css("right", "0px");
        $("#righticon").children().addClass("icon-left").removeClass("icon-right");
    }
}

/* Appointment Window Resource Change */
function onDropdownHide(args) {
    var schObj = $("#DoctorSchedule").ejSchedule('instance');
    var resObj = $.grep(args.model.dataSource, function (e) { return e.Text == args.text; });
    var res = new ej.DataManager(schObj.model.resources[schObj.model.resources.length - 1].resourceSettings.dataSource).executeLocal(new ej.Query().where(schObj.model.resources[schObj.model.resources.length - 1].resourceSettings["groupId"], ej.FilterOperators.equal, resObj[0].Id));
    $("#deptdoctors").ejDropDownList({ dataSource: res, fields: { text: "Text", id: "Id", value: "Text" } });
    $("#deptdoctors").data("ejDropDownList").selectItemByText(res[0].Text);
}

/* Searchlist Dropdown Hide */
function onSearchtypeHide(args) {
    if (args.value == "Date") {
        $("#txtSearch").ejAutocomplete({ dataSource: [], enabled: false });
        $("#datesearchpanel").css("display", "block");
        $(".searchdatepicker").css("display", "inline-block");
        $("#startdatepicker,#enddatepicker").val("");
    }
    else {
        $("#datesearchpanel").css("display", "none");
        $(".searchdatepicker").css("display", "none");
        $("#txtSearch").ejAutocomplete({ dataSource: [], enabled: true });
    }
    onSearchClose();
}

/* Doctorlist Dropdown Hide */
function onDoctorlistHide(args) {
    doctorsCheck = false;
    var departmentlist = $.extend(true, [], window.departmentName);
    var doctorlist1 = $.extend(true, [], window.doctorName);
    var doctorlist = $.extend(true, [], doctorlist1);
    var schObj = $("#DoctorSchedule").ejSchedule('instance');
    var catObj = $("#categorylist").ejListBox('instance');
    var doctorlistChecked = [];
    if (args.text == "All") {
        $("#DoctorSchedule").ejSchedule({
            orientation: "horizontal",
            cellWidth: "50px",
            resources: [{
                field: "RoomId", title: "Room", name: "Rooms", allowMultiple: false,
                resourceSettings: { dataSource: departmentlist, text: "Text", id: "Id", groupId: "GroupId", color: "Color" }
            }, {
                field: "OwnerId", title: "Owner", name: "Owners", allowMultiple: true,
                resourceSettings: { dataSource: doctorlist, text: "Text", id: "Id", groupId: "GroupId", color: "Color" }
            }]
        });
        for (var a = 0; a < window.doctorName.length; a++) doctorlistChecked.push(a);
        $("#doctorsdeptlist").children().remove();
        $("#doctorsdeptlist").ejListBox({ dataSource: window.doctorName, checkedIndices: doctorlistChecked });
        $('*[id*=_doctorsdeptlist]').css({ float: "left", marginTop: "3px" });
    }
    else {
        var dtrlist = new ej.DataManager(doctorlist).executeLocal(new ej.Query().where("Designation", ej.FilterOperators.equal, args.text));
        var dptlist = new ej.DataManager(departmentlist).executeLocal(new ej.Query().where("Id", ej.FilterOperators.equal, dtrlist[0].GroupId));
        var checklist = [];
        for (var a = 0; a < dtrlist.length; a++) {
            checklist.push(a);
            var index = doctorlist.indexOf(dtrlist[a]);
            (index != -1) && doctorlistChecked.push(index);
        }
        $("#doctorsdeptlist").children().remove();
        $("#doctorsdeptlist").ejListBox({ dataSource: dtrlist, checkedIndices: checklist });
        $('*[id*=_doctorsdeptlist]').css({ float: "left", marginTop: "3px" });
        $("#DoctorSchedule").ejSchedule({
            orientation: (dtrlist > 2) ? "horizontal" : "vertical",
            cellWidth: (dtrlist > 2) ? "50px" : "",
            resources: [{
                field: "RoomId", title: "Room", name: "Rooms", allowMultiple: false,
                resourceSettings: { dataSource: dptlist, text: "Text", id: "Id", groupId: "GroupId", color: "Color" }
            }, {
                field: "OwnerId", title: "Owner", name: "Owners", allowMultiple: true,
                resourceSettings: { dataSource: dtrlist, text: "Text", id: "Id", groupId: "GroupId", color: "Color" }
            }]
        });
    }
    onSchedule();
    $(".e-resourceicon").click(function (e) { onResIconClick(e); });

    var categorylistChecked = $.extend(true, [], catObj.model.checkedIndices);
    categorylistChecked.sort();
    if (categorylistChecked.indexOf(0) == 0) categorylistChecked.splice(0, 1);
    var filterResult = appFilter(categorylistChecked, doctorlistChecked, schObj);
    schObj._currentAppointmentData = filterResult;
    schObj._dataProcessing(schObj._currentAppointmentData);
    schObj._renderAppointmentAll();
    $("#DoctorSchedule").find('*[id*=Appointment_]').height($("#DoctorSchedule").find(".e-workcells").height() - 1);
    $(".e-categorybar").remove();
    doctorsCheck = true;
}

/* Categorylist and Doctorlist Change Status */
function onListCheck(args) {
    if (!doctorsCheck)
        return;
    var schObj = $("#DoctorSchedule").ejSchedule('instance');
    var catObj = $("#categorylist").ejListBox('instance');
    var doctorlist = $.extend(true, [], window.doctorName);
    if (args.item.parent().attr("id") == "categorylist" && categoryCheck) {
        categoryCheck = false;
        if (args.text == "All") {
            (args.index == 0 && args.isChecked) ? $("#categorylist").ejListBox('checkAll') : $("#categorylist").ejListBox('uncheckAll');
        }
        else {
            var checked = $.extend(true, [], args.model.checkedIndices);
            if (checked.indexOf(0) == 0) checked.splice(0, 1);
            if (checked.length == categorylist.length)
                $("#categorylist").ejListBox('checkAll');
            else
                (args.model.checkedIndices.indexOf(args.index) == -1) && catObj.uncheckItemByIndex(0);
        }
    }
    else if (args.item.parent().attr("id") == "doctorsdeptlist") {
        var newdoctorlist = $.extend(true, [], args.model.dataSource);
        var newlist = [];
        for (var i = 0; i < newdoctorlist.length; i++) {
            if ($($($("#doctorsdeptlist").children()[i]).children()[0]).attr("aria-checked") == "true") {
                newlist.push(newdoctorlist[i]);
            }
        }
        $("#DoctorSchedule").ejSchedule({
            orientation: (newlist.length > 2) ? "horizontal" : "vertical",
            cellWidth: (newlist.length > 2) ? "50px" : "",
            resources: [{
                field: "RoomId", title: "Room", name: "Rooms", allowMultiple: false,
                resourceSettings: { dataSource: $.extend(true, [], window.departmentName), text: "Text", id: "Id", groupId: "GroupId", color: "Color" }
            }, {
                field: "OwnerId", title: "Owner", name: "Owners", allowMultiple: true,
                resourceSettings: { dataSource: newlist, text: "Text", id: "Id", groupId: "GroupId", color: "Color" }
            }]
        });
        onSchedule();
        args.model.dataSource = $.extend(true, [], newdoctorlist);
        window.doctorName = $.extend(true, [], doctorlist);
    }
    categoryCheck = true;
    var categorylistChecked = $.extend(true, [], catObj.model.checkedIndices);
    categorylistChecked.sort();
    if (categorylistChecked.indexOf(0) == 0) categorylistChecked.splice(0, 1);
    var docObj = $("#doctorsdeptlist").ejListBox('instance');
    var doctorlistChecked = [];
    for (var a = 0; a < docObj.model.dataSource.length; a++) {
        for (var b = 0; b < window.doctorName.length; b++) {
            if (window.doctorName[b].Id == docObj.model.dataSource[a].Id) {
                var index = b;
                break;
            }
        }
        if ($($($("#doctorsdeptlist").children()[a]).children()[0]).attr("aria-checked") == "true")
            (index != -1) && doctorlistChecked.push(index);
    }
    doctorlistChecked.sort();

    var filterResult = appFilter(categorylistChecked, doctorlistChecked, schObj);

    schObj._currentAppointmentData = filterResult;
    schObj._processed = [];
    schObj._dataProcessing(schObj._currentAppointmentData);
    schObj._renderAppointmentAll();
    $("#DoctorSchedule").find('*[id*=Appointment_]').height($("#DoctorSchedule").find(".e-workcells").height() - 1);
    $(".e-categorybar").remove();
}

/* Appointment Filter Condition */
function appFilter(catlist, doclist, schObj) {
    var complexFilter = [];
    for (var a = 0; a < catlist.length; a++) {
        for (var b = 0; b < doclist.length; b++) {
            var query = new ej.Predicate("Category", ej.FilterOperators.equal, window["categorylist"][catlist[a] - 1].Value, true).and("OwnerId", ej.FilterOperators.equal, (window["doctorName"][doclist[b]].Id), true);
            var result = schObj._dataManager.executeLocal(new ej.Query().where(query));

            if (result.length > 0) {
                for (var c = 0; c < result.length; c++) {
                    complexFilter.push(result[c]);
                }
            }
        }
    }
    return complexFilter;
}

function filterAppointments(filterConditions, schObj) {
    var result, queryManagar = ej.Query(), matchcaseVal;
    if (!ej.isNullOrUndefined(filterConditions)) {
        var firstFilterCondition = filterConditions[0];
        matchcaseVal = ej.isNullOrUndefined(firstFilterCondition.matchcase) ? true : firstFilterCondition.matchcase;
        var predicate = ej.Predicate(firstFilterCondition.field, firstFilterCondition.operator, firstFilterCondition.value, matchcaseVal);
        for (var i = 1; i < filterConditions.length; i++) {
            matchcaseVal = ej.isNullOrUndefined(filterConditions[i].matchcase) ? true : filterConditions[i].matchcase;
            predicate = predicate[filterConditions[i].predicate](filterConditions[i].field, filterConditions[i].operator, filterConditions[i].value, matchcaseVal);
        }
        queryManagar.where(predicate);
        result = new ej.DataManager(schObj._processed).executeLocal(queryManagar);
    }
    return result;
}

/* Schedule Cell Formatting */
function onQueryCellInfo(args) {
    if (args.model.orientation == "vertical") {
        switch (args.requestType) {
            case "workcells":
                if (args.cell.resources.Text == "DENTAL")
                    args.element.css("background-color", "#fdecea");
                else if (args.cell.resources.Text == "GENERAL")
                    args.element.css("background-color", "#e1ebf7");
                else if (args.cell.resources.Text == "JohnXavier" || args.cell.resources.Text == "Paul" || args.cell.resources.Text == "Smith" || args.cell.resources.Text == "Benita" || args.cell.resources.Text == "Nancy" || args.cell.resources.Text == "WillSmith")
                    args.element.css("background-color", "#e1ebf7");
                else if (args.cell.resources.Text == "Annie" || args.cell.resources.Text == "Helen" || args.cell.resources.Text == "George" || args.cell.resources.Text == "Shirley")
                    args.element.css("background-color", "#fdecea");
                break;
            case "monthcells":
                if (args.cell.resources.Text == "DENTAL")
                    args.element.css("background-color", "#fdecea");
                else if (args.cell.resources.Text == "GENERAL")
                    args.element.css("background-color", "#e1ebf7");
                else if (args.cell.resources.Text == "JohnXavier" || args.cell.resources.Text == "Paul" || args.cell.resources.Text == "Smith" || args.cell.resources.Text == "Benita" || args.cell.resources.Text == "Nancy" || args.cell.resources.Text == "WillSmith")
                    args.element.css("background-color", "#e1ebf7");
                else if (args.cell.resources.Text == "Annie" || args.cell.resources.Text == "Helen" || args.cell.resources.Text == "George" || args.cell.resources.Text == "Shirley")
                    args.element.css("background-color", "#fdecea");
                break;
            case "alldaycells":
                if (args.cell.resources.Text == "DENTAL")
                    args.element.css("background-color", "#fdecea");
                else if (args.cell.resources.Text == "GENERAL")
                    args.element.css("background-color", "#e1ebf7");
                else if (args.cell.resources.Text == "JohnXavier" || args.cell.resources.Text == "Paul" || args.cell.resources.Text == "Smith" || args.cell.resources.Text == "Benita" || args.cell.resources.Text == "Nancy" || args.cell.resources.Text == "WillSmith")
                    args.element.css("background-color", "#e1ebf7");
                else if (args.cell.resources.Text == "Annie" || args.cell.resources.Text == "Helen" || args.cell.resources.Text == "George" || args.cell.resources.Text == "Shirley")
                    args.element.css("background-color", "#fdecea");
                break;
            case "headercells":
                args.element.css("color", "#333");
                if (!ej.isNullOrUndefined(args.resource) && args.resource.Text == "DENTAL")
                    args.element.css("background-color", "#fdecea");
                else if (!ej.isNullOrUndefined(args.resource) && args.resource.Text == "GENERAL")
                    args.element.css("background-color", "#e1ebf7");
                else if (args.resource.Text == "JohnXavier" || args.resource.Text == "Paul" || args.resource.Text == "Smith" || args.resource.Text == "Benita" || args.resource.Text == "Nancy" || args.resource.Text == "WillSmith")
                    args.element.css("background-color", "#e1ebf7");
                else if (args.resource.Text == "Annie" || args.resource.Text == "Helen" || args.resource.Text == "George" || args.resource.Text == "Shirley")
                    args.element.css("background-color", "#fdecea");
                break;
            case "resourceheadercells":
                if (args.cellType == "headercells") {
                    if (!ej.isNullOrUndefined(args.resource) && args.resource.Text == "DENTAL")
                        args.element.css({ backgroundColor: "#fdecea", color: "#333" });
                    else if (!ej.isNullOrUndefined(args.resource) && args.resource.Text == "GENERAL")
                        args.element.css({ backgroundColor: "#e1ebf7", color: "#333" });
                    else if (args.resource.Text == "JohnXavier" || args.resource.Text == "Paul" || args.resource.Text == "Smith" || args.resource.Text == "Benita" || args.resource.Text == "Nancy" || args.resource.Text == "WillSmith")
                        args.element.css("background-color", "#e1ebf7");
                    else if (args.resource.Text == "Annie" || args.resource.Text == "Helen" || args.resource.Text == "George" || args.resource.Text == "Shirley")
                        args.element.css("background-color", "#fdecea");
                }
                else
                    args.element.css("background-color", "#F5F5F5");
                break;
            case "timecells":
            case "leftindentcells":
            case "leftheadercells":
                args.element.css("background-color", "#F5F5F5");
                break;
        }
    }
    else {
        switch (args.requestType) {
            case "workcells":
                if (args.cell.resources.Text == "GENERAL")
                    args.element.css("background-color", "#e1ebf7");
                else if (args.cell.resources.Text == "DENTAL")
                    args.element.css("background-color", "#fdecea");
                else if (args.cell.resources.Text == "JohnXavier" || args.cell.resources.Text == "Paul" || args.cell.resources.Text == "Smith" || args.cell.resources.Text == "Benita" || args.cell.resources.Text == "Nancy" || args.cell.resources.Text == "WillSmith")
                    args.element.css("background-color", "#e1ebf7");
                else if (args.cell.resources.Text == "Annie" || args.cell.resources.Text == "Helen" || args.cell.resources.Text == "George" || args.cell.resources.Text == "Shirley")
                    args.element.css("background-color", "#fdecea");
                break;
            case "resourceheadercells":
                if (!ej.isNullOrUndefined(args.resource)) {
                    if (args.cellType == "headerdivcells") {
                        if (args.resource.Text == "GENERAL")
                            args.element.children().css({ backgroundColor: "#C3DAF1", color: "#333" });
                        else if (args.resource.Text == "DENTAL")
                            args.element.children().css({ backgroundColor: "#FBDBD8", color: "#333" });
                        else if (args.resource.Text == "JohnXavier" || args.resource.Text == "Paul" || args.resource.Text == "Smith" || args.resource.Text == "Benita" || args.resource.Text == "Nancy" || args.resource.Text == "WillSmith")
                            args.element.css({ backgroundColor: "#e1ebf7", color: "#333" });
                        else if (args.resource.Text == "Annie" || args.resource.Text == "Helen" || args.resource.Text == "George" || args.resource.Text == "Shirley")
                            args.element.css({ backgroundColor: "#fdecea", color: "#333" });
                    }
                    else {
                        if (args.resource.Text == "GENERAL")
                            args.element.css({ backgroundColor: "#C3DAF1", color: "#333" });
                        else if (args.resource.Text == "DENTAL")
                            args.element.css({ backgroundColor: "#FBDBD8", color: "#333" });
                        else if (args.resource.Text == "JohnXavier" || args.resource.Text == "Paul" || args.resource.Text == "Smith" || args.resource.Text == "Benita" || args.resource.Text == "Nancy" || args.resource.Text == "WillSmith")
                            args.element.css({ backgroundColor: "#e1ebf7", color: "#333" });
                        else if (args.resource.Text == "Annie" || args.resource.Text == "Helen" || args.resource.Text == "George" || args.resource.Text == "Shirley")
                            args.element.css({ backgroundColor: "#fdecea", color: "#333" });
                    }
                }
                break;
            case "resourcegroupheader":
            case "timecells":
            case "headerdate":
            case "headercells":
                args.element.css("background-color", "#F5F5F5");
                break;
        }
    }
}

/* Listbox Node Dragging */
function onNodeDragging(args) {
    $("#DoctorSchedule").find(".e-tooltip-wrap").css("display", "none");
    var cloneElement = $(args.items[0].event.element[0].children).clone();
	cloneElement.find("#waitid,#waitlist,#waitcategory,.icon-waiticon").css({ color: "#fff" });
    $(".e-dragClonelist").html("");
    $(".e-dragClonelist").removeAttr("id");
    $(".e-dragClonelist").append($(cloneElement));
	$(".e-dragClonelist").removeClass("icon-waiticon");
    if ($(args.target).hasClass("e-workcells") && !$(args.target).hasClass("e-resourceheadercells")) {
        var schObj = $("#DoctorSchedule").ejSchedule('instance');
        schObj._workCellIndex = $(args.target).parent().index();
        var temp = schObj._getResourceDetails($(args.target), $(args.target).index());
        (args.items[0].data.RoomId == temp[1].id) ? $(args.target).css("cursor", "default") : $(args.target).css("cursor", "no-drop");
        if ($(".rightcol").is(":visible") && window.innerWidth < 768) {
            $(".rightcol").toggle();
            $("#righticon").css("right", "0px");
            $("#righticon").children().addClass("icon-left").removeClass("icon-right");
        }
    }
    if ($(args.target).hasClass("e-resourceheadercells")) {
        $(args.target).css("cursor", "no-drop");
        var trgtIndex = $(args.target).parent().index();
        if (trgtIndex == 0 || trgtIndex == 7) {
            if ($($(".e-resourceheadertable tr")[trgtIndex]).find(".e-parentnodecategory").hasClass("e-resourceexpand")) {
                $($(".e-resourceheadertable tr")[trgtIndex]).find(".e-parentnodecategory").click();
            }
        }
    }
    $(args.target).hasClass("e-appointment") && $(args.target).css("cursor", "no-drop");
}

/* Appointment DragStop */
function onDragStop(args) {
    if ($(args.target).hasClass("e-workcells")) {
        var schObj = $("#DoctorSchedule").ejSchedule('instance');
        schObj._workCellIndex = $(args.target).parent().index();
        $(args.target).click();
        var resDetails = schObj._getResourceDetails($(args.target), $(args.target).index());
        if ((args.items[0].data.RoomId == resDetails[1].id)) {
            var dropAppointment = $.extend(true, {}, args.items[0].data);
            dropAppointment[schObj._appointmentSettings["startTime"]] = new Date(schObj.cur_StartTime);
            dropAppointment[schObj._appointmentSettings["endTime"]] = new Date(schObj.cur_EndTime);
            dropAppointment[schObj._appointmentSettings.resourceFields.split(",")[1]] = resDetails[0].id;
            var schArgs = [{ appointment: dropAppointment, edit: true, type: "appointmentWindowOpen", model: schObj.model, cancel: false }];
            window.drop = true;
            onAppointmentWindowOpen(schArgs[0]);
        }
    }
    $("#DoctorSchedule").find(".e-workcells").css("cursor", "default");
    $("#DoctorSchedule").find(".e-appointment").css("cursor", "default");
}

/* Appointment Window */
function onAppointmentWindowOpen(args) {
    $("#recurrence").ejCheckBox({ checked: false, enabled: true });
    $("#recWindow").css("display", "none");
    $("#editApp").css("display", "none");
    $("#appWindow").css("display", "block");
    if (!args.model.readOnly) {
        var schObj = $("#DoctorSchedule").ejSchedule('instance');
        args.cancel = true;
        $("#StartTime").ejDateTimePicker({ value: args.startTime });
        $("#EndTime").ejDateTimePicker({ value: args.endTime });
        if (ej.isNullOrUndefined(args.edit)) {
            var res = args.model.resources[0].resourceSettings.dataSource;
            $("#Department").ejDropDownList({ dataSource: res, fields: { text: "Text", id: "Td", value: "Text" } });
            var res2 = new ej.DataManager(res).executeLocal(new ej.Query().where(args.model.resources[args.model.resources.length - 1].resourceSettings["id"], ej.FilterOperators.equal, args.resources.GroupId));
            var res1 = new ej.DataManager(args.model.resources[args.model.resources.length - 1].resourceSettings.dataSource).executeLocal(new ej.Query().where(args.model.resources[args.model.resources.length - 1].resourceSettings["groupId"], ej.FilterOperators.equal, args.resources.GroupId));
            $("#deptdoctors").ejDropDownList({ dataSource: res1, fields: { text: "Text", id: "Td", value: "Text" } });
            $("#deptdoctors").data("ejDropDownList").selectItemByText(args.resources.Text);
            $("#Department").data("ejDropDownList").selectItemByText(res2[0].Text);
        }
        else {
            var res = new ej.DataManager(args.model.resources[0].resourceSettings.dataSource).executeLocal(new ej.Query().where(args.model.resources[0].resourceSettings["id"], ej.FilterOperators.equal, args.appointment.RoomId));
            $("#Department").data("ejDropDownList").selectItemByText(res[0].Text);
            var res2 = new ej.DataManager(args.model.resources[args.model.resources.length - 1].resourceSettings.dataSource).executeLocal(new ej.Query().where(args.model.resources[args.model.resources.length - 1].resourceSettings["groupId"], ej.FilterOperators.equal, res[0].Id));
            $("#deptdoctors").ejDropDownList({ dataSource: res2, fields: { text: "Text", id: "Id", value: "Text" } });
            var res1 = new ej.DataManager(args.model.resources[args.model.resources.length - 1].resourceSettings.dataSource).executeLocal(new ej.Query().where(args.model.resources[args.model.resources.length - 1].resourceSettings["id"], ej.FilterOperators.equal, args.appointment.OwnerId));
            $("#deptdoctors").data("ejDropDownList").selectItemByText(res1[0].Text);
            window.appedit = ej.isNullOrUndefined(args.waitinglistedit) ? true : false;
        }
        if (!ej.isNullOrUndefined(args.target)) {
            $('#recurrence').prop('disabled', false);
            recurCheck();
            $("#StartTime,#EndTime").ejDateTimePicker({ enabled: ($(args.target.currentTarget).hasClass("e-alldaycells") || $(args.target.currentTarget).hasClass("e-monthcells") || args.model.currentView == "month") ? false : true });
        }
        if (!ej.isNullOrUndefined(args.appointment)) {
            window.appointmentRule = null;
            window.appointedit = true;
            $("#customId").val(args.appointment.Id);
            $("#subject").val(args.appointment.Subject);
            $("#customdescription").val(args.appointment.Description);
            $("#StartTime").ejDateTimePicker({ value: new Date(args.appointment.StartTime) });
            $("#EndTime").ejDateTimePicker({ value: new Date(args.appointment.EndTime) });
            var category = new ej.DataManager(window.categorylist).executeLocal(new ej.Query().where("Value", ej.FilterOperators.equal, args.appointment.Category));
            var index = window.categorylist.indexOf(category[0]);
            index = (index < 0) ? 0 : index;
            $("#Category").ejDropDownList({ selectedIndex: index });
            $("#Category").val(category[0].Text);
            if (args.appointment.Recurrence) {
                $("#recurrence").ejCheckBox({ checked: args.appointment.Recurrence, enabled: (schObj._currentAction == "editSeries") ? true : false });
                if (schObj._currentAction == "editSeries") {
                    $("#editApp").css("display", "block");
                    window.appointmentRule = args.appointment.RecurrenceRule;
                }
            }
            else
                $("#recurrence").ejCheckBox({ checked: false, enabled: true });
            $("#recWindow").css("display", "none");
            $("#appWindow").css("display", "block");
        }
        else {
            window.appointedit = false;
            $("#customWindow").ejDialog({
                width: "auto",
                height: "auto",
                showOnInit: false,
                enableModal: true,
                title: "Patient Appointment Details",
                enableResize: false,
                allowKeyboardNavigation: false,
                close: "clearFields"
            });

            $("#subject").ejAutocomplete({
                width: "100%",
                dataSource: window.patientlist,
                watermarkText: "Select Patient Name",
                fields: { text: "Name" },
                showPopupButton: false
            });
        }
        $("#customWindow").ejDialog("open");
    }
}

/* Appointment Save */
function save() {
    if ($.trim($("#subject").val()) == "") {
        $("#subject").addClass("error");
        return false;
    }
    var obj = {};
    if ($("#customId").val() != "") {
        obj["Id"] = parseInt($("#customId").val());
    }
    else if ($("#customId").val() == "")
        obj["Id"] = parseInt(ej.isNullOrUndefined(window.waitinglist[window.waitinglist.length - 1]) ? 1 : window.waitinglist[window.waitinglist.length - 1].Id + 1);
    obj["Subject"] = $("#subject")[0].value;
    obj["Description"] = $("#customdescription")[0].value;
    obj["StartTime"] = new Date($("#StartTime")[0].value);
    obj["EndTime"] = new Date($("#EndTime")[0].value);
    obj["Department"] = $("#Department").ejDropDownList("model.value");
    obj["RoomId"] = new ej.DataManager(window.departmentName).executeLocal(new ej.Query().where("Text", ej.FilterOperators.equal, $("#Department").ejDropDownList("model.value")))[0].Id;
    obj["OwnerId"] = new ej.DataManager(window.doctorName).executeLocal(new ej.Query().where("Text", ej.FilterOperators.equal, $("#deptdoctors").ejDropDownList("model.value")))[0].Id;
    var color = new ej.DataManager(window.categorylist).executeLocal(new ej.Query().where("Text", ej.FilterOperators.equal, $("#Category").ejDropDownList("model.value")));
    if (color.length > 0) {
        obj["Categorycolor"] = color[0].Color;
        obj["Category"] = color[0].Value;
    }
    else {
        obj["Categorycolor"] = window.categorylist[0].Color;
        obj["Category"] = window.categorylist[0].Value;
    }
    obj["Recurrence"] = $("#recurrence")[0].checked;
    obj["RecurrenceRule"] = (obj.Recurrence) ? window.recurRule : null;
    $("#customWindow").ejDialog("close");


    var schObj = $("#DoctorSchedule").ejSchedule('instance');
    var predicate1 = ej.Predicate(schObj._appointmentSettings["startTime"], ej.FilterOperators.lessThanOrEqual, new Date(obj.StartTime)).and(schObj._appointmentSettings["endTime"], ej.FilterOperators.greaterThanOrEqual, new Date(new Date(obj.EndTime)));
    var predicate = predicate1["and"](schObj._appointmentSettings.resourceFields.toString().split(',')[schObj.model.resources.length - 1].trim(), ej.FilterOperators.equal, obj[schObj._appointmentSettings.resourceFields.split(",")[1]]);
    var result = new ej.DataManager(schObj._processed).executeLocal(new ej.Query().where(predicate));

    window.addlist = (result.length > 0) ? true : false;

    $("#tokenWindow").ejDialog({
        width: "auto",
        height: "auto",
        showOnInit: false,
        enableModal: true,
        title: "Appointment",
        enableResize: false,
        allowKeyboardNavigation: false,
        close: "clearFields"
    });

    if (!window.addlist && !window.waitinglistedit) {
        var clone = $.extend(true, {}, obj);
        if (!window.appointedit || window.drop) obj["Id"] = "";
        schObj.saveAppointment(obj);
        $("#tokenWindow").find("#apptoken").css("display", "none");
        $("#tokenWindow").find("#appstatus").css("display", "block");
        $("#tokenWindow").ejDialog("open");
        $(".e-categorybar").remove();
        if (!window.appointedit || window.drop) {
            var index = window.waitinglist.indexOf(new ej.DataManager(window.waitinglist).executeLocal(new ej.Query().where("Id", ej.FilterOperators.equal, clone.Id))[0]);
            (index != -1) ? window.waitinglist.splice(index, 1) : "";
            $("#upcomming").children().remove();
            $("#upcomming").ejListBox({ dataSource: window.waitinglist });
            setTimeout(function () { onWaitingList(); }, 1);
        }
        window.appointedit = false;
        window.drop = false;
    }
    else {
        if (window.waitinglistedit) {
            new ej.DataManager(window.waitinglist).remove("Id", obj.Id);
        }
        window.waitinglist.push(obj);
        window.waitinglist.sort(function (a, b) { return (a.Id - b.Id); });
        if (window.appedit) {
            var editapp = new ej.DataManager(schObj._processed).executeLocal(new ej.Query().where(schObj._appointmentSettings.id, ej.FilterOperators.equal, obj.Id));
            schObj.deleteAppointment(editapp[0]);
        }
        $("#upcomming").children().remove();
        $("#upcomming").ejListBox({ dataSource: window.waitinglist });
        onWaitingList();
        onHover();
        $("#tokenWindow").find("#appstatus").css("display", "none");
        $("#tokenWindow").find("#apptoken").css("display", "block");
        $("#tokenWindow").ejDialog("open");
        $("#tokenWindow").find("#lbltext").html(obj.Id);
        window.addlist = false;
        window.waitinglistedit = false;
        clearFields();
    }
}

/* Clear form fields */
function clearFields() {
    $("#customId").val("");
    $("#subject").val("");
    $("#customdescription").val("");
    $("#Category").val("");
    $("#deleteId").val("");
    $("#allday").prop("checked", false);
    $("#recurrence").prop("checked", false);
    $("tr.recurrence").css("display", "none");
    $("#StartTime,#EndTime").ejDateTimePicker({ enabled: true });
    $("#patientname,#patientdob,#patientmobile,#patientaddress").removeClass("error");
}

/* Recurrence Check */
function recurCheck() {
    var recChkObj = $("#recurrence").ejCheckBox('instance');
    if (recChkObj.checked()) {
        $("#recWindow").css("display", "block");
        $("#appWindow").css("display", "none");
    }
    else {
        $("#recWindow").css("display", "none");
    }
}

/* Recurrence Window Load */
function onRecurrenceRule() {
    $("#recWindow").css("display", "block");
    $("#appWindow").css("display", "none");
    window.recurRule = window.appointmentRule;
}

function temp() {
    $("#subject,#patientaddress,#patientmobile,#patientdob,#patientname").removeClass("error");
}

/* Button Cancel */
function cancel() {
    clearFields();
    $("#customWindow").ejDialog("close");
    $("#deleteWindow").ejDialog("close");
    $("#tokenWindow").ejDialog("close");
}

/* Waitinglist Appointment Delete */
function done() {
    var delId = parseInt($("#deleteId").val());
    var result = $.grep(window.waitinglist, function (e) { return e.Id == delId; });
    var index = window.waitinglist.indexOf(result[0]);
    window.waitinglist.splice(index, 1);
    $("#upcomming").children().remove();
    $("#upcomming").ejListBox({ dataSource: window.waitinglist });
    $("#upcomming_container").css("border", "none");
    $("#upcomming").children().addClass("waitinglistli");
    $("#deleteWindow").ejDialog("close");
}

/* Appointment Search */
function searchKeyUp() {
    var searchlist = [], searchString = $("#txtSearch").val();
    var srchObj = $("#searchlist").ejDropDownList('instance');
    if (searchString != "") {
        switch (srchObj.selectedTextValue) {
            case "ID":
                if ($.isNumeric(parseInt(searchString)))
                    searchlist.push({ field: "AppTaskId", operator: "contains", value: parseInt(searchString) });
                if (searchlist.length > 0) {
                    var schObj = $("#DoctorSchedule").ejSchedule('instance');
                    var list = filterAppointments(searchlist, schObj);
                    $("#txtSearch").ejAutocomplete({
                        dataSource: list,
                        fields: { key: "AppTaskId", text: "AppTaskId" }
                    });
                }
                else $("#txtSearch").addClass("error");
                break;
            case "Name":
                $("#txtSearch").ejAutocomplete({
                    dataSource: window.patientlist,
                    fields: { key: "Id", text: "Name" }
                });
                break;
            case "Description":
                if (!$.isNumeric(parseInt(searchString)))
                    searchlist.push({ field: "Description", operator: "contains", value: searchString });
                if (searchlist.length > 0) {
                    var schObj = $("#DoctorSchedule").ejSchedule('instance');
                    var list = filterAppointments(searchlist, schObj);
                    $("#txtSearch").ejAutocomplete({
                        dataSource: list,
                        fields: { key: "AppTaskId", text: "Description" }
                    });
                }
                else $("#txtSearch").addClass("error");
                break;
            case "Category":
                $("#txtSearch").ejAutocomplete({
                    dataSource: window.categorylist,
                    fields: { key: "Value", text: "Value" }
                });
                break;
            default:
                break;
        }
    }
    else {
        $("#DoctorSchedule").find(".e-datecommondiv").show();
        $("#DoctorSchedule").find(".e-scheduleheader").next().show();
        $("#DoctorSchedule").find(".e-scheduleheader").next().next().show();
        $("#DoctorSchedule").find(".e-viewsdiv").css("visibility", "");
        $("#grid2").hide();
        $("#txtSearch").removeClass("error");
        $("#txtSearch_dropdown").children().removeClass("icon-close").addClass("e-icon e-search");
    }
}

function onSearchResultSelect(args) {
    var schObj = $("#DoctorSchedule").ejSchedule('instance');
    var srchObj = $("#searchlist").ejDropDownList('instance');
    var searchlist = [], result;
    switch (srchObj.selectedTextValue) {
        case "ID":
            result = new ej.DataManager(args.model.dataSource).executeLocal(new ej.Query().where("AppTaskId", ej.FilterOperators.equal, parseInt(args.model.value)));
            break;
        case "Name":
            if (!$.isNumeric(parseInt(args.model.value))) searchlist.push({ field: "Subject", operator: "contains", value: args.model.value });
            if (searchlist.length > 0) result = filterAppointments(searchlist, schObj);
            break;
        case "Description":
            result = new ej.DataManager(args.model.dataSource).executeLocal(new ej.Query().where("Description", ej.FilterOperators.equal, args.model.value));
            break;
        case "Category":
            if (!$.isNumeric(parseInt(args.model.value))) searchlist.push({ field: "Category", operator: "contains", value: args.model.value });
            if (searchlist.length > 0) result = filterAppointments(searchlist, schObj);
            break;
        default:
            break;
    }

    if (result.length > 0) {
        showResult(result, srchObj.selectedTextValue);
    }
}

function onSearchDateChange(args) {
    $("#datesearch").ejToggleButton({ toggleState: false });
}

function onDateSearch(args) {
    if (args.isChecked) {
        $("#datesearch").ejToggleButton({ toggleState: false });
        var strDate = $("#startdatepicker").val();
        var endDate = $("#enddatepicker").val();
        if (strDate !== "" && strDate !== null && endDate !== "" && endDate !== null) {
            var schObj = $("#DoctorSchedule").ejSchedule('instance');
            var query = ej.Predicate("StartTime", ej.FilterOperators.greaterThanOrEqual, new Date(strDate), false).and("StartTime", ej.FilterOperators.lessThanOrEqual, new Date(new Date(endDate).setHours(23, 59, 59)), false);
            var result = new ej.DataManager(schObj._processed).executeLocal(new ej.Query().where(query));
            if (result.length > 0) {
                showResult(result, "DateSearch");
            }
        }
        else {
            $("#datesearch").ejToggleButton({ toggleState: false });
        }
    }
    else {
        onSearchClose();
    }
}

function showResult(list, searchString) {
    if (!ej.isNullOrUndefined(list) && list.length != 0 && searchString != "") {
        $("#DoctorSchedule").find(".e-datecommondiv").hide();
        $("#DoctorSchedule").find(".e-scheduleheader").next().hide();
        $("#DoctorSchedule").find(".e-scheduleheader").next().next().hide();
        $("#DoctorSchedule").find(".e-viewsdiv").css("visibility", "hidden");
        $("#grid2").show();
        $("#grid2").data("ejGrid") && $("#grid2").ejGrid("destroy");
        $("#grid2").ejGrid({
            width: "100%",
            dataSource: list,
            allowPaging: true,
            isResponsive: true,
            pageSettings: { pageSize: 10 },
            recordDoubleClick: "detailsClick",
            columns: [
                   { field: "AppTaskId", headerText: "ID" },
                   { field: "Subject", headerText: "Name" },
                   { field: "Description", headerText: "Description" },
                   { field: "StartTime", headerText: "Start Time", format: "{0:MM/dd/yyyy hh:mm tt}" },
                   { field: "EndTime", headerText: "End Time", format: "{0:MM/dd/yyyy hh:mm tt}", },
                   { field: "Category", headerText: "Category" },
                   { field: "RoomId", headerText: "DepartmentID" },
                   { field: "OwnerId", headerText: "DoctorID" }
            ]
        });
        $("#grid2").find("div.e-prev").removeClass("e-prev");
        $("#txtSearch").removeClass("error");
    }
    else {
        onSearchClose();
        $("#txtSearch").addClass("error");
    }
}

function onSearchClose() {
    $("#DoctorSchedule").find(".e-datecommondiv").show();
    $("#DoctorSchedule").find(".e-scheduleheader").next().show();
    $("#DoctorSchedule").find(".e-scheduleheader").next().next().show();
    $("#DoctorSchedule").find(".e-viewsdiv").css("visibility", "");
    $("#grid2").hide();
    $("#txtSearch,#startdatepicker,#enddatepicker").val("");
    $("#txtSearch").ejAutocomplete({ dataSource: [] });
    $("#txtSearch_dropdown").children().removeClass("icon-close").addClass("e-icon e-search");
}

function detailsClick(args) {
    $("#DoctorSchedule").ejSchedule({ currentDate: new Date(args.data.StartTime) });
    onSearchClose();
    $("#datesearch").ejToggleButton({ toggleState: false });
}