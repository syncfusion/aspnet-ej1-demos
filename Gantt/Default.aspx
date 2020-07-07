<%@ Page Title="Gantt-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example visualizes a project schedule using the Syncfusion Gantt chart with the basic Gantt features enabled. " AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Default.aspx.cs" Inherits="WebSampleBrowser.Gantt.DefaultFunctionalities" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttControlDefault" runat="server" AllowSelection="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" ScheduleStartDate="02/23/2017" ScheduleEndDate="03/15/2017"
            StartDateMapping="StartDate" EndDateMapping="EndDate" ProgressMapping="PercentDone"
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



