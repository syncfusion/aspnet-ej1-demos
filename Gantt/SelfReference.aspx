<%@ Page Title="Gantt-Self Reference-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example illustrates binding self-referential flat data with parent ID to a Syncfusion Gantt chart." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SelfReference.aspx.cs" Inherits="WebSampleBrowser.Gantt.GanttSelfReference" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Self Reference</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttControlDefault" runat="server" AllowSelection="true" AllowColumnResize="true"
            TaskIdMapping="Id" ParentTaskIdMapping="ParentId" TaskNameMapping="Name" ScheduleStartDate="02/23/2017" ScheduleEndDate="03/15/2017"
            StartDateMapping="StartDate" DurationMapping="Duration" ProgressMapping="PercentDone"
            ChildMapping="Children" AllowGanttChartEditing="false"
            TreeColumnIndex="1" IsResponsive="true" Load="load">
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

