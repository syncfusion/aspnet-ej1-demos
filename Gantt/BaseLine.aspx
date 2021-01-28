<%@ Page Title="Gantt-Baseline-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates defining actual or planned dates for  tasks and visualizing them in a project." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="BaseLine.aspx.cs" Inherits="WebSampleBrowser.Gantt.BaseLine" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / BaseLine</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttControlBaseLine" runat="server" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" StartDateMapping="StartDate" DurationMapping="Duration"
            ProgressMapping="PercentDone" ChildMapping="Children" PredecessorMapping="Predescessor"
            BaselineEndDateMapping="BaseLineEndDate" BaselineStartDateMapping="BaseLineStartDate"
            ScheduleStartDate="10/27/2017" ScheduleEndDate="12/02/2017"
            AllowGanttChartEditing="false" RenderBaseline="true" IsResponsive="true" Load="load">
            <SplitterSettings Index="2" />
            <SizeSettings Width="100%" Height="450px" />
            <EditSettings AllowEditing="true" EditMode="cellEditing" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function load(args) {
            var columns = this.getColumns(),
                splicedColumns = columns.splice(6, 2);
            columns.splice(1, 0, splicedColumns[0], splicedColumns[1]);
            columns[0].width = 100;
        }
    </script>
</asp:Content>





