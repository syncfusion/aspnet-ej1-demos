<%@ Page Title="Gantt-Events-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the client-side events available in the Syncfusion Gantt chart control for various user interactions." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Gantt.Events" %>


<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Events</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttControlEvents" runat="server" AllowDragAndDrop="true" EnableContextMenu="true" AllowSelection="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" StartDateMapping="StartDate" EndDateMapping="EndDate"
            ProgressMapping="PercentDone" ChildMapping="Children" ScheduleStartDate="02/23/2017"
            ScheduleEndDate="03/30/2017" TreeColumnIndex="1" HighlightWeekends="true"
            AllowSorting="true" Load="load" Create="create" ActionBegin="actionBegin" ActionComplete="actionComplete"
            QueryCellInfo="queryCellInfo" BeginEdit="beginEdit" EndEdit="endEdit" RowDataBound="rowDataBound"
            RowSelecting="rowSelecting" RowSelected="rowSelected" TaskbarEdited="taskbarEdited" SplitterResized="splitterResized"
            TaskbarEditing="taskbarEditing" QueryTaskbarInfo="queryTaskbarInfo" Expanding="expanding"
            Expanded="expanded" Collapsing="collapsing" Collapsed="collapsed" ToolbarClick="toolbarClick" 
            ContextMenuOpen="contextMenuOpen" RowDrag="rowDrag" RowDragStart="rowDragStart" RowDragStop="rowDragStop" TaskbarClick="taskbarClick" IsResponsive="true">
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" AllowIndent="true" EditMode="cellEditing" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,indent,outdent,expandAll,collapseAll" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="EventSection">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" runat="server" SelectedItemIndex="0"
                        Width="150px" ShowCheckbox="true" CheckAll="True" ClientSideOnChange="evtpropscheckedevent">
                        <Items>
                            <ej:DropDownListItem Text="create" Value="0" />
                            <ej:DropDownListItem Text="load" Value="1" />
                            <ej:DropDownListItem Text="actionBegin" Value="2" />
                            <ej:DropDownListItem Text="actionComplete" Value="3" />
                            <ej:DropDownListItem Text="beginEdit" Value="4" />
                            <ej:DropDownListItem Text="endEdit" Value="5" />
                            <ej:DropDownListItem Text="queryCellInfo" Value="6" />
                            <ej:DropDownListItem Text="rowDataBound" Value="7" />
                            <ej:DropDownListItem Text="rowSelecting" Value="8" />
                            <ej:DropDownListItem Text="rowSelected" Value="9" />
                            <ej:DropDownListItem Text="taskbarEditing" Value="10" />
                            <ej:DropDownListItem Text="taskbarEdited" Value="11" />
                            <ej:DropDownListItem Text="queryTaskbarInfo" Value="12" />
                            <ej:DropDownListItem Text="expanding" Value="13" />
                            <ej:DropDownListItem Text="expanded" Value="14" />
                            <ej:DropDownListItem Text="collapsing" Value="15" />
                            <ej:DropDownListItem Text="collapsed" Value="16" />
                            <ej:DropDownListItem Text="toolbarClick" Value="17" />
                            <ej:DropDownListItem Text="contextMenuOpen" Value="18" />
                            <ej:DropDownListItem Text="rowDrag" Value="19" />
                            <ej:DropDownListItem Text="rowDragStart" Value="20" />
                            <ej:DropDownListItem Text="rowDragStop" Value="21" />
                            <ej:DropDownListItem Text="taskbarClick" Value="22" />
                            <ej:DropDownListItem Text="splitterResized" Value="23" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" runat="server" Type="Button" Text="Clear" ClientSideOnClick="onClear"></ej:Button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">


        function evtpropscheckedevent(args) {

            var ganttObject = $("#<%=GanttControlEvents.ClientID%>").data("ejGantt");
            var dropObj = $("#<%=selectControls.ClientID%>").data("ejDropDownList");

            if (args.isChecked && ganttObject != undefined) {
                switch (args.selectedText) {
                    case "load": ganttObject.option(dropObj.selectedTextValue, "load"); break;
                    case "create": ganttObject.option(dropObj.selectedTextValue, "create"); break;
                    case "actionBegin": ganttObject.option(dropObj.selectedTextValue, "actionBegin"); break;
                    case "actionComplete": ganttObject.option(dropObj.selectedTextValue, "actionComplete"); break;
                    case "queryCellInfo": ganttObject.option(dropObj.selectedTextValue, "queryCellInfo"); break;
                    case "beginEdit": ganttObject.option(dropObj.selectedTextValue, "beginEdit"); break;
                    case "endEdit": ganttObject.option(dropObj.selectedTextValue, "endEdit"); break;
                    case "rowDataBound": ganttObject.option(dropObj.selectedTextValue, "rowDataBound"); break;
                    case "rowSelecting": ganttObject.option(dropObj.selectedTextValue, "rowSelecting"); break;
                    case "rowSelected": ganttObject.option(dropObj.selectedTextValue, "rowSelected"); break;
                    case "taskbarEditing": ganttObject.option(dropObj.selectedTextValue, "taskbarEditing"); break;
                    case "taskbarEdited": ganttObject.option(dropObj.selectedTextValue, "taskbarEdited"); break;
                    case "queryTaskbarInfo": ganttObject.option(dropObj.selectedTextValue, "queryTaskbarInfo"); break;
                    case "expanding": ganttObject.option(dropObj.selectedTextValue, "expanding"); break;
                    case "expanded": ganttObject.option(dropObj.selectedTextValue, "expanded"); break;
                    case "collapsing": ganttObject.option(dropObj.selectedTextValue, "collapsing"); break;
                    case "collapsed": ganttObject.option(dropObj.selectedTextValue, "collapsed"); break;
                    case "toolbarClick": ganttObject.option(dropObj.selectedTextValue, "toolbarClick"); break;
                    case "contextMenuOpen": ganttObject.option(dropObj.selectedTextValue, "contextMenuOpen"); break;
                    case "rowDrag": ganttObject.option(dropObj.selectedTextValue, "rowDrag"); break;
                    case "rowDragStart": ganttObject.option(dropObj.selectedTextValue, "rowDragStart"); break;
                    case "rowDragStop": ganttObject.option(dropObj.selectedTextValue, "rowDragStop"); break;
                    case "taskbarClick": ganttObject.option(dropObj.selectedTextValue, "taskbarClick"); break;
                    case "splitterResized": ganttObject.option(dropObj.selectedTextValue, "splitterResized"); break;

                }
            }
            else {
                text = {}
                text[dropObj.selectedTextValue] = null
                $("#<%=GanttControlEvents.ClientID%>").ejGantt("option", text);
            }
        }

        function load(args) {
            this.getColumns()[0].width = 60;
            jQuery.addEventLog("Gantt <span class='eventTitle'>load</span> event called");
        }

        function create(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>create</span> event called");
        }
        function actionBegin(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>actionBegin</span> event called");
        }
        function actionComplete(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>actionComplete</span> event called");
        }
        function beginEdit(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>beginEdit</span> event called");
        }

        function endEdit(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>endEdit</span> event called");
        }
        function queryCellInfo(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>queryCellInfo</span> event called");
        }
        function rowDataBound(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>rowDataBound</span> event called");
        }
        function rowSelecting(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>rowSelecting</span> event called");
        }
        function rowSelected(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>rowSelected</span> event called");
        }

        function expanding(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>expanding</span> event called");
        }

        function expanded(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>expanded</span> event called");
        }

        function collapsing(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>collapsing</span> event called");
        }

        function collapsed(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>collapsed</span> event called");
        }

        function taskbarEditing(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>taskbarEditing</span> event called");
        }

        function queryTaskbarInfo(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>queryTaskBarInfo</span> event called");
        }

        function taskbarEdited(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>taskbarEdited </span> event called");
        }
        function toolbarClick(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>toolbarClick </span> event called");
        }
        function contextMenuOpen(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>contextMenuOpen </span> event called");
        }
        function rowDrag(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>rowDrag </span> event called");
        }
        function rowDragStart(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>rowDragStart </span> event called");
        }
        function rowDragStop(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>rowDragStop </span> event called");
        }
        function taskbarClick(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>taskbarClick </span> event called");
        }
        function splitterResized(args) {
            jQuery.addEventLog("Gantt <span class='eventTitle'>splitterResized </span> event called");
        }
        function onClear() {
            $("#EventLog").html("");
        }
    </script>

    <style type="text/css">
        #GanttControlEvents {
            width: 690px;
            height: 450px;
        }
    </style>
</asp:Content>

