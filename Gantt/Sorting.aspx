<%@ Page Title="Gantt-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the default sorting functionality for the columns in the Syncfusion Gantt chart control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Sorting.aspx.cs" Inherits="WebSampleBrowser.Gantt.Sorting" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttControlSorting" runat="server" AllowSelection="true"
            AllowSorting="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" StartDateMapping="StartDate"
            EndDateMapping="EndDate" ProgressMapping="PercentDone" ChildMapping="Children"
            ScheduleStartDate="02/23/2017" ScheduleEndDate="03/30/2017"
            TreeColumnIndex="1" AllowGanttChartEditing="false" IsResponsive="true" Load="load">
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

