<%@ Page Title="Gantt-Conditional Formatting-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example illustrates how to export the formatted UI for tasks and cells in the Gantt chart control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="GanttConditionalExporting.aspx.cs" Inherits="WebSampleBrowser.Gantt.GanttCondtionalExporting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Conditional Formatting</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt runat="server" ID="GanttConditionalExporting" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true" 
                
            TaskIdMapping="TaskID"
            TaskNameMapping="TaskName"
            StartDateMapping="StartDate"
            EndDateMapping="EndDate"
            ProgressMapping="Progress"   
            AllowGanttChartEditing="false"
            OnServerExcelExporting="GanttConditionalExporting_ServerExcelExporting" 
            OnServerPdfExporting="GanttConditionalExporting_ServerPdfExporting"
            OnServerPdfQueryTaskbarInfo="GanttConditionalExporting_ServerPdfTaskbarInfo"
            OnServerPdfQueryCellInfo="GanttConditionalExporting_ServerPdfQueryCell"
            OnServerExcelQueryCellInfo="GanttConditionalExporting_ServerExcelQueryCellInfo"
            Load="load" QueryCellInfo="queryCell" QueryTaskbarInfo="queryTaskbar">
            <EditSettings AllowDeleting="false" />
            <SizeSettings Width="100%" Height="450px" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="excelExport,pdfExport" />            
        </ej:Gantt>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function load(args) {
            var proxy = this;
            proxy.getColumns()[0].width = 70;
            var progressColumn = proxy.getColumns()[4];
            proxy.getColumns().splice(4, 1);
            proxy.getColumns().splice(2, 0, progressColumn);
        }

        function queryTaskbar(args) {
            var data = args.data.item;
            if (data.Progress > 80) {
                args.progressbarBorder = args.progressbarBackground = "#6C3483";
                args.taskbarBorder = args.taskbarBackground = "#A569BD";
                $(args.taskbar).find(".e-gantt-childtaskbar-progress").css("background-image", "none");
            }
            else if (data.Progress < 20) {
                args.progressbarBorder = args.progressbarBackground = "#CD5C5C";
                args.taskbarBorder = args.taskbarBackground = "#F08080";
                $(args.taskbar).find(".e-gantt-childtaskbar-progress").css("background-image", "none");
            }
        }

        function queryCell(args) {
            var data = args.data.item;
            if (args.column.mappingName == "Progress") {
                if (data.Progress > 80) {
                    $(args.cellElement).css("background-color", "#A569BD");
                }
                else if (data.Progress < 20) {
                    $(args.cellElement).css("background-color", "#F08080");
                }
            }
        }
    </script>
</asp:Content>

