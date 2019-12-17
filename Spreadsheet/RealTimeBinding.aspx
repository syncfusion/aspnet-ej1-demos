<%@ Page Title="Spreadsheet-Collaborative Editing-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This demo shows how to work with SignalR in the Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="RealTimeBinding.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.RealTimeBinding" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Real Time Binding </span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" ShowRibbon="false" EnableContextMenu="false" ColumnWidth="160" ColumnCount="7" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" ActionComplete="actionComplete" />
            <ScrollSettings Height="450" AllowVirtualScrolling="false" ScrollMode="Normal" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div>
            <div class="row">
                <div class="col-md-6 lineheight">Font Size:</div>
                <div class="col-md-6">
                    <ej:DropDownList ID="fontsize" runat="server" DataTextField="Text" DataValueField="Value" Width="120px" WatermarkText="Select" ClientSideOnChange="onChange" SelectedItemIndex="1">
                        <Items>
                            <ej:DropDownListItem Text="8" Value="8pt" />
                            <ej:DropDownListItem Text="11" Value="11pt" />
                            <ej:DropDownListItem Text="14" Value="14pt" />
                            <ej:DropDownListItem Text="18" Value="18pt" />
                            <ej:DropDownListItem Text="36" Value="36pt" />
                            <ej:DropDownListItem Text="72" Value="72pt" />

                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 lineheight">Font Family:</div>
                <div class="col-md-6">
                    <ej:DropDownList ID="fontfamily" runat="server" Width="120px" WatermarkText="Select" ClientSideOnChange="onChange" SelectedItemIndex="1">
                        <Items>
                            <ej:DropDownListItem Text="Arial" Value="Arial" />
                            <ej:DropDownListItem Text="Calibri" Value="Calibri" />
                            <ej:DropDownListItem Text="Cambria" Value="Cambria" />
                            <ej:DropDownListItem Text="Courier" Value="Courier" />
                            <ej:DropDownListItem Text="Tahoma" Value="Tahoma" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 lineheight">Text Align:</div>
                <div class="col-md-6">
                    <ej:DropDownList ID="textalign" runat="server" Width="120px" WatermarkText="Select" ClientSideOnChange="onChange" SelectedItemIndex="0">
                        <Items>
                            <ej:DropDownListItem Text="Left" Value="left" />
                            <ej:DropDownListItem Text="Center" Value="center" />
                            <ej:DropDownListItem Text="Right" Value="right" />

                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 lineheight labelWidth">Font Color:</div>
                <div class="col-md-6 colorWidth">
                    <ej:ColorPicker runat="server" ID="fontcolor" Value="#278787" ShowApplyCancel="false" ShowSwitcher="false" ClientSideOnChange="onChange" ClientSideOnSelect="onChange"></ej:ColorPicker>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 lineheight labelWidth">BackGround Color:</div>
                <div class="col-md-6 colorWidth">
                    <ej:ColorPicker runat="server" ID="bgcolor" Value="#278787" ShowApplyCancel="false" ShowSwitcher="false" ClientSideOnChange="onChange" ClientSideOnSelect="onChange"></ej:ColorPicker>
                </div>
            </div>
            <div class="heading actlog">
                <span>Active Logs</span>
            </div>
            <div>
                <strong>Recent Change Logs (Your User Name : <span id="userName">user <%= (new Random().Next(1000, 9999))%></span>)</strong><br />
                <br />
                <ul id="log" style="padding-left: 17px;"></ul>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../Scripts/jquery.signalR-1.1.4.min.js" type="text/javascript"></script>
    <script src='<%: ResolveClientUrl("~/signalr/hubs") %>' type="text/javascript"></script>
    <script type="text/javascript">
        function loadComplete(args) {
            this.setWidthToColumns([110, 190, 260, 160]);
            this.XLFormat.format({ "style": { "font-weight": "bold" } }, "A1:E1");
            $("#log").height(this.element.height() - 360);
        }
        function onChange(args) {
            var xlObj = $('#<%= FlatSpreadsheet.ClientID %>').data("ejSpreadsheet"), id = this.element[0].id, range = xlObj.getSheet(xlObj.getActiveSheetIndex()).selectedRange, name = "LayoutSection_PropertySection_";
            switch (id) {
                case name + "fontsize":
                    xlObj.XLFormat.format({ style: { "font-size": args.selectedValue } }, range);
                    break;
                case name + "fontfamily":
                    xlObj.XLFormat.format({ style: { "font-family": args.selectedValue } }, range);
                    break;
                case name + "textalign":
                    xlObj.XLFormat.format({ style: { "text-align": args.selectedValue } }, range);
                    break;
                case name + "fontcolor":
                    xlObj.XLFormat.format({ style: { "color": args.value } }, range);
                    break;
                case name + "bgcolor":
                    xlObj.XLFormat.format({ style: { "background-color": args.value } }, range);
                    break;
            }
        }
        $(function () {
            var xlObj;
            $("#sampleProperties").ejPropertiesPanel();
            window.signal = $.connection.spreadsheetHub;
            window.signal.client.modify = function (userId, range, action, data, sheetIndex) {
                xlObj =$('#<%= FlatSpreadsheet.ClientID %>').data("ejSpreadsheet");
                window.isSuccess = true;
                if (action === "edit") {
                    var index = xlObj.getRangeIndices(range);
                    xlObj.XLEdit.updateCell({ rowIndex: index[0], colIndex: index[1] }, data);
                    $("#log").append("<li>" + ej.format(new Date(), "hh:mm:ss") + " : " + userId + " has " + action + " in " + range + "</li>");
                }
                else if (action === "cell-format") {
                    xlObj.XLFormat.format({ style: xlObj.XLFormat.getFormatFromHashCode(data) }, range);
                    $("#log").append("<li>" + ej.format(new Date(), "hh:mm:ss") + " : " + userId + " has applied " + action + " in " + range + "</li>");
                }
                xlObj.performSelection(range);

            };
            $.signalR.hub.start().done(function () {
                window.actionComplete = function (args) {
                    if (window.isSuccess) {
                        window.isSuccess = false;
                        return;
                    }
                    xlObj = $('#<%= FlatSpreadsheet.ClientID %>').data("ejSpreadsheet");
                    if (args.reqType == "edit")
                        window.signal.server.modify($("#userName").text(), xlObj.getAlphaRange(args.rowIndex, args.colIndex, args.rowIndex, args.colIndex), args.reqType, args.cValue, args.sheetIndex);
                    else if (args.reqType == "cell-format")
                        window.signal.server.modify($("#userName").text(), xlObj.getAlphaRange(args.range[0], args.range[1], args.range[2], args.range[3]), args.reqType, args.selectedCell[0].className, args.sheetIndex);
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .lineheight {
            line-height: 30px;
        }

        .propheight {
            max-height: 188px;
        }

        .labelWidth {
            min-width: 65%;
        }

        .colorWidth {
            max-width: 10%;
        }

        .actlog {
            border-top: 1px solid #D9DEDD;
        }
    </style>
</asp:Content>

