<%@ Page Title="Grid-Events-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains the basic functionalities of the events that are available in the Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Grid.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Events</span>
     <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowSorting="true" AllowGrouping="True" AllowPaging="True">
            <ClientSideEvents Create="create" ActionBegin="actionBegin" ActionComplete="actionComplete" BeginEdit="beginEdit" 
                EndEdit="endEdit" EndAdd="endAdd" EndDelete="endDelete" QueryCellInfo="queryCellInfo"  RowDataBound="rowDataBound" 
                RowSelecting="rowSelecting" RowSelected="rowSelected" ColumnDragStart="columnDragStart" ColumnDrag="columnDrag" 
                ColumnDrop="columnDrop" RecordClick="recordClick" RecordDoubleClick="recordDoubleClick" RightClick="rightClick" />
            <EditSettings AllowEditing="True" AllowDeleting="True" AllowAdding="True"></EditSettings>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
            <PageSettings PageSize="10"></PageSettings>
            <Columns>
                 <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="90">
                            <ValidationRule>
                                <ej:KeyValue Key="required" Value="true" />
                                <ej:KeyValue Key="number" Value="true" />
                            </ValidationRule>
                        </ej:Column>
                        <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90">
                            <ValidationRule>
                                <ej:KeyValue Key="required" Value="true" />
                                <ej:KeyValue Key="minlength" Value="3" />
                            </ValidationRule>
                        </ej:Column>
                        <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" EditType="DropdownEdit" Width="90" />
                 <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" EditType="NumericEdit">
                    <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                </ej:Column>
               <ej:Column Field="ShipCity" HeaderText="Ship City" Width="75" EditType="DropdownEdit"></ej:Column>
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="EventSection">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" runat="server" SelectedItemIndex="0" Width="150px" ShowCheckbox="True"
                        CheckAll="True" ClientSideOnChange="evtpropscheckedevent">
                        <Items>
                            <ej:DropDownListItem Text="create" Value="0" />
                            <ej:DropDownListItem Text="actionBegin" Value="1" />
                            <ej:DropDownListItem Text="actionComplete" Value="2" />
                            <ej:DropDownListItem Text="beginEdit" Value="3" />
                            <ej:DropDownListItem Text="endEdit" Value="4" />
                            <ej:DropDownListItem Text="endAdd" Value="5" />
                            <ej:DropDownListItem Text="endDelete" Value="6" />
                            <ej:DropDownListItem Text="queryCellInfo" Value="7" />
                            <ej:DropDownListItem Text="rowDataBound" Value="8" />
                            <ej:DropDownListItem Text="rowSelecting" Value="9" />
                            <ej:DropDownListItem Text="rowSelected" Value="10" />
                            <ej:DropDownListItem Text="columnDragStart" Value="11" />
                            <ej:DropDownListItem Text="columnDrag" Value="12" />
                            <ej:DropDownListItem Text="columnDrop" Value="13" />
                            <ej:DropDownListItem Text="recordClick" Value="14" />
                            <ej:DropDownListItem Text="recordDoubleClick" Value="15" />
                            <ej:DropDownListItem Text="rightClick" Value="16" />
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

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function evtpropscheckedevent(args) {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            var dropObj = $('#<%= selectControls.ClientID %>').data("ejDropDownList");
            if (args.isChecked && gridObj != undefined) {
                switch (args.value) {
                    case "0": gridObj.option(dropObj.selectedTextValue, "create"); break;
                    case "1": gridObj.option(dropObj.selectedTextValue, "actionBegin"); break;
                    case "2": gridObj.option(dropObj.selectedTextValue, "actionComplete"); break;
                    case "3": gridObj.option(dropObj.selectedTextValue, "beginEdit"); break;
                    case "4": gridObj.option(dropObj.selectedTextValue, "endEdit"); break;
                    case "5": gridObj.option(dropObj.selectedTextValue, "endAdd"); break;
                    case "6": gridObj.option(dropObj.selectedTextValue, "endDelete"); break;
                    case "7": gridObj.option(dropObj.selectedTextValue, "queryCellInfo"); break;
                    case "8": gridObj.option(dropObj.selectedTextValue, "rowDataBound"); break;
                    case "9": gridObj.option(dropObj.selectedTextValue, "rowSelecting"); break;
                    case "10": gridObj.option(dropObj.selectedTextValue, "rowSelected"); break;
                    case "11": gridObj.option(dropObj.selectedTextValue, "columnDragStart"); break;
                    case "12": gridObj.option(dropObj.selectedTextValue, "columnDrag"); break;
                    case "13": gridObj.option(dropObj.selectedTextValue, "columnDrop"); break;
                    case "14": gridObj.option(dropObj.selectedTextValue, "recordClick"); break;
                    case "15": gridObj.option(dropObj.selectedTextValue, "recordDoubleClick"); break;
                    case "16": gridObj.option(dropObj.selectedTextValue, "rightClick"); break;
                }
            }
            else {
                text= {}
                text[dropObj.selectedTextValue] =  null 
                $('#<%= OrdersGrid.ClientID %>').ejGrid("option", text);
            }
        }
        function create(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>create</span> event called");
        }
        function actionBegin(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>actionBegin</span> event called");
        }
        function actionComplete(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>actionComplete</span> event called");
        }
        function beginEdit(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>beginEdit</span> event called");
        }
        function endEdit(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>endEdit</span> event called");
        }
        function endAdd(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>endAdd</span> event called");
        }
        function endDelete(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>endDelete</span> event called");
        }
        function queryCellInfo(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>queryCellInfo</span> event called");
        }
        function rowDataBound(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>rowDataBound</span> event called");
        }
        function rowSelecting(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>rowSelecting</span> event called");
        }
        function rowSelected(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>rowSelected</span> event called");
        }
        function columnDragStart(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>columnDragStart</span> event called");
        }
        function columnDrag(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>columnDrag</span> event called");
        }
        function columnDrop(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>columnDrop</span> event called");
        }
        function recordClick(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>recordClick</span> event called");
        }
        function recordDoubleClick(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>recordDoubleClick</span> event called");
        }
        function rightClick(args) {
            jQuery.addEventLog("Grid <span class='eventTitle'>rightClick</span> event called");
        }
        function onClear() {
            $("#EventLog").html("");
        }
    </script>
</asp:Content>

