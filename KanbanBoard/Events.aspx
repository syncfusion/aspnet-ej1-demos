<%@ Page Title="KanbanBoard-Events-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates client-side events and triggered events when particular operations are performed in the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Kanban.Events" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / Events</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowScrolling="true" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <ClientSideEvents Create="create" ActionBegin="actionBegin" ActionComplete="actionComplete" BeginEdit="beginEdit"
            EndEdit="endEdit" EndAdd="endAdd" CardClick="cardClick" BeforeCardSelect="beforeCardSelect" CardSelect="cardSelect"
            CardDoubleClick="cardDoubleClick" CardDrop="cardDrop" CardDragStop="cardDragStop" CardDragStart="cardDragStart"
            CardDrag="cardDrag" QueryCellInfo="queryCellInfo" />
        <ScrollSettings Height="900" Width="700" />
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" />
        <EditSettings AllowAdding="true" AllowEditing="true" EditMode="Dialog">
            <EditItems>
                <ej:KanbanEditItem EditType="String" Field="Id">
                    <ValidationRules>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRules>
                </ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Dropdown" Field="Status"></ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Dropdown" Field="Assignee"></ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Numeric" Field="Estimate">
                    <NumericEditOptions DecimalPlaces="2" />
                    <ValidationRules>
                        <ej:KeyValue Key="range" Value="[0, 1000]" />
                    </ValidationRules>
                </ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="TextArea" Field="Summary">
                    <ValidationRules>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRules>
                </ej:KanbanEditItem>
            </EditItems>
        </EditSettings>
    </ej:Kanban>
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
                            <ej:DropDownListItem Text="cardClick" Value="6" />
                            <ej:DropDownListItem Text="beforeCardSelect" Value="7" />
                            <ej:DropDownListItem Text="cardSelect" Value="8" />
                            <ej:DropDownListItem Text="cardDoubleClick" Value="9" />
                            <ej:DropDownListItem Text="cardDrop" Value="10" />
                            <ej:DropDownListItem Text="cardDragStop" Value="11" />
                            <ej:DropDownListItem Text="cardDragStart" Value="12" />
                            <ej:DropDownListItem Text="cardDrag" Value="13" />
                            <ej:DropDownListItem Text="queryCellInfo" Value="14" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-kanban content">
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
            var kanbanObj = $('#<%= KanbanBoard.ClientID %>').data("ejKanban");
            var dropObj = $('#<%= selectControls.ClientID %>').data("ejDropDownList");
            if (args.isChecked && kanbanObj != undefined) {
                switch (args.value) {
                    case "0": kanbanObj.option(dropObj.selectedTextValue, "create"); break;
                    case "1": kanbanObj.option(dropObj.selectedTextValue, "actionBegin"); break;
                    case "2": kanbanObj.option(dropObj.selectedTextValue, "actionComplete"); break;
                    case "3": kanbanObj.option(dropObj.selectedTextValue, "beginEdit"); break;
                    case "4": kanbanObj.option(dropObj.selectedTextValue, "endEdit"); break;
                    case "5": kanbanObj.option(dropObj.selectedTextValue, "endAdd"); break;
                    case "6": kanbanObj.option(dropObj.selectedTextValue, "cardClick"); break;
                    case "7": kanbanObj.option(dropObj.selectedTextValue, "beforeCardSelect"); break;
                    case "8": kanbanObj.option(dropObj.selectedTextValue, "cardSelect"); break;
                    case "9": kanbanObj.option(dropObj.selectedTextValue, "cardDoubleClick"); break;
                    case "10": kanbanObj.option(dropObj.selectedTextValue, "cardDrop"); break;
                    case "11": kanbanObj.option(dropObj.selectedTextValue, "cardDragStop"); break;
                    case "12": kanbanObj.option(dropObj.selectedTextValue, "cardDragStart"); break;
                    case "13": kanbanObj.option(dropObj.selectedTextValue, "cardDrag"); break;
                    case "14": kanbanObj.option(dropObj.selectedTextValue, "queryCellInfo"); break;
                }
            }
            else {
                text = {}
                text[dropObj.selectedTextValue] = null
                $('#<%= KanbanBoard.ClientID %>').ejKanban("option", text);
            }
        }
        function create(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>create</span> event called");
        }
        function actionBegin(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>actionBegin</span> event called");
        }
        function actionComplete(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>actionComplete</span> event called");
        }
        function beginEdit(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>beginEdit</span> event called");
        }
        function endEdit(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>endEdit</span> event called");
        }
        function endAdd(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>endAdd</span> event called");
        }
        function cardClick(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>cardClick</span> event called");
        }
        function beforeCardSelect(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>beforeCardSelect</span> event called");
        }
        function cardSelect(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>cardSelect</span> event called");
        }
        function cardDoubleClick(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>cardDoubleClick</span> event called");
        }
        function cardDrop(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>cardDrop</span> event called");
        }
        function cardDragStop(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>cardDragStop</span> event called");
        }
        function cardDrag(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>cardDrag</span> event called");
        }
        function cardDragStart(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>cardDragStart</span> event called");
        }
        function queryCellInfo(args) {
            jQuery.addEventLog("Kanban <span class='eventTitle'>queryCellInfo</span> event called");
        }
        function onClear() {
            $("#EventLog").html("");
        }
    </script>
</asp:Content>

