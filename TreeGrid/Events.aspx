<%@ Page Title="TreeGrid-Events-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the cliet-side events available in the Syncfusion tree grid control for various user interactions." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.Events" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Events</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlEvents" ChildMapping="SubTasks" TreeColumnIndex="1" Load="load"
            ActionBegin="actionBegin"  AllowDragAndDrop="true" AllowColumnResize="true" AllowColumnReordering="true" ActionComplete="ActionComplete" QueryCellInfo="queryCellInfo" BeginEdit="beginEdit"
            EndEdit="endEdit" RowSelecting="rowSelecting" RowSelected="rowSelected" Collapsing="collapsing" Collapsed="collapsed"
            Expanding="expanding" Expanded="expanded" ColumnDragStart="columnDragStart" ColumnDrag="columnDrag" ColumnDrop="columnDrop" RecordDoubleClick="recordDoubleClick" ToolbarClick="toolbarClick"
            ContextMenuOpen="contextMenuOpen" RowDrag="rowDrag" RowDragStart="rowDragStart" RowDragStop="rowDragStop" ColumnResized="columnResized" RecordClick="recordClick"
             RowDropActionBegin="rowDropActionBegin" ColumnResizeStart="columnResizeStart" ColumnResizeEnd="columnResizeEnd" RowDataBound="rowDataBound" Create="create" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric" />
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" EditMode="cellEditing" RowPosition="BelowSelectedRow" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,expandAll,collapseAll" />
            <ContextMenuSettings ShowContextMenu="true"
                ContextMenuItems="add,edit,delete" />
        </ej:TreeGrid>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="EventSection">
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
                            <ej:DropDownListItem Text="expanding" Value="10" />
                            <ej:DropDownListItem Text="expanded" Value="11" />
                            <ej:DropDownListItem Text="collapsing" Value="12" />
                            <ej:DropDownListItem Text="collapsed" Value="13" />
                            <ej:DropDownListItem Text="columnDragStart" Value="14" />
                            <ej:DropDownListItem Text="columnDrag" Value="15" />
                            <ej:DropDownListItem Text="columnDrop" Value="16" />
                            <ej:DropDownListItem Text="contextMenuOpen" Value="17" />
                            <ej:DropDownListItem Text="rowDrag" Value="18" />
                            <ej:DropDownListItem Text="rowDragStart" Value="19" />
                            <ej:DropDownListItem Text="rowDragStop" Value="20" />
                            <ej:DropDownListItem Text="rowDropActionBegin" Value="21" />
                            <ej:DropDownListItem Text="columnResizeStart" Value="22" />
                            <ej:DropDownListItem Text="columnResizeEnd" Value="23" />
                            <ej:DropDownListItem Text="columnResized" Value="24" />
                            <ej:DropDownListItem Text="recordClick" Value="25" />
                            <ej:DropDownListItem Text="recordDoubleClick" Value="26" />
                            <ej:DropDownListItem Text="toolbarClick" Value="27" />
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

            var treeGridObject = $("#<%=TreeGridControlEvents.ClientID%>").data("ejTreeGrid");
            var dropObj = $("#<%=selectControls.ClientID%>").data("ejDropDownList");

            if (args.isChecked && treeGridObject != undefined) {
                switch (args.selectedText) {
                    case "load": treeGridObject.option(dropObj.selectedTextValue, "load"); break;
                    case "columnDragStart": treeGridObject.option(dropObj.selectedTextValue, "columnDragStart"); break;
                    case "columnDrag": treeGridObject.option(dropObj.selectedTextValue, "columnDrag"); break;
                    case "columnDrop": treeGridObject.option(dropObj.selectedTextValue, "columnDrop"); break;
                    case "contextMenuOpen": treeGridObject.option(dropObj.selectedTextValue, "contextMenuOpen"); break;
                    case "rowDrag": treeGridObject.option(dropObj.selectedTextValue, "rowDrag"); break;
                    case "rowDragStart": treeGridObject.option(dropObj.selectedTextValue, "rowDragStart"); break;
                    case "rowDragStop": treeGridObject.option(dropObj.selectedTextValue, "rowDragStop"); break;
                    case "rowDropActionBegin": treeGridObject.option(dropObj.selectedTextValue, "rowDropActionBegin"); break;
                    case "columnResizeStart": treeGridObject.option(dropObj.selectedTextValue, "columnResizeStart"); break;
                    case "columnResizeEnd": treeGridObject.option(dropObj.selectedTextValue, "columnResizeEnd"); break;
                    case "columnResized": treeGridObject.option(dropObj.selectedTextValue, "columnResized"); break;
                    case "recordClick": treeGridObject.option(dropObj.selectedTextValue, "recordClick"); break;
                    case "recordDoubleClick": treeGridObject.option(dropObj.selectedTextValue, "recordDoubleClick"); break;
                    case "toolbarClick": treeGridObject.option(dropObj.selectedTextValue, "toolbarClick"); break;
                    case "create": treeGridObject.option(dropObj.selectedTextValue, "create"); break;
                    case "actionBegin": treeGridObject.option(dropObj.selectedTextValue, "actionBegin"); break;
                    case "actionComplete": treeGridObject.option(dropObj.selectedTextValue, "actionComplete"); break;
                    case "queryCellInfo": treeGridObject.option(dropObj.selectedTextValue, "queryCellInfo"); break;
                    case "beginEdit": treeGridObject.option(dropObj.selectedTextValue, "beginEdit"); break;
                    case "endEdit": treeGridObject.option(dropObj.selectedTextValue, "endEdit"); break;
                    case "rowDataBound": treeGridObject.option(dropObj.selectedTextValue, "rowDataBound"); break;
                    case "rowSelecting": treeGridObject.option(dropObj.selectedTextValue, "rowSelecting"); break;
                    case "rowSelected": treeGridObject.option(dropObj.selectedTextValue, "rowSelected"); break;
                    case "expanding": treeGridObject.option(dropObj.selectedTextValue, "expanding"); break;
                    case "expanded": treeGridObject.option(dropObj.selectedTextValue, "expanded"); break;
                    case "collapsing": treeGridObject.option(dropObj.selectedTextValue, "collapsing"); break;
                    case "collapsed": treeGridObject.option(dropObj.selectedTextValue, "collapsed"); break;
                }
            }
            else {
                text = {}
                text[dropObj.selectedTextValue] = null
                $("#<%=TreeGridControlEvents.ClientID%>").ejTreeGrid("option", text);
            }
        }

        function load(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>load</span> event called");
        }
        function columnDragStart(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>columnDragStart</span> event called");
        }
        function columnDrag(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>columnDrag</span> event called");
        }
        function columnDrop(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>columnDrop</span> event called");
        }
        function contextMenuOpen(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>contextMenuOpen</span> event called");
        }
        function rowDrag(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>rowDrag</span> event called");
        }
        function rowDragStart(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>rowDragStart</span> event called");
        }
        function rowDragStop(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>rowDragStop</span> event called");
        }
        function rowDropActionBegin(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>rowDropActionBegin</span> event called");
        }
        function columnResizeStart(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>columnResizeStart</span> event called");
        }
        function columnResizeEnd(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>columnResizeEnd</span> event called");
        }
        function columnResized(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>columnResized</span> event called");
        }
        function recordClick(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>recordClick</span> event called");
        }
        function recordDoubleClick(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>recordDoubleClick</span> event called");
        }
        function toolbarClick(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>toolbarClick</span> event called");
        }
        function create(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>create</span> event called");
        }
        function actionBegin(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>actionBegin</span> event called");
        }
        function actionComplete(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>actionComplete</span> event called");
        }
        function beginEdit(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>beginEdit</span> event called");
        }

        function endEdit(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>endEdit</span> event called");
        }
        function queryCellInfo(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>queryCellInfo</span> event called");
        }
        function rowDataBound(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>rowDataBound</span> event called");
        }
        function rowSelecting(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>rowSelecting</span> event called");
        }
        function rowSelected(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>rowSelected</span> event called");
        }

        function expanding(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>expanding</span> event called");
        }

        function expanded(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>expanded</span> event called");
        }

        function collapsing(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>collapsing</span> event called");
        }

        function collapsed(args) {
            jQuery.addEventLog("TreeGrid <span class='eventTitle'>collapsed</span> event called");
        }

        function onClear() {
            $("#EventLog").html("");
        }
    </script>

</asp:Content>

