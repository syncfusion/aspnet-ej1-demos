<%@ Page Title="Gantt-Column Menu-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the column menu in the Syncfusion Gantt chart control for sorting, filtering, and toggling column visibility options." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ColumnChooser.aspx.cs" Inherits="WebSampleBrowser.Gantt.ColumnChooser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / ColumnChooser</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttControlColumnChooser" runat="server" AllowSelection="true" AllowColumnResize="false"
            TaskIdMapping="Id" TaskNameMapping="Name" ScheduleStartDate="02/23/2017" ScheduleEndDate="03/30/2017"
            StartDateMapping="StartDate" EndDateMapping="EndDate" ProgressMapping="PercentDone"
            ChildMapping="Children" TreeColumnIndex="1" AllowGanttChartEditing="false" ShowColumnChooser="true" 
            ShowColumnOptions="true" ColumnDialogFields="field,headerText,editType,width,textAlign"
            AllowSorting="true" AllowMultiSorting="true" SplitterPosition="50%" IsResponsive="true" Load="load">
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" AllowIndent="true" EditMode="cellEditing" />
            <SizeSettings Width="100%" Height="450px" />            
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
    function load(args) {
        this.getColumns()[0].width = 100;
    }
 </script>
    </asp:Content>

