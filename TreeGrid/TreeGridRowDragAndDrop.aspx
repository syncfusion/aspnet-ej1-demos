<%@ Page Title="TreeGrid-Row Drag And Drop-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates using drag-and-drop to reorder rows dynamically in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridRowDragAndDrop.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridRowDragAndDrop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Row Drag And Drop</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">    
    <div>        
      <ej:TreeGrid runat="server" ID="TreeGridControlDragAndDrop" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true" AllowDragAndDrop="true"
          RowDropActionBegin="rowDropActionBegin" RowDragStart="rowDragStart"> 
          <columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" EditType="Numeric" AllowFiltering="false"/>
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String" FilterEditType="String" ShowCheckbox="true"/>
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" FilterEditType="Datepicker"/>
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" FilterEditType="Datepicker"/>
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" FilterEditType="Numeric"/>
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric" FilterEditType="Numeric"/>
            </columns>
           <SelectionSettings SelectionType= "Checkbox" EnableSelectAll="false"/>
           <DragTooltip ShowTooltip="true" />
           <SizeSettings Width="100%" Height="450px" />         
          <EditSettings AllowDeleting="false" />
      </ej:TreeGrid>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function rowDropActionBegin(args) {
            args.draggedRecords.filter(function (item) {
                if (item.TaskName == "Item can't be Dropped") {
                    item.canDrop = false;
                }
            });
        }
        function rowDragStart(args) {
            args.draggedRecords.filter(function (item) {
                if (item.TaskName == "Item can't be Dragged") {
                    item.canDrag = false;
                }
            });
        }
    </script>
</asp:Content>

