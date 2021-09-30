<%@ Page Title="Gantt-Working Time Range-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates defining the working time of project resources in a day in the Syncfusion Gantt chart control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="GanttWorkingTimeRange.aspx.cs" Inherits="WebSampleBrowser.Gantt.GanttWorkingTimeRange" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Working Time Range</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ClientIDMode="Static" ID="GanttWorkingTimeRangeControl" runat="server" TaskIdMapping="TaskID" TaskNameMapping="TaskName" StartDateMapping="StartDate"
            DurationMapping="Duration" ProgressMapping="Progress" ChildMapping="Children" DateFormat="MM/dd/yyyy hh:mm tt"
            AllowGanttChartEditing="false" TreeColumnIndex="0" ScheduleStartDate="02/20/2017 12:00 AM" ScheduleEndDate="02/22/2017 12:00 AM" IsResponsive="true" Load="onLoad">
            <ScheduleHeaderSettings ScheduleHeaderType="Day" />
            <SizeSettings Height="400px" Width="100%" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Work Start Time
                </div>
                <div class="col-md-3">
                    <ej:TimePicker runat="server" ClientIDMode="Static" ID="frompicker" Width="110" Value="08:00 AM" TimeFormat="hh:mm tt" ClientSideOnChange="updateTime">
                    </ej:TimePicker>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Work End Time
                </div>
                <div class="col-md-3">
                    <ej:TimePicker runat="server" ClientIDMode="Static" ID="endpicker" Width="110" Value="05:00 PM" TimeFormat="hh:mm tt" ClientSideOnChange="updateTime">
                    </ej:TimePicker>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onLoad() {
            window.ganttData = $.extend(true, [], this.dataSource());
            var columns = this.getColumns();
            columns[1].visible = false;
            columns[0].width = 100;
        }
        var isTimeUpdated = false;
        function updateTime() {
            var ganttObj = $("#GanttWorkingTimeRangeControl").ejGantt("instance"),
                defaultDate = "08/08/2016",
                startVal = $("#frompicker").ejTimePicker("model.value"),
                endVal = $("#endpicker").ejTimePicker("model.value"),
                startTime = ej.parseDate(defaultDate + " " + startVal, ganttObj.model.dateFormat),
                endTime = ej.parseDate(defaultDate + " " + endVal, ganttObj.model.dateFormat);
            /*Validate time value and update the time range*/
            if (startTime.getTime() < endTime.getTime() && isTimeUpdated == false) {
                var workingTime = [{ from: startVal, to: endVal }];
                ganttObj.dataSource($.extend(true, [], window.ganttData));
                ganttObj.option("dayWorkingTime", workingTime);
                isTimeUpdated = false;
            }
            else {
                isTimeUpdated = true;
                $("#frompicker").ejTimePicker("model.value", ganttObj.model.dayWorkingTime[0].from);
                $("#endpicker").ejTimePicker("model.value", ganttObj.model.dayWorkingTime[ganttObj.model.dayWorkingTime.length - 1].to);
            }
            isTimeUpdated = false;
        }

    </script>
</asp:Content>

