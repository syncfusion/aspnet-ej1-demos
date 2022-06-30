<%@ Page Title="Gantt-Striplines-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example illustrates how to mark and view important events in a project  in the Syncfusion Gantt chart control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Stripline.aspx.cs" Inherits="WebSampleBrowser.Gantt.Stripline" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Stripline</span>
</asp:Content>

<asp:Content ID="Column" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttStripline" ClientIDMode="Static" runat="server" AllowColumnResize="true" 
            TaskIdMapping="TaskID" TaskNameMapping="TaskName" StartDateMapping="StartDate"
            ProgressMapping="Progress" DurationMapping="Duration" EndDateMapping="EndDate"
            ChildMapping="SubTasks" EnableVirtualization="false" HighlightWeekends="true"
            ScheduleStartDate="02/01/2017" ScheduleEndDate="03/14/2017"
            PredecessorMapping="Predecessors" ShowResourceNames="true" ShowGridCellTooltip="false" TreeColumnIndex="1"
            IncludeWeekend="false" IsResponsive="true" AllowGanttChartEditing="false" Load="load">
            <StripLines>
                <ej:GanttStripLine Day="02/06/2017" Label="Project Start" LineStyle="dotted" LineColor="Darkblue" LineWidth="2" />
                <ej:GanttStripLine Day="02/11/2017" Label="Planning Complete" LineStyle="dotted" LineColor="Darkblue" LineWidth="2" />
                <ej:GanttStripLine Day="02/18/2017" Label="Design Complete" LineStyle="dotted" LineColor="Darkblue" LineWidth="2" />
                <ej:GanttStripLine Day="03/03/2017" Label="Implementation Complete" LineStyle="dotted" LineColor="Darkblue" LineWidth="2" />
                <ej:GanttStripLine Day="03/09/2017" Label="Final Delivery" LineStyle="dotted" LineColor="Darkblue" LineWidth="2" />
            </StripLines>
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
    function load(args) {
        this.getColumns()[0].width = 60;
    }
 </script>
    </asp:Content>

