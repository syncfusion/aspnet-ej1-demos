<%@ Page Title="Gantt-Searching-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates toolbar searching in the Syncfusion Gantt chart control, which allows tasks to be filtered." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Searching.aspx.cs" Inherits="WebSampleBrowser.Gantt.Searching" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Searching</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttControlSearching" runat="server" AllowSelection="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" StartDateMapping="StartDate" EndDateMapping="EndDate"
            ProgressMapping="PercentDone" ChildMapping="Children"
            ScheduleStartDate="02/23/2017" ScheduleEndDate="03/30/2017"
            AllowGanttChartEditing="false" TreeColumnIndex="1" IsResponsive="true" Load="load">
            <ToolbarSettings ShowToolbar="true" ToolbarItems="search" />
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


