<%@ Page Title="Gantt-Resource Allocation-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates assigning and managing resources for the tasks in project view in the Syncfusion Gantt chart control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Resource.aspx.cs" Inherits="WebSampleBrowser.Gantt.Resource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Resources</span>
</asp:Content>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttControlResource" runat="server" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" StartDateMapping="StartDate" DurationMapping="Duration"
            ProgressMapping="PercentDone" ChildMapping="Children" PredecessorMapping="Predescessor"
            ResourceInfoMapping="Resources" ResourceNameMapping="Name" ResourceIdMapping="Id" Load="load"          
            AllowGanttChartEditing="true" TreeColumnIndex="0" SplitterPosition="54%" IsResponsive="true">
             <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" AllowIndent="true" EditMode="cellEditing" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,indent,outdent,expandAll,collapseAll" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function load() {
            var ganttObject = $("#<%=GanttControlResource.ClientID%>").data("ejGantt"),
                columns = ganttObject.getColumns();
            columns[1].visible = columns[2].visible = columns[5].visible = columns[6].visible = false;
            columns[7].visible = columns[8].visible = columns[9].visible = true;
            columns[3].width = columns[8].width = columns[9].width = 100;
            columns[0].width = columns[7].width = 100;
            columns[4].width = 85;
        }
    </script>
</asp:Content>

