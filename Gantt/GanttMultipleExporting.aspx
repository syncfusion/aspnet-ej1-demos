<%@ Page Title="Gantt-Multiple Exporting-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example illustrates how to export tasks from multiple Gantt projects as a combined file." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="GanttMultipleExporting.aspx.cs" Inherits="WebSampleBrowser.Gantt.GanttMultipleExporting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Editing</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div style="font-size: 19px; margin: 20px 0 10px;">
        Planning Phase
    </div>
    <div>
        <ej:Gantt runat="server" ID="GanttControlExporting" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true" 
                  
            TaskIdMapping="TaskID"
            TaskNameMapping="TaskName"
            StartDateMapping="StartDate"
            DurationMapping="Duration"
            ProgressMapping="Progress"   
            ScheduleStartDate="02/01/2017"
            ScheduleEndDate="03/03/2017"
            OnServerExcelExporting="GanttControlExporting_ServerExcelExporting" Load="load"
            OnServerPdfExporting="GanttControlExporting_ServerPdfExporting">
            
            <EditSettings AllowDeleting="false" />
            <SizeSettings Width="100%" Height="250px" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="excelExport,pdfExport" />
        </ej:Gantt>
    </div>
    <div style="font-size: 19px; margin: 20px 0 10px;">
        Design Phase
    </div>
     <div>
        <ej:Gantt runat="server" ID="GanttControlDesign" ChildMapping="SubTasks" TreeColumnIndex="1" 
            
            TaskIdMapping="TaskID"
            TaskNameMapping="TaskName"
            StartDateMapping="StartDate"
            DurationMapping="Duration"
            ProgressMapping="Progress"   
            ScheduleStartDate="02/01/2017"
            ScheduleEndDate="03/03/2017"
            EnableResize="true" Load="load">
           
            <EditSettings AllowDeleting="false" />
            <SizeSettings Width="100%" Height="200px" />
        </ej:Gantt>
    </div>
     <div style="font-size: 19px; margin: 20px 0 10px;">
        Implementation Phase
    </div>
     <div>
        <ej:Gantt runat="server" ID="GanttControlImplementation" ChildMapping="SubTasks" TreeColumnIndex="1" 
                  
            TaskIdMapping="TaskID"
            TaskNameMapping="TaskName"
            StartDateMapping="StartDate"
            DurationMapping="Duration"
            ProgressMapping="Progress"   
            ScheduleStartDate="02/14/2017"
            ScheduleEndDate="03/15/2017"
            EnableResize="true" Load="load">
            
            <EditSettings AllowDeleting="false" />
            <SizeSettings Width="100%" Height="250px" />
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

