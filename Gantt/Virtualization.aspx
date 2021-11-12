<%@ Page Title="Gantt-Performance-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates binding large data and smooth scrolling with large data in the Syncfusion Gantt chart." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Virtualization.aspx.cs" Inherits="WebSampleBrowser.Gantt.Virtualization" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Performance</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttControlVirtualization" runat="server" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" StartDateMapping="StartDate" EndDateMapping="EndDate"
            ProgressMapping="PercentDone" ChildMapping="Children" HighlightWeekends="true"
            ScheduleStartDate="01/07/2017" ScheduleEndDate="02/01/2017"
            EnableVirtualization="true" AllowGanttChartEditing="false" TreeColumnIndex="1" IsResponsive="true" Load="load">
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





