<%@ Page Title="Gantt-Timescale Modes-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the different timeline views, including hour, day, week, month, and year, for visualizing the project schedule." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ScheduleModes.aspx.cs" Inherits="WebSampleBrowser.Gantt.ScheduleModes" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/Gantt/GanttData.js" type="text/javascript"></script>
    <style type="text/css">
   </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / ScheduleModes</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ClientIDMode="Static" ID="GanttSceduleModes" runat="server" TaskIdMapping="TaskID" TaskNameMapping="TaskName" StartDateMapping="StartDate"
            EndDateMapping="EndDate" ProgressMapping="Progress" ChildMapping="Children" DurationUnit="Day" WorkingTimeScale="TimeScale24Hours"
            AllowGanttChartEditing="false" TreeColumnIndex="1" ScheduleStartDate="02/23/2017" ScheduleEndDate="04/10/2017" IsResponsive="true" Load="load">
            <ScheduleHeaderSettings ScheduleHeaderType="Week" />
            <SizeSettings Height="450px" Width="100%" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Schedule Mode
                </div>
                <div class="col-md-3">
                    <div>
                        <div id="modes">
                            <ul>
                                <li>Hour</li>
                                <li>Day</li>
                                <li>Week</li>
                                <li>Month</li>
                                <li>Year</li>
                                <li>Quarter Year</li>
                                <li>Half Year</li>
                            </ul>
                        </div>
                    </div>
                    <ej:DropDownList ID="mode" ClientIDMode="Static" runat="server" ClientSideOnChange="onChange" Value="week" Text="week" Width="120px" SelectedItemIndex="2" TargetID="modes"></ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Mintues Interval
                </div>
                <div class="col-md-3">
                    <div id="mintues">
                        <ul>
                            <li>Auto</li>
                            <li>One minute</li>
                            <li>Five minutes</li>
                            <li>Fifteen minutes</li>
                            <li>Thirty minutes</li>
                        </ul>
                    </div>
                    <ej:DropDownList ID="interval" runat="server" ClientIDMode="Static" ClientSideOnChange="onIntervalChange" Value="Five minutes" Width="120px" TargetID="mintues" Enabled="false"></ej:DropDownList>
                </div>
            </div>
              <div class="row">
                <div class="col-md-3">
                    Week Start Day
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="StartDay" runat="server" ClientIDMode="Static" ClientSideOnChange="onStartDayChange" Width="120px" Enabled="true" SelectedIndex="0"></ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function load(args) {
            this.getColumns()[0].width = 60;
        }
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onChange(args) {
            var ganttObject = $("#GanttSceduleModes").data("ejGantt");
            ganttObject.model.columns = null;
            if (args.itemId == 0) {
                ganttObject.model.scheduleEndDate = "02/27/2017 07:00:00 AM",
                ganttObject.model.scheduleStartDate = "02/27/2017 00:00:00 AM",
                ganttObject.model.dateFormat = "M/d/yyyy hh:mm:ss tt";
                ganttObject.model.durationMapping = "duration";
                ganttObject.model.endDateMapping = "";
                ganttObject.model.durationUnit = ej.Gantt.DurationUnit.Minute;
                ganttObject.model.scheduleHeaderSettings.minutesPerInterval = "fiveMinutes";
                ganttObject.model.scheduleHeaderSettings.scheduleHeaderType = ej.Gantt.ScheduleHeaderType.Hour;
                ganttObject.model.dataSource = hourData;
                ganttObject.reRenderChart(ej.Gantt.ScheduleHeaderType.Hour);
                $("#interval").ejDropDownList({ enabled: true, value: "Five minutes" });
                $("#StartDay").ejDropDownList({ enabled: false });
            }
            else if (args.itemId == 1) {
                ganttObject.model.scheduleStartDate = "02/27/2017",
               ganttObject.model.scheduleEndDate = "03/10/2017",
               ganttObject.model.endDateMapping = "";
                ganttObject.model.dateFormat = "M/d/yyyy hh:mm:ss tt";
                ganttObject.model.durationMapping = "duration";
                ganttObject.model.durationUnit = ej.Gantt.DurationUnit.Hour;
                ganttObject.model.scheduleHeaderSettings.scheduleHeaderType = ej.Gantt.ScheduleHeaderType.Day;
                ganttObject.model.dataSource = dayData;
                ganttObject.reRenderChart(ej.Gantt.ScheduleHeaderType.Day);
                $("#interval").ejDropDownList({ enabled: false });
                $("#StartDay").ejDropDownList({ enabled: false });
            }
            else if (args.itemId == 2) {
                ganttObject.model.scheduleEndDate = "04/10/2017";
                ganttObject.model.scheduleStartDate = "02/23/2017";
                ganttObject.model.endDateMapping = "EndDate";
                ganttObject.model.dateFormat = "M/d/yyyy";
                ganttObject.model.durationUnit = ej.Gantt.DurationUnit.Day;
                ganttObject.model.durationMapping = "";
                ganttObject.model.scheduleHeaderSettings.weekHeaderFormat = "MMM dd , yyyy";
                ganttObject.model.scheduleHeaderSettings.dayHeaderFormat = "";
                ganttObject.model.scheduleHeaderSettings.scheduleHeaderType = ej.Gantt.ScheduleHeaderType.Week;
                ganttObject.model.dataSource = weekData;
                $("#StartDay").ejDropDownList({ enabled: true, selectedItemIndex: ganttObject.model.scheduleHeaderSettings.weekStartDay });
                ganttObject.reRenderChart(ej.Gantt.ScheduleHeaderType.Week);
                $("#interval").ejDropDownList({ enabled: false });

            }
            else if (args.itemId == 3) {
                ganttObject.model.scheduleStartDate = "02/20/2017",
                ganttObject.model.scheduleEndDate = "07/20/2017",
                ganttObject.model.endDateMapping = "EndDate";
                ganttObject.model.durationMapping = "";
                ganttObject.model.dateFormat = "M/d/yyyy";
                ganttObject.model.scheduleHeaderSettings.monthHeaderFormat = "MMM yyyy";
                ganttObject.model.scheduleHeaderSettings.weekHeaderFormat = "M/dd";
                ganttObject.model.durationUnit = ej.Gantt.DurationUnit.Day;
                ganttObject.model.scheduleHeaderSettings.scheduleHeaderType = ej.Gantt.ScheduleHeaderType.Month;
                ganttObject.model.dataSource = monthData;
                ganttObject.reRenderChart(ej.Gantt.ScheduleHeaderType.Month);
                $("#interval").ejDropDownList({ enabled: false });
                $("#StartDay").ejDropDownList({ enabled: false });
            }
            else if (args.itemId == 4) {
                ganttObject.model.scheduleEndDate = "07/20/2017",
                ganttObject.model.scheduleStartDate = "02/20/2017",
                ganttObject.model.endDateMapping = "EndDate";
                ganttObject.model.dateFormat = "M/d/yyyy";
                ganttObject.model.scheduleHeaderSettings.yearHeaderFormat = "MMM/yyyy";
                ganttObject.model.durationMapping = "";
                ganttObject.model.durationUnit = ej.Gantt.DurationUnit.Day;
                ganttObject.model.scheduleHeaderSettings.scheduleHeaderType = ej.Gantt.ScheduleHeaderType.Year;
                ganttObject.model.dataSource = monthData;
                ganttObject.reRenderChart(ej.Gantt.ScheduleHeaderType.Year);
                $("#interval").ejDropDownList({ enabled: false });
                $("#StartDay").ejDropDownList({ enabled: false });
            }
            else if (args.itemId == 5) {
                ganttObject.model.scheduleEndDate = "10/14/2018",
                ganttObject.model.scheduleStartDate = "02/20/2017",
                ganttObject.model.endDateMapping = "EndDate";
                ganttObject.model.dateFormat = "M/d/yyyy";
                ganttObject.model.scheduleHeaderSettings.yearHeaderFormat = "yyyy";
                ganttObject.model.durationMapping = "";
                ganttObject.model.durationUnit = ej.Gantt.DurationUnit.Day;
                ganttObject.model.scheduleHeaderSettings.scheduleHeaderType = ej.Gantt.ScheduleHeaderType.QuarterYear;
                ganttObject.model.dataSource = quarterYearData;
                ganttObject.reRenderChart(ej.Gantt.ScheduleHeaderType.QuarterYear);
                $("#interval").ejDropDownList({ enabled: false });
                $("#StartDay").ejDropDownList({ enabled: false });
            }
            else if (args.itemId == 6) {
                ganttObject.model.scheduleEndDate = "10/20/2020",
                ganttObject.model.scheduleStartDate = "02/20/2017",
                ganttObject.model.endDateMapping = "EndDate";
                ganttObject.model.dateFormat = "M/d/yyyy";
                ganttObject.model.scheduleHeaderSettings.yearHeaderFormat = "yyyy";
                ganttObject.model.durationMapping = "";
                ganttObject.model.durationUnit = ej.Gantt.DurationUnit.Day;
                ganttObject.model.scheduleHeaderSettings.scheduleHeaderType = ej.Gantt.ScheduleHeaderType.HalfYear;
                ganttObject.model.dataSource = halfYearData;
                ganttObject.reRenderChart(ej.Gantt.ScheduleHeaderType.HalfYear);
                $("#interval").ejDropDownList({ enabled: false });
                $("#StartDay").ejDropDownList({ enabled: false });
            }
        }

        function onIntervalChange(args) {
            var ganttObject = $("#GanttSceduleModes").data("ejGantt");
            switch (args.text) {
                case "Auto":
                    ganttObject.model.scheduleStartDate = "02/27/2017 00:00:00 AM";
                    ganttObject.model.scheduleEndDate = "02/27/2017 04:00:00 AM";
                    ganttObject.model.scheduleHeaderSettings.minutesPerInterval = "auto";
                    break;
                case "One minute":
                    ganttObject.model.scheduleStartDate = "02/27/2017 00:00:00 AM";
                    ganttObject.model.scheduleEndDate = "02/27/2017 04:00:00 AM";
                    ganttObject.model.scheduleHeaderSettings.minutesPerInterval = "oneMinute";
                    break;
                case "Five minutes":
                    ganttObject.model.scheduleStartDate = "02/27/2017 00:00:00 AM";
                    ganttObject.model.scheduleEndDate = "02/27/2017 07:00:00 AM";
                    ganttObject.model.scheduleHeaderSettings.minutesPerInterval = "fiveMinutes";
                    break;
                case "Fifteen minutes":
                    ganttObject.model.scheduleStartDate = "02/26/2017 10:00:00 PM",
                    ganttObject.model.scheduleEndDate = "02/27/2017 07:00:00 AM";
                    ganttObject.model.scheduleHeaderSettings.minutesPerInterval = "fifteenMinutes";
                    break;
                case "Thirty minutes":
                    ganttObject.model.scheduleStartDate = "02/26/2017 10:00:00 PM";
                    ganttObject.model.scheduleEndDate = "02/28/2017";
                    ganttObject.model.scheduleHeaderSettings.minutesPerInterval = "thirtyMinutes";
                    break;
            }
            ganttObject.reRenderChart(ej.Gantt.ScheduleHeaderType.Hour);
        }

        function onStartDayChange(args) {
            var ganttObject = $("#GanttSceduleModes").ejGantt("instance");
            ganttObject.model.scheduleHeaderSettings.weekStartDay = args.selectedValue;
            ganttObject.reRenderChart(ganttObject.model.scheduleHeaderSettings.scheduleHeaderType);
        }
    </script>
</asp:Content>


