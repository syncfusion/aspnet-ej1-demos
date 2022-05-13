<%@ Page Title="Gantt-Exporting Gantt-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example illustrates exporting Gantt project tasks to Excel and PDF formats." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="GanttExporting.aspx.cs" Inherits="WebSampleBrowser.Gantt.GanttExporting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Exporting</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt runat="server" ID="GanttControlExporting" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true" 
                
            TaskIdMapping="TaskID"
            TaskNameMapping="TaskName"
            StartDateMapping="StartDate"
            EndDateMapping="EndDate"
            ProgressMapping="Progress"   
            AllowGanttChartEditing="false"
            OnServerExcelExporting="GanttControlExporting_ServerExcelExporting" OnServerPdfExporting="GanttControlExporting_ServerPdfExporting" Load="load"
             TaskSchedulingMode="Custom" TaskSchedulingModeMapping="IsManual">
            <EditSettings AllowDeleting="false" />
            <SizeSettings Width="100%" Height="450px" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="excelExport,pdfExport" />
            <StripLines>
                <ej:GanttStripLine Day="02/06/2017" Label="Project Start" LineColor="darkblue" LineWidth="2" LineStyle="solid" />
            </StripLines>
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Fit timeline to one page in PDF
                </div>
                <div class="col-md-3">
                    <div style="padding-left: 10px;">
                        <ej:CheckBox Checked="false" runat="server" ID="EnablePageBreak"></ej:CheckBox>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function load(args) {
            this.getColumns()[0].width = 60;
        }
    </script>
</asp:Content>

