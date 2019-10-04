<%@ Page Title="Gantt-Resource Histogram-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the resource histogram view for visualizing the resource work allocation hours in a project." AutoEventWireup="true" CodeBehind="HistogramView.aspx.cs" Inherits="WebSampleBrowser.Gantt.HistogramView" MasterPageFile="~/Samplebrowser.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Resource Histogram</span>
</asp:Content>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttContainer" ClientIDMode="Static" runat="server" ViewType="ProjectView" TaskIdMapping="TaskID" TaskNameMapping="TaskName"
            StartDateMapping="StartDate" DurationMapping="Duration" ProgressMapping="Progress" ChildMapping="SubTasks" ShowTaskNames="true"
            ResourceIdMapping="ResourceID" ResourceInfoMapping="ResourceID" ResourceNameMapping="ResourceName" ScheduleStartDate="10/15/2017"           
            AllowGanttChartEditing="true" TreeColumnIndex="1" SplitterPosition="15%" IsResponsive="true" IncludeWeekend="false"
            Load="ganttLoad" SplitterResized="splitterResized" ActionComplete="actionComplete">
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" EditMode="cellEditing" />
            <ScheduleHeaderSettings ScheduleHeaderType="Week" TimescaleUnitSize="150" UpdateTimescaleView="false" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,delete,update,cancel" />
            <SizeSettings Width="100%" Height="310px" />
        </ej:Gantt>
        <ej:Gantt ID="HistoGanttContainer" ClientIDMode="Static" runat="server" ViewType="HistogramView" TaskIdMapping="TaskID" TaskNameMapping="TaskName"
            StartDateMapping="StartDate" DurationMapping="Duration" ProgressMapping="Progress" ChildMapping="SubTasks"
            ResourceIdMapping="ResourceID" ResourceInfoMapping="ResourceID" ResourceNameMapping="ResourceName" RowHeight="50"    
            AllowGanttChartEditing="true" SplitterPosition="15%" IsResponsive="true" IncludeWeekend="false"
            Load="histoLoad" SplitterResized="splitterResized" ActionComplete="actionComplete">
            <ScheduleHeaderSettings ScheduleHeaderType="Week" TimescaleUnitSize="150"/>
            <SizeSettings Width="100%" Height="300px" />
        </ej:Gantt>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function ganttLoad(args) {
            var columns = this.getColumns();
            columns[0].visible = columns[2].visible = columns[5].visible = false;
            columns[6].visible = true;
        }

        function histoLoad(args) {
            this.isProjectViewData = true;
        }

        function splitterResized(args) {
            if (args.isOnResize == false) return;
            if (this._id == "GanttContainer") {
                $("#HistoGanttContainer").ejGantt("setSplitterPosition", args.currentSplitterPosition);
            } else if (this._id == "HistoGanttContainer") {
                $("#GanttContainer").ejGantt("setSplitterPosition", args.currentSplitterPosition);
            }
        }
        function actionComplete(args) {
            if (args.requestType == "scroll" && args.scrollDirection == "horizontal") {
                var scrollLeft = args.scrollLeft;
                if (this._id == "GanttContainer" && !args.isScrollByMethod) {
                    $("#HistoGanttContainer").ejGantt("setChartScrollLeft", scrollLeft);
                } else if (this._id == "HistoGanttContainer" && !args.isScrollByMethod) {
                    $("#GanttContainer").ejGantt("setChartScrollLeft", scrollLeft);
                }
            } else if (args.requestType == "recordUpdate") {
                $("#HistoGanttContainer").ejGantt("updateHistogramTask", args.data, "update");
                if (args.updatedRecords && args.updatedRecords.length > 0) {
                    for (var count = 0; count < args.updatedRecords.length; count++) {
                        $("#HistoGanttContainer").ejGantt("updateHistogramTask", args.updatedRecords[count], "update");
                    }
                }
            } else if (args.requestType == "save" && args.modifiedRecord) {
                $("#HistoGanttContainer").ejGantt("updateHistogramTask", args.modifiedRecord, "update");
            }
            else if (args.requestType == "save" && args.addedRecord) {
                $("#HistoGanttContainer").ejGantt("updateHistogramTask", args.addedRecord, "add");
            }
            else if (args.requestType == "delete") {
                $("#HistoGanttContainer").ejGantt("updateHistogramTask", args.data, "delete");
            }
        }
    </script>
</asp:Content>

