<%@ Page Language="C#" MetaDescription="This example illustrates defining the working time of project resources in a day in the Syncfusion Gantt chart control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TimeOption.aspx.cs" Inherits="WebSampleBrowser.Gantt.TimeOption" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/Gantt/GanttData.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / TimeOptions</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <div style="float: right; padding-bottom: 5px; padding-right: 1px;">
            <select name="selectIndex" id="options">
                <option value="0">24 Hour Timescale</option>
                <option value="1">8 Hour Timescale</option>
            </select>
        </div>
        <ej:Gantt ClientIDMode="Static" ID="GanttTimeOptions" runat="server" TaskIdMapping="TaskID" TaskNameMapping="TaskName" ScheduleStartDate="02/23/2017 12:00:00 AM"
            ScheduleEndDate="02/28/2017 23:59:59" StartDateMapping="StartDate" DurationMapping="duration" ProgressMapping="Progress"
            ChildMapping="Children" TreeColumnIndex="1" DurationUnit="Hour" DateFormat="M/d/yyyy hh:mm:ss tt" WorkingTimeScale="TimeScale24Hours"
            AllowGanttChartEditing="true" IsResponsive="true" Load="load">
            <ScheduleHeaderSettings ScheduleHeaderType="Day" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
    <script type="text/javascript">
        $("#options").ejDropDownList({ "change": "onChange", Value: "24 Hour Timescale", Text: "24 Hour Timescale", width: "155px", selectedItemIndex: 0 });
    </script>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function load(args) {
            this.getColumns()[0].width = 60;
        }
        function onChange(args) {
            var ganttObject = $("#GanttTimeOptions").data("ejGantt");
            if (args.text === "24 Hour Timescale") {
                ganttObject.model.workingTimeScale = ej.Gantt.workingTimeScale.TimeScale24Hours;
                ganttObject.setModel({ dayWorkingTime: [{ from: "12:00 AM", to: "12:00 AM" }] });
            }
            if (args.text === "8 Hour Timescale") {
                ganttObject.model.workingTimeScale = ej.Gantt.workingTimeScale.TimeScale8Hours;
                ganttObject.setModel({ dayWorkingTime: [{ from: "08:00 AM", to: "12:00 PM" }, { from: "01:00 PM", to: "05:00 PM" }] });
            }
        }
    </script>
</asp:Content>
