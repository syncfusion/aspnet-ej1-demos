<%@ Page Title="Spreadsheet-Events-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows client-side events that trigger on specific actions in the Syncfusion ASP.NET web Spreadsheet control" CodeBehind="Event.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.Event" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Event</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" ShowRibbon="false" EnableContextMenu="false" runat="server">
            <ScrollSettings Height="450" />
            <ClientSideEvents ActionBegin="actionBegin" ActionComplete="actionComplete" BeforeCellFormat="beforeCellFormat" Drag="drag"
                CellEdit="cellEdit" CellSave="cellSave" CellClick="cellClick" CellHover="cellHover" BeforeCellSelect="beforeCellSelect" 
                Load="load" LoadComplete="loadComplete" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="EventSection">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" runat="server" Width="150px" ShowCheckbox="True"
                        CheckAll="True" ClientSideOnChange="changeevent">
                        <Items>                            
                            <ej:DropDownListItem Text="actionBegin" Value="0" />
                            <ej:DropDownListItem Text="actionComplete" Value="1" />
                            <ej:DropDownListItem Text="beforeCellFormat" Value="2" />
                            <ej:DropDownListItem Text="drag" Value="3" />
                            <ej:DropDownListItem Text="cellEdit" Value="4" />
                            <ej:DropDownListItem Text="cellClick" Value="5" />
                            <ej:DropDownListItem Text="load" Value="6" />
                            <ej:DropDownListItem Text="loadComplete" Value="7" />
                            <ej:DropDownListItem Text="cellHover" Value="8" />
                            <ej:DropDownListItem Text="cellSave" Value="9" />
                            <ej:DropDownListItem Text="beforeCellSelect" Value="10" />
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

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">

        $(function () {
            xlObj = $('#<%= FlatSpreadsheet.ClientID %>').data("ejSpreadsheet");
            ddObj = $('#<%= selectControls.ClientID %>').data("ejDropDownList");
            ddObj.unselectItemByIndex(8);
            ddObj.unselectItemByIndex(10);
            xlObj.XLFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle", "text-align": "center", "background-color": "#559ad9", "color": "#FFFFFF" } }, "A1:F1");
            xlObj.setWidthToColumns([132, 141, 131, 137, 122, 122]);
            xlObj.performSelection("A2");
        });

        function changeevent(args) {
            if (args.isChecked && xlObj != undefined) {
                switch (args.value) {
                    case "0": xlObj.option(args.selectedText, "actionBegin"); break;
                    case "1": xlObj.option(args.selectedText, "actionComplete"); break;
                    case "2": xlObj.option(args.selectedText, "beforeCellFormat"); break;
                    case "3": xlObj.option(args.selectedText, "drag"); break;
                    case "4": xlObj.option(args.selectedText, "cellEdit"); break;
                    case "5": xlObj.option(args.selectedText, "cellClick"); break;
                    case "6": xlObj.option(args.selectedText, "load"); break;
                    case "7": xlObj.option(args.selectedText, "loadComplete"); break;
                    case "8": xlObj.option(args.selectedText, "cellHover"); break;
                    case "9": xlObj.option(args.selectedText, "cellSave"); break;
                    case "10": xlObj.option(args.selectedText, "beforeCellSelect"); break;
                }
            }
            else xlObj.option(args.selectedText, null);
        }
        function actionBegin(args) {
            jQuery.addEventLog("Spreadsheet <span class='eventTitle'>actionBegin</span> event called");
        }
        function actionComplete(args) {
            jQuery.addEventLog("Spreadsheet <span class='eventTitle'>actionComplete</span> event called");
        }
        function beforeCellFormat(args) {
            jQuery.addEventLog("Spreadsheet <span class='eventTitle'>beforeCellFormat</span> event called");
        }
        function drag(args) {
            jQuery.addEventLog("Spreadsheet <span class='eventTitle'>drag</span> event called");
        }
        function cellEdit(args) {
            jQuery.addEventLog("Spreadsheet <span class='eventTitle'>cellEdit</span> event called");
        }
        function cellClick(args) {
            jQuery.addEventLog("Spreadsheet <span class='eventTitle'>cellClick</span> event called");
        }
        function load(args) {
            jQuery.addEventLog("Spreadsheet <span class='eventTitle'>load</span> event called");
        }
        function loadComplete(args) {
            jQuery.addEventLog("Spreadsheet <span class='eventTitle'>loadComplete</span> event called");
        }
        function cellHover(args) {
            jQuery.addEventLog("Spreadsheet <span class='eventTitle'>cellHover</span> event called");
        }
        function cellSave(args) {
            jQuery.addEventLog("Spreadsheet <span class='eventTitle'>cellSave</span> event called");
        }
        function beforeCellSelect(args) {
            jQuery.addEventLog("Spreadsheet <span class='eventTitle'>beforeCellSelect</span> event called");
        }
        function onClear() {
            $("#EventLog").html("");
        }

    </script>
</asp:Content>

