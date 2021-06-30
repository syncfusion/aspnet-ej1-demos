<%@ Page Title="Gantt-Editing-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the taskbar, cell, and dialog editing options available in the Syncfusion Gantt chart control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Editing.aspx.cs" Inherits="WebSampleBrowser.Gantt.Editing" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Editing</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttControlEditing" ClientIDMode="Static" runat="server" AllowSelection="true" AllowColumnResize="true"
            TaskIdMapping="TaskID" TaskNameMapping="TaskName" ScheduleStartDate="02/01/2017" ScheduleEndDate="03/14/2017"
            StartDateMapping="StartDate" EndDateMapping="EndDate" ProgressMapping="Progress" IsResponsive="true" Load="load"
            ChildMapping="SubTasks" TreeColumnIndex="1" AllowGanttChartEditing="true" PredecessorMapping="Predecessors" EnableContextMenu="true" NotesMapping="notes">
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" ShowDeleteConfirmDialog="true"  AllowIndent="true" EditMode="cellEditing" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,indent,outdent,expandAll,collapseAll" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Edit Mode
                </div>
                <div class="col-md-3">
                    <div>
                        <div id="editMode">
                            <ul>
                                <li>CellEditing</li>
                                <li>Normal</li>
                            </ul>
                        </div>
                    </div>
                    <ej:DropDownList ID="editing" ClientIDMode="Static" runat="server" ClientSideOnChange="onModeChange" Value="CellEditing" Text="CellEditing" Width="120px" SelectedItemIndex="0" TargetID="editMode"></ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Begin Edit Action
                </div>
                <div class="col-md-3">
                    <div id="editAction">
                        <ul>
                            <li>Double Click</li>
                            <li>Click</li>
                        </ul>
                    </div>
                    <ej:DropDownList ID="actionClick" runat="server" ClientIDMode="Static" ClientSideOnChange="onActionChange" Value="Double Click" Width="120px" TargetID="editAction"></ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function load(args) {
            this.getColumns()[0].width = 60;
        }
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onActionChange(args) {
            var ganttObject = $("#GanttControlEditing").data("ejGantt");
            var value = args.text == "Double Click" ? ej.Gantt.BeginEditAction.DblClick : ej.Gantt.BeginEditAction.Click;
            var setting = {
                beginEditAction: value
            }
            ganttObject.option("editSettings", setting);
            ganttObject.reRenderChart(ej.Gantt.ScheduleHeaderType.Week);
        }
        function onModeChange(args) {
            var ganttObject = $("#GanttControlEditing").data("ejGantt");
            var value = args.text == "CellEditing" ? "cellEditing" : "normal";
            var setting = {
                editMode: value
            }
            ganttObject.option("editSettings", setting);
            ganttObject.reRenderChart(ej.Gantt.ScheduleHeaderType.Week);
        }
    </script>
</asp:Content>


