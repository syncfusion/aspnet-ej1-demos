<%@ Page Title="Gantt-Timescale Extension-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates how to extend the timeline in a project dynamically in the Syncfusion Gantt chart control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TimelineValidation.aspx.cs" Inherits="WebSampleBrowser.Gantt.TimelineValidation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Timeline Validation</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttTimelineValidation" runat="server" AllowSelection="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name"
            StartDateMapping="StartDate" EndDateMapping="EndDate" ProgressMapping="PercentDone"
            ChildMapping="Children" AllowGanttChartEditing="true"
            TreeColumnIndex="1" IsResponsive="true" Load="load">
            <ToolbarSettings ShowToolbar="true" ToolbarItems="prevTimeSpan,nextTimeSpan" />
            <EditSettings AllowAdding="true" AllowEditing="true" AllowDeleting="true" EditMode="cellEditing" />
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

