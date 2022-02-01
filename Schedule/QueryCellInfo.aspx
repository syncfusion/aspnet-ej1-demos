<%@ Page Title="Schedule-Cell Formatting-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to customize the cells in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="QueryCellInfo.aspx.cs" Inherits="WebSampleBrowser.Schedule.QueryCellInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Cell Formatting</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" AppointmentWindowOpen="onAppointmentWindowOpen" ID="Schedule1" Views="Day,Week,WorkWeek,Month" QueryCellInfo="check" DataSourceID="objectDataSource1" Width="100%" Height="525px" CurrentDate="6/5/2017" CurrentView="Day">
    <WorkHours Start="12"/>
    <Resources>
        <ej:Resources Field="RoomID" Name="Rooms" Title="Room" AllowMultiple="true">
            <ResourceSettings Color="color" Id="id" Text="text">
            </ResourceSettings>
        </ej:Resources>
        <ej:Resources Field="Owner" Name="Owners" Title="Owner" AllowMultiple="true">
            <ResourceSettings Color="color" Id="id" Text="text" GroupId="groupId">
            </ResourceSettings>
        </ej:Resources>
    </Resources>
    <Group Resources="Rooms,Owners"/>
    <AppointmentSettings Id="ID" Subject="Subject" AllDay="AllDay" StartTimeZone="StartTimeZone" EndTimeZone="EndTimeZone" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" ResourceFields="RoomID,Owner"/>
</ej:Schedule>
    </div>
    <asp:ObjectDataSource ID="objectDataSource1" runat="server" TypeName="ScheduleAppointmentsObjDatum" SelectMethod="GetQueryCellRecords">

    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
		function onAppointmentWindowOpen(args) {
			if (this._appointmentAddWindow.find("#EventType").length == 0) {
                $("<tr><td class='e-leftfields e-textlabel'>Event Type:</td><td class='e-rightfields' colspan='3'><input type='text' id='EventType'/></td></tr>").insertAfter(this._appointmentAddWindow.find("." + this._id + "parrow"));
                this._appointmentAddWindow.find("#EventType").ejDropDownList({
                    dataSource: [
                        { text: "Public Event", value: "Public Event" },
                        { text: "Holiday", value: "Holiday" },
                        { text: "Maintenance", value: "Maintenance" },
                        { text: "Commercial Event", value: "Commercial Event" },
                        { text: "Family Event", value: "Family Event" }
                    ],
                    height: 30,
                    width: 300,
                    popupHeight: 200,
                    popupWidth: 300,
                });
            }
            if (!ej.isNullOrUndefined(args.appointment) && !ej.isNullOrUndefined(args.appointment.EventType)) {
                this._appointmentAddWindow.find("#EventType").ejDropDownList("option", "value", args.appointment.EventType);
            }
			else {              
				this._appointmentAddWindow.find("#EventType").ejDropDownList("option", "value","");
	        }
        }
        function check(args) {
            switch (args.requestType) {
                case "workcells":
                    if (args.cell.resources.text == "101 Hall") {
                        args.element.css("background-color", "#ffe9cc");
                    }
                    else if (args.cell.resources.text == "102 Hall") {
                        args.element.css("background-color", "#ebf1c4");
                    }
                    else if (args.cell.resources.text == "103 Hall") {
                        args.element.css("background-color", "#dcf1f8");
                    }
                    break;
                case "monthcells":
                    if (args.cell.resources.text == "101 Hall") {
                        args.element.css("background-color", "#ffe9cc");
                    }
                    else if (args.cell.resources.text == "102 Hall") {
                        args.element.css("background-color", "#ebf1c4");
                    }
                    else if (args.cell.resources.text == "103 Hall") {
                        args.element.css("background-color", "#dcf1f8");
                    }
                    break;
                case "alldaycells":
                    if (args.cell.resources.text == "101 Hall") {
                        args.element.css("background-color", "#ffe9cc");
                    }
                    else if (args.cell.resources.text == "102 Hall") {
                        args.element.css("background-color", "#ebf1c4");
                    }
                    else if (args.cell.resources.text == "103 Hall") {
                        args.element.css("background-color", "#dcf1f8");
                    }
                    break;
                case "headercells":
                    args.element.css("color", "#333");
                    if (!ej.isNullOrUndefined(args.resource) && args.resource.text == "101 Hall") {
                        args.element.css("background-color", "#ffe9cc");
                    }
                    else if (!ej.isNullOrUndefined(args.resource) && args.resource.text == "102 Hall") {
                        args.element.css("background-color", "#ebf1c4");
                    }
                    else if (!ej.isNullOrUndefined(args.resource) && args.resource.text == "103 Hall") {
                        args.element.css("background-color", "#dcf1f8");
                    }
                    break;
                case "appointment":
                    args.element.find('.e-apptext ').css({ "font-weight": "bold" });
                    if (args.appointment.EventType == "Holiday" || args.appointment.EventType == "Maintenance") {
                        args.element.css("background", "#a4a3a4");
                        args.element.css("border-color", "#a4a3a4");
                    }
                    else if (args.appointment.EventType == "Public Event" || args.appointment.EventType == "" || ej.isNullOrUndefined(args.appointment.EventType)) {
                        args.element.css("background", "#faa41a");
                        args.element.css("border-color", "#faa41a");
                    }
                    else if (args.appointment.EventType == "Commercial Event") {
                        args.element.css("background", "#1892d1");
                        args.element.css("border-color", "#1892d1");
                    }
                    else if (args.appointment.EventType == "Family Event") {
                        args.element.css("background", "#0b8140");
                        args.element.css("border-color", "#0b8140");
                    }
                    if ((!args.appointment.AllDay) && (((args.appointment.EndTime - args.appointment.StartTime) / 3600000) < 24)) {
                        if (args.model.currentView == "day") {
                            var eventName = (args.appointment.EventType == "" || ej.isNullOrUndefined(args.appointment.EventType)) ? "Public Event" : args.appointment.EventType;
                            var diffMs = Math.abs(args.appointment.EndTime - args.appointment.StartTime);
                            var diffMins = Math.round(diffMs / 60000);
                            if (diffMins > 30) {
                                if (diffMins > 60)
                                    args.element.find('.e-appointinnertext').prepend("<div style='color:black;margin-top:10px;height:20px;width:150px;background-color:white'><span style='margin:10px 0px 0px 10px'>" + eventName + "</span></div>");
                                args.element.find('.e-apptime ').html(args.appointment.Description);
                            }
                            args.element.find('.e-apptext ').css({ "font-size": "14px" });
                            var imgHeight = ((args.element.height() - 20) > 150) ? 150 : (args.element.height() <= 20) ? 20 : args.element.height() - 20;
                            var imgName = (!ej.isNullOrUndefined(args.appointment.EventType)) ? args.appointment.EventType : eventName;
                            var marginTopVal = (imgHeight == 20) ? "0px" : "10px";
                            if (imgName == "Holiday") {
                                args.element.css({
                                    'background-image': 'url(../Content/images/Schedule/Holidays.png)',
                                    'background-repeat': 'repeat',
                                    'background-size': '80px auto'
                                });
                                if (imgHeight == 20)
                                    args.element.css('background-image', 'url(../Content/images/Schedule/Holidays.png)');
                                args.element.find('.e-apptext ').html('');
                            }
                            else
                                args.element.prepend("<img type='image/svg+xml' style='opacity:0.3;margin-top:" + marginTopVal + ";margin-right:10px;float:right;height:" + imgHeight + "px;width:" + imgHeight + "px;' id='E' src='../Content/images/schedule/" + imgName + ".png'/>");
                        }
                        else if (args.model.currentView == "week" || args.model.currentView == "workweek") {
                            args.element.find('.e-apptime ').html(args.appointment.Description);
                            var imgName = (!ej.isNullOrUndefined(args.appointment.EventType)) ? args.appointment.EventType : "Public Event";
                            if (args.appointment.Subject != "Holiday") {
                                var imgHeight = ((args.element.width() * $("#Schedule1").find('.e-workcells').width()) / 100) - 10;
                                args.element.append("<img type='image/svg+xml' style='position:absolute;opacity:0.5;left:0;bottom:0;height:" + imgHeight + "px;width:" + imgHeight + "px;' id='E' src='../Content/images/Schedule/" + imgName + ".png'/>");
                            } else {
                                args.element.css({
                                    'background-image': 'url(../Content/images/Schedule/Holidays.png)',
                                    'background-repeat': 'repeat-y',
                                    'background-size': '80px auto'
                                });
                                args.element.find('.e-appointinnertext').prepend("<div style='color:black;margin-top:10px;height:20px;width:45px;background-color:white'><span style='margin:2px 0px 0px 2px'>Holiday</span></div>");
                                args.element.find('.e-apptext ').html('');
                            }
                        }
                    }
                    break;
                case "resourceheadercells":
                    if (!ej.isNullOrUndefined(args.resource) && args.resource.text == "101 Hall") {
                        args.element.css("background-color", "#ffe9cc");
                        args.element.css("color", "#333");
                    }
                    else if (!ej.isNullOrUndefined(args.resource) && args.resource.text == "102 Hall") {
                        args.element.css("background-color", "#ebf1c4");
                        args.element.css("color", "#333");
                    }
                    else if (!ej.isNullOrUndefined(args.resource) && args.resource.text == "103 Hall") {
                        args.element.css("background-color", "#dcf1f8");
                        args.element.css("color", "#333");
                    }
                    break;
            }
        }
    </script>
</asp:Content>

