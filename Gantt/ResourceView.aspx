<%@ Page Title="Gantt-Resource View-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the resource allocation view for visualizing and mananging the project resources." AutoEventWireup="true" CodeBehind="ResourceView.aspx.cs" Inherits="WebSampleBrowser.Gantt.ResourceView" MasterPageFile="~/Samplebrowser.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Resource View</span>
</asp:Content>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="ResourceViewGantt" runat="server" AllowColumnResize="true" ViewType="ResourceView" GroupIdMapping="TeamId" GroupNameMapping="TeamName"
            TaskCollectionMapping="Tasks" TaskIdMapping="TaskID" TaskNameMapping="TaskName" StartDateMapping="StartDate" DurationMapping="Duration" AllowDragAndDrop="true"
            ProgressMapping="Progress" ResourceIdMapping="ResourceId" ResourceInfoMapping="ResourceID" ResourceNameMapping="ResourceName" Load="load" ScheduleStartDate="02/01/2017" ScheduleEndDate="03/16/2017"
            AllowGanttChartEditing="true" TreeColumnIndex="0" SplitterPosition="310" IsResponsive="true" EnableContextMenu ="true" RowHeight="40" TaskbarHeight="25"  IncludeWeekend="false">
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" EditMode="normal"/>
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,delete,update,cancel,expandAll,collapseAll,prevTimeSpan,nextTimeSpan" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="columnTemplate" type="text/x-jsrender">
        {{if eResourceTaskType=='resourceTask'}}
        <span style='padding:10px;'> {{if eOverlapped}} Yes {{else}} No {{/if}} </span> {{/if}}
    </script>
    <script type="text/javascript">
        function load() {
            this.getColumns()[0].width = 180;
            var customColumn = {
                field: "isOverallocated",
                mappingName: "isOverallocated",
                allowEditing: false,
                headerText: "Is Overallocated",
                isTemplateColumn: true,
                template: "#columnTemplate"
            };
            this.getColumns().push(customColumn);
        }
    </script>
</asp:Content>

