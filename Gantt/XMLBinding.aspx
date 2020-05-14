<%@ Page Title="Gantt-XML Data-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates binding XML data to a Syncfusion Gantt chart." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="XMLBinding.aspx.cs" Inherits="WebSampleBrowser.Gantt.XMLBinding" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Data Binding / XML Binding</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%;">
        <ej:Gantt ID="GanttXMLBinding" runat="server" AllowSelection="true"
            AllowSorting="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" StartDateMapping="StartDate"
            EndDateMapping="EndDate" ProgressMapping="Progress" ParentTaskIdMapping="ParentId"
            ScheduleStartDate="02/01/2017" ScheduleEndDate="03/30/2017" ChildMapping="Children"
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

