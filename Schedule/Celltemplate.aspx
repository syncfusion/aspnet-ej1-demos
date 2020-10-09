<%@ Page Title="Schedule-Cell-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how the ASP.NET Web Scheduler cells can be customized with templates." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Celltemplate.aspx.cs" Inherits="WebSampleBrowser.Schedule.Celltemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Celltemplate</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" Width="100%" Height="525px" CurrentDate="12/10/2017" Views="Week,Month" CurrentView="Month" WorkCellsTemplateId="#workTemplate" ShowAppointmentNavigator="false">
            <Resources>
                <ej:Resources Field="RoomId" Name="Rooms" Title="Room" AllowMultiple="true">
                    <ResourceSettings Color="color" Id="id" Text="text">
                    </ResourceSettings>
                </ej:Resources>
                <ej:Resources Field="OwnerId" Name="Owners" Title="Owner" AllowMultiple="true">
                    <ResourceSettings Color="color" Id="id" Text="text" GroupId="groupId">
                    </ResourceSettings>
                </ej:Resources>
            </Resources>
            <Group Resources="Rooms,Owners" />
            <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" ResourceFields="RoomId,OwnerId" />
        </ej:Schedule>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="allDayTemplate" type="text/x-jsrender">
		<div class="e-icon e-scheduleallday" style="opacity:0.5"></div><span style="opacity:0.5">AllDay</span>
    </script>
    <script id="dateTemplate" type="text/x-jsrender">
        <div>{{:~dTemplate(date)}}</div>
    </script>
    <script id="workTemplate" type="text/x-jsrender">
		{{if resource.classname == 'e-parentnode'}}
			{{:resource.text}}
		{{else}}
			{{if date.getDay() == 0 || date.getDay() == 6}}
				<div class="image"><img src='../Content/images/schedule/weekend.png'/><br/><span class="caption">Weekend</span></div>
			{{else}}
				{{if view == 'month' && resource.text == 'Party Hall-A' && date.getDay() == 5}}
					<div class="image"><img src='../Content/images/schedule/meeting.png'/><br/><span class="caption">Meeting</span></div>
				{{else resource.text != 'Party Hall-B' && date.getDate() == 15}}
					<div class="image"><img src='../Content/images/schedule/holiday.png'/><br/><span class="caption">Holiday</span></div>
				{{else view != 'month' && resource.text == 'Party Hall-A' && date.getDay() == 5 && date.getHours() == 10}}
					<div class="image"><img src='../Content/images/schedule/meeting.png'/><br/><span class="caption">Meeting</span></div>
				{{else view == 'month' && resource.text == 'Party Hall-B' && date.getDay() == 5}}
					<div class="image"><img src='../Content/images/schedule/conference.png'/><br/><span class="caption">Conf.</span></div>
				{{else resource.text == 'Party Hall-B' && date.getDate() == 16}}
					<div class="image"><img src='../Content/images/schedule/happyday.png'/><br/><span class="caption">Happyday</span></div>
				{{else view != 'month' && resource.text == 'Party Hall-B' && date.getDay() == 5 && date.getHours() == 12}}
					<div class="image"><img src='../Content/images/schedule/conference.png'/><br/><span class="caption">Conf.</span></div>
				{{else date.getDate() == 10 && date.getMonth() == 11}}
					<div class="image"><img src='../Content/images/schedule/wednesday.png'/><br/><span class="caption">Day Spl</span></div>
				{{else date.getDate() == 25 && date.getMonth() == 11}}
					<div class="image"><img src='../Content/images/schedule/christmas.png'/><br/><span class="caption">Christmas</span></div>
				{{/if}}
			{{/if}}
		{{/if}}
    </script>
    <script type="text/javascript">
        $(document).ready(function () { $("#sampleProperties").ejPropertiesPanel(); });

        function _dateFormat(date) {
            var dFormat = ej.globalize.format(new Date(date), "dd/MM");
            return dFormat;
        }
        $.views.helpers({ dTemplate: _dateFormat });

        function onOrientation(args) {
            if (args.value == "horizontal") {
                $("#Schedule1").ejSchedule({ orientation: args.value, cellWidth: "70px" });
                $("#allDayCells").ejCheckBox({ enabled: false });
            }
            else {
                $("#Schedule1").ejSchedule({ orientation: args.value, cellWidth: "" });
                $("#allDayCells").ejCheckBox({ enabled: true });
            }
        }

        function onTimeScale(args) {
            if (args.isChecked) { $("#Schedule1").ejSchedule({ timeScale: { enable: false } }); $("#allDayCells").ejCheckBox({ enabled: false }); }
            else { $("#Schedule1").ejSchedule({ timeScale: { enable: true } }); $("#allDayCells").ejCheckBox({ enabled: true }); }
        }

        function onAllDayCells(args) {
            if (args.isChecked) { $("#Schedule1").ejSchedule({ allDayCellsTemplateId: "#allDayTemplate" }); }
            else { $("#Schedule1").ejSchedule({ allDayCellsTemplateId: null }); }
        }

        function onDateHeader(args) {
            if (args.isChecked) { $("#Schedule1").ejSchedule({ dateHeaderTemplateId: "#dateTemplate" }); }
            else { $("#Schedule1").ejSchedule({ dateHeaderTemplateId: null }); }
        }

        function onWorkCells(args) {
            if (args.isChecked) { $("#Schedule1").ejSchedule({ workCellsTemplateId: "#workTemplate" }); }
            else { $("#Schedule1").ejSchedule({ workCellsTemplateId: null }); }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="EventSection">
    <div class="cols-prop-area">
        <div class="heading">
            <span>Templates</span>
        </div>
        <div class="prop-grid content">
            <div class="row">
                <div class="col-md-3">Orientation</div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" runat="server" ID="orientation" Width="115px" SelectedItemIndex="0" ClientSideOnChange="onOrientation" ClientSideOnSelect="onOrientation">
                        <Items>
                            <ej:DropDownListItem Text="Vertical" Value="vertical" />
                            <ej:DropDownListItem Text="Horizontal" Value="horizontal" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3">Disable TimeScale</div>
                <div class="col-md-3">
                    <ej:CheckBox runat="server" Checked="false" ID="timescale" ClientSideOnChange="onTimeScale"></ej:CheckBox>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3">AllDayCells Customization</div>
                <div class="col-md-3">
                    <ej:CheckBox runat="server" Checked="false" ID="allDayCells" ClientSideOnChange="onAllDayCells"></ej:CheckBox>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3">DateHeader Customization</div>
                <div class="col-md-3">
                    <ej:CheckBox runat="server" Checked="false" ID="dateHeader" ClientSideOnChange="onDateHeader"></ej:CheckBox>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3">WorkCells Customization</div>
                <div class="col-md-3">
                    <ej:CheckBox runat="server" Checked="true" ID="workCells" ClientSideOnChange="onWorkCells"></ej:CheckBox>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="styleSection" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        div.image {
            text-align: center;
            width: 100%;
        }

        img {
            width: 30px;
            height: 30px;
            opacity: 0.5;
        }

        .caption {
            display: block;
            opacity: 0.5;
            overflow: hidden;
			text-overflow: ellipsis; 
			height: 18px;
        }
    </style>
</asp:Content>

