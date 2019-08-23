<%@ Page Title="Spreadsheet-FIFA Template-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows templates using  Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="Templates.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.Templates" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / FIFA Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" SheetCount="4" AllowFormulaBar="false" AllowFreezing="true" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" ActionBegin="actionBegin" OpenFailure="openfailure" />
            <ScrollSettings Height="540" />
            <Sheets>
                <ej:Sheet ShowGridlines="false">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="B7" ShowHeader="false" />
                    </RangeSettings>
                </ej:Sheet>
                <ej:Sheet ShowGridlines="false">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="A4" ShowHeader="false" />
                    </RangeSettings>
                </ej:Sheet>
                <ej:Sheet ShowGridlines="false">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="B4" ShowHeader="false" />
                    </RangeSettings>
                </ej:Sheet>
                <ej:Sheet ShowGridlines="false">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="B4" ShowHeader="false" />
                    </RangeSettings>
                </ej:Sheet>
            </Sheets>
            <ImportSettings ImportMapper="SpreadsheetHandler.ashx" />
            <ExportSettings AllowExporting="false" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">

        function loadComplete(args) {
            if (this.model.isImport)
                return;
            var i, sheetIdx = 1, bcolor = "#F2F2F2", hbcolor = "#FFFFFF", hstyle = { "font-weight": "bold", "color": "#000000", "text-align": "center" }, formatName = ["TableStyleLight8", "TableStyleLight9", "TableStyleLight10", "TableStyleLight12"], formatObj = [], xlFormat = this.XLFormat;
            for (i = 0; i < formatName.length; i++)
                formatObj[i] = { "header": true, "name": "Table" + (i + 1), "formatName": formatName[i], hideTab: true };
            this.setWidthToColumns([55, 200, 80, 80, 180, 200, 80]);
            this.XLFormat.format({ "style": { "background-color": bcolor } }, "B8:G71");
            this.XLFormat.format({ "style": { "background-color": "#3b2f8d" } }, "B1:G6");
            this.XLShape.setPicture('B1', "../Content/images/spreadsheet/fifa.png", 817, 117);
            this.XLFormat.format({ "style": { "font-weight": "bold" } }, "B8:B71");
            this.XLFormat.format({ "style": { "color": "#996600" } }, "C8:C71");
            this.XLFormat.format({ "style": { "color": "#3333FF" } }, "D8:D71");
            this.XLFreeze.freezeRows(7);
            xlFormat.createTable(formatObj[0], "B7:G71");
            sheetIdx = 2;             //sheet 2
            this.gotoPage(sheetIdx, false);
            this.setWidthToColumns([42, 130, 50, 82, 50, 62]);
            this.XLFormat.format({ "style": { "background-color": bcolor } }, "A5:F19");
            this.mergeCells("B2:E2", true);
            this.XLEdit.updateValue("B2", "TOP GOAL SCORERS");
            this.XLFormat.format({ "style": hstyle }, "B2:B2");
            this.XLFormat.format({ "style": { "text-align": "center" } }, "A5:A19");
            this.XLFormat.format({ "style": { "text-align": "center" } }, "C5:C19");
            xlFormat.createTable(formatObj[1], "A4:F19");
            this.XLSelection.selectRange("H4");
            this.XLChart.createChart("B5:C19", { type: "bar", enable3D: false, marker: { visible: false }, top: 61, left: 600, hideTab: true });
            sheetIdx = 3;            //sheet 3
            this.gotoPage(sheetIdx, false);
            this.setWidthToColumns([75, 100, 195, 175, 235, 100, 75]);
            this.XLFormat.format({ "style": { "background-color": bcolor } }, "B5:F42");
            this.XLFormat.format({ "style": { "text-align": "center" } }, "B5:B45");
            this.XLFormat.format({ "style": { "background-color": "#ca6828" } }, "B1:F3");
            this.XLShape.setPicture('B1', "../Content/images/spreadsheet/m-o-m.png", 803, 117);
            this.XLResize.setRowHeight(0, 81);
            this.XLFreeze.freezeRows(4);
            xlFormat.createTable(formatObj[2], "B4:F42");
            sheetIdx = 4;            //sheet 4
            this.gotoPage(sheetIdx, false);
            this.setWidthToColumns([70, 95, 133, 100, 100, 110, 132, 135, 70]);
            this.XLFormat.format({ "style": { "background-color": bcolor } }, "B5:H36");
            this.XLShape.setPicture('B1', "../Content/images/spreadsheet/rankings.png", 803, 117);
            this.XLResize.setRowHeight(0, 81);
            this.XLFormat.format({ "style": { "text-align": "center" } }, "B5:B36");
            this.XLFormat.format({ "style": { "background-color": "#f7971d" } }, "B1:H3");
            this.XLFreeze.freezeRows(4);
            xlFormat.createTable(formatObj[3], "B4:H36");
            this.gotoPage(1, false);
            this.performSelection("B8");
        }

        function actionBegin(args) {
            if (args.reqType === "gotoSheet" && !args.newSheet) {
                var charts, len, i = 0;
                charts = this.getSheetElement(args.gotoIndex).find(".e-datavisualization-chart");
                len = charts.length;
                while (i < len) {
                    $(charts[i]).ejChart("redraw");
                    i++;
                }
            }
        }

        function openfailure(args) {
            this.alert(args.statusText);
        }

    </script>
</asp:Content>

