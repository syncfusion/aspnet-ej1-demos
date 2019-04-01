<%@ Page Title="Gantt-Object Data-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates object data binding in Syncfusion Gantt chart." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ObjectBinding.aspx.cs" Inherits="WebSampleBrowser.Gantt.ObjectBinding" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Data Binding /  Object Data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%;">
        <ej:Gantt ID="GanttObjectBinding" DataSourceID="ObjectData" runat="server" AllowSelection="true"
            AllowSorting="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" StartDateMapping="StartDate"
            EndDateMapping="EndDate" ProgressMapping="PercentDone"
            ScheduleStartDate="02/18/2017" ScheduleEndDate="03/30/2017" ChildMapping="Children"
            TreeColumnIndex="1" AllowGanttChartEditing="false" IsResponsive="true" Load="load">
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>

    <asp:objectdatasource id="ObjectData" runat="server" typename="GanttObjectData" selectmethod="GetRecords">
    </asp:objectdatasource>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
    function load(args) {
        this.getColumns()[0].width = 60;
    }
 </script>
    </asp:Content>

