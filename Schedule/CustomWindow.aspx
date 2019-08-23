<%@ Page Title="Schedule-Custom Window-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to customize the default appointment window in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CustomWindow.aspx.cs" Inherits="WebSampleBrowser.Schedule.CustomWindow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Time Mode</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" CurrentDate="6/5/2017" AppointmentWindowOpen="onAppointmentWindowOpen" CellClick="onClick" Create="onCreate">
            <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" />
        </ej:Schedule>
    </div>

    <div id="customWindow" style="padding: 1em; display: none;">
        <div id="appointmentWindow" class="appointmentWindow">
            <form id="customAppointmentWindow">
                <table width="100%" cellpadding="5">
                    <tbody>
                        <tr id="customId" style="display: none">
                            <td class="e-textlabel">Id:</td>
                            <td colspan="4">
                                <input id="Id" class="Id" type="text" name="Id" />
                            </td>
                        </tr>
                        <tr id="customSubject">
                            <td class="e-textlabel">Subject:</td>
                            <td colspan="4">
                                <input id="Subject" class="Subject" type="text" value="" name="Subject" style="width: 100%" />
                            </td>
                        </tr>
                        <tr id="customDescription">
                            <td class="e-textlabel">Description:</td>
                            <td colspan="4">
                                <textarea id="Description" class="Description" name="Description" rows="3" cols="50" style="width: 100%; height: 60px !important; resize: vertical"></textarea>
                            </td>
                        </tr>
                        <tr id="customStartendtime">
                            <td class="e-textlabel">StartTime:</td>
                            <td colspan="2">
                                <input id="StartTime" class="StartTime" type="text" value="" name="StartTime" />
                            </td>
                            <td class="e-textlabel">EndTime:</td>
                            <td colspan="2">
                                <input id="EndTime" class="EndTime" type="text" value="" name="EndTime" />
                            </td>
                        </tr>
                        <tr id="customAlldayrecurcheck">
                            <td colspan="4">
                                <div id="alldayCheck" class="customAlign">
                                    <div class='e-textlabel customAlign'>AllDay:</div>
                                    <div class="customAlign">
                                        <input id="AllDay" class="AllDay" type="checkbox" name="AllDay" />
                                    </div>
                                </div>
                                <div id="recurCheck" class="customAlign">
                                    <div class="e-textlabel customAlign">Recurrence:</div>
                                    <div class="customAlign">
                                        <input id="Recurrence" class="Recurrence" type="checkbox" name="Recurrence" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <div id="buttonAction">
                <div>
                    <button id="appOk" type='button' class="e-appButton e-appOk" style="margin-right: 5px;">Submit</button>
                    <button id="appCancel" type="button" class="e-appButton e-appCancel">Cancel</button>
                </div>
            </div>
        </div>
        <div id="recurrenceWindow" class="recurrenceWindow" style="display: none;">
            <div id="customRecurrenceEditor"></div>
            <div id="buttonAction">
                <div>
                    <button id="recurOk" type='button' class="e-recurButton e-recurOk" style="margin-right: 5px;">Submit</button>
                    <button id="recurCancel" type="button" class="e-recurButton e-recurCancel">Cancel</button>
                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function onCreate(args) {
            this._customAppointmentWindow = $("#customWindow");
            this._customAppointmentWindow.ejDialog({
                width: (this._mediaQuery) ? "100%" : 600,
                showOnInit: false,
                enableModal: true,
                title: this._getLocalizedLabels("CreateAppointmentTitle"),
                enableResize: false,
                allowKeyboardNavigation: false,
                cssClass: "e-scheduledialog",
                close: "clearFields"
            });
            this._customAppointmentWindow.parents().find(".e-scheduledialog").find(".e-titlebar").addClass("e-dialogheader");
            this._customAppointmentWindow.find("#StartTime,#EndTime").ejDateTimePicker({ width: "150px" });
            this._customAppointmentWindow.find(".e-appButton,.e-recurButton").ejButton({ width: '85px', click: "onButtonClick" });
            this._customAppointmentWindow.find(".AllDay,.Recurrence").ejCheckBox({ change: "onCheckboxChange" });
            this._customAppointmentWindow.find("#customRecurrenceEditor").ejRecurrenceEditor({
                frequencies: ["daily", "weekly", "monthly", "yearly"],
                selectedRecurrenceType: 1
            });
        }

        function onClick(args) {
            this._customAllDay = $(args.target.currentTarget).closest(".e-alldaycells").hasClass("e-alldaycells");
        }

        function onAppointmentWindowOpen(args) {
            args.cancel = true;
            this._customRecRule = null;
            if (!ej.isNullOrUndefined(args.appointment)) {
                this._customAppointmentWindow.find("#Id").val(args.appointment.Id);
                this._customAppointmentWindow.find("#Subject").val(args.appointment.Subject);
                this._customAppointmentWindow.find("#Description").val(args.appointment.Description);
                this._customAppointmentWindow.find("#StartTime").ejDateTimePicker({ value: new Date(args.appointment.StartTime) });
                this._customAppointmentWindow.find("#EndTime").ejDateTimePicker({ value: new Date(args.appointment.EndTime) });
                this._customAppointmentWindow.find("#AllDay").ejCheckBox({ checked: args.appointment.AllDay });
                this._customAppointmentWindow.find("#Recurrence").ejCheckBox({ checked: args.appointment.Recurrence });
                if (args.appointment.Recurrence) {
                    if (this._currentAction == ej.Schedule.Actions.EditSeries) {
                        this._customRecRule = args.appointment.RecurrenceRule.split(";EXDATE")[0];
                    }
                    else if (this._currentAction == ej.Schedule.Actions.EditOccurrence) {
                        this._customAppointmentWindow.find("#Recurrence").ejCheckBox("disable");
                        this._customRecRule = args.appointment.RecurrenceRule;
                    }
                }
            }
            else {
                this._customAppointmentWindow.find("#StartTime").ejDateTimePicker({ value: args.startTime });
                this._customAppointmentWindow.find("#EndTime").ejDateTimePicker({ value: args.endTime });
                if (!ej.isNullOrUndefined(args.target)) {
                    if ($(args.target.currentTarget).closest(".e-alldaycells").hasClass("e-alldaycells") || this.currentView() == "month" || this._customAllDay) {
                        this._customAppointmentWindow.find("#AllDay").ejCheckBox({ checked: true });
                        this._customAppointmentWindow.find("#StartTime,#EndTime").ejDateTimePicker({ enabled: false });
                    }
                }
            }
            this._customAppointmentWindow.find("#appointmentWindow").css({ display: "block" });
            this._customAppointmentWindow.find("#recurrenceWindow").css({ display: "none" });
            this._customAppointmentWindow.ejDialog("open");
            this._customAppointmentWindow.find("#Subject").focusin(function () { $(this).removeClass("validationError"); }).focusout(function () { if ($(this).val() == "") $(this).addClass("validationError"); });
        }

        function onButtonClick(args) {
            var proxy = $("#Schedule1").ejSchedule("instance");
            if ($(args.target).hasClass("e-appButton")) {
                if ($(args.target).hasClass("e-appOk")) {
                    if (proxy._customAppointmentWindow.find("#Subject").val().trim() == "") return false;
                    var appObj = {};
                    appObj["Id"] = (proxy._customAppointmentWindow.find("#Id").val() == "") ? proxy._customAppointmentWindow.find("#Id").val() : parseInt(proxy._customAppointmentWindow.find("#Id").val());
                    appObj["Subject"] = proxy._customAppointmentWindow.find("#Subject").val();
                    appObj["Description"] = proxy._customAppointmentWindow.find("#Description").val();
                    appObj["StartTime"] = proxy._customAppointmentWindow.find("#StartTime").ejDateTimePicker("model.value");
                    appObj["EndTime"] = proxy._customAppointmentWindow.find("#EndTime").ejDateTimePicker("model.value");
                    appObj["AllDay"] = proxy._customAppointmentWindow.find("#AllDay").ejCheckBox("isChecked");
                    appObj["Recurrence"] = proxy._customAppointmentWindow.find("#Recurrence").ejCheckBox("isChecked");
                    if (appObj.Recurrence) {
                        appObj[proxy._appointmentSettings["recurrenceRule"]] = proxy._customRecRule;
                        var recurEdit = proxy._appointmentAddWindow.find(".e-recurrenceeditor").data("ejRecurrenceEditor");
                        recurEdit._recRule = proxy._customRecRule;
                    }
                    proxy.saveAppointment(appObj);
                }
                proxy._customAppointmentWindow.ejDialog("close");
            }
            else {
                proxy._customAppointmentWindow.find("#appointmentWindow,#recurrenceWindow").toggle();
                if ($(args.target).hasClass("e-recurOk")) {
                    var recurObj = proxy._customAppointmentWindow.find("#customRecurrenceEditor").ejRecurrenceEditor("instance");
                    var recSummary = recurObj.closeRecurPublic();
                    proxy._customRecRule = recurObj._recRule;
                }
                else {
                    proxy._customAppointmentWindow.find("#Recurrence").ejCheckBox({ checked: false });
                }
            }
        }

        function onCheckboxChange(args) {
            var proxy = $("#Schedule1").ejSchedule("instance");
            if (args.model.id == "AllDay") {
                if (args.isChecked) {
                    var strDate = new Date(proxy._customAppointmentWindow.find("#StartTime").ejDateTimePicker("model.value").setHours(0, 0, 0));
                    var endDate = new Date(proxy._customAppointmentWindow.find("#EndTime").ejDateTimePicker("model.value").setHours(23, 59, 59));
                    proxy._customAppointmentWindow.find("#StartTime").ejDateTimePicker({ value: new Date(strDate), enabled: false });
                    proxy._customAppointmentWindow.find("#EndTime").ejDateTimePicker({ value: new Date(endDate), enabled: false });
                }
                else {
                    proxy._customAppointmentWindow.find("#StartTime").ejDateTimePicker({ enabled: true });
                    proxy._customAppointmentWindow.find("#EndTime").ejDateTimePicker({ enabled: true });
                }
            }
            else {
                if (args.isChecked) {
                    proxy._customAppointmentWindow.find("#appointmentWindow,#recurrenceWindow").toggle();
                    var recurEdit = proxy._customAppointmentWindow.find("#customRecurrenceEditor").data("ejRecurrenceEditor");
                    recurEdit.clearRecurrenceFields();
                    var strDate = new Date(proxy._customAppointmentWindow.find('#StartTime').ejDateTimePicker("option", "value"));
                    recurEdit.model.startDate = strDate;
                    recurEdit.setDefaultValues();
                }
            }
        }

        function clearFields() {
            var proxy = $("#Schedule1").ejSchedule("instance");
            proxy._customAppointmentWindow.find("#Id").val("");
            proxy._customAppointmentWindow.find("#Subject").val("");
            proxy._customAppointmentWindow.find("#Description").val("");
            proxy._customAppointmentWindow.find("#AllDay,#Recurrence").ejCheckBox({ checked: false });
            proxy._customAppointmentWindow.find("#AllDay,#Recurrence").ejCheckBox("enable");
            proxy._customAppointmentWindow.find("#StartTime,#EndTime").ejDateTimePicker({ enabled: true });
        }
    </script>
</asp:Content>
<asp:Content runat="server" ID="Style" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #buttonAction {
            position: relative;
            height: 25px;
        }

            #buttonAction > div {
                width: 180px;
                position: absolute;
                right: 0px;
            }

        .validationError {
            background-color: #FF8A8A;
        }

        .customAlign {
            float: left;
            padding-right: 20px;
        }
    </style>
</asp:Content>

