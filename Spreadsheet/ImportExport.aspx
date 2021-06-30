<%@ Page Title="Spreadsheet-Import Export-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows importing and exporting the data in Excel and PDF formats using Syncfusion ASP.NET Web Spreadsheet control." CodeBehind="ImportExport.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.ImportExport" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Import Export</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" OnServerExcelExporting="Spreadsheet_ServerExcelExporting" OnServerCsvExporting="Spreadsheet_ServerCsvExporting" OnServerPdfExporting="Spreadsheet_ServerPdfExporting" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" OpenFailure="openfailure" />
            <ScrollSettings Height="540" />
            <Sheets>
                <ej:Sheet SheetName="Import Export">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="A3" />
                    </RangeSettings>
                </ej:Sheet>
            </Sheets>
           <ImportSettings ImportMapper="SpreadsheetHandler.ashx" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">

        function loadComplete(args) {
            var formatObj, xlFormat = this.XLFormat;
            if (!this.model.isImport) {
                formatObj = { header: true, formatName: "TableStyleLight1", name: "Table1", format: { contentBorder: { border: { bottom: "1px solid #000000" } }, contentLayout: [{ "background-color": "#D9D9D9", color: "#000000" }, { color: "#000000" }], headerLayout: { "font-weight": "bold", color: "#000000", border: { top: "1px solid #000000", bottom: "1px solid #000000" } } } };
                this.mergeCells("A1:F2", true);
                this.XLEdit.updateValue("A1", "SHIPMENT DETAIL ANALYSIS");
                this.setWidthToColumns([113, 142, 142, 203, 162, 183]);
                xlFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle", "text-align": "center" } }, "A1");
                xlFormat.format({ "style": { "font-weight": "bold" } }, "A3:G3");
                xlFormat.createTable(formatObj, "A3:F13");
                xlFormat.removeTable(1);
                this.XLCFormat.setCFRule({ "action": "lessthan", "inputs": ["5"], "color": "yellowft", "range": "C4:C13" });
                this.setHyperlink("D8", { webAddr: "http://www.google.com", text: this.XLEdit.getPropertyValue(7, 3) }, 0);
                this.setHyperlink("D10", { webAddr: "http://www.yahoo.com", text: this.XLEdit.getPropertyValue(9, 3) }, 0);
                this.XLComment.setComment("D4", "Free shipping for this order.", false);
                xlFormat.format({ "type": "currency" }, "E4:F13");
                this.performSelection("A4");
            }
        }

        function openfailure(args) {
            this.alert(args.statusText);
        }

    </script>
</asp:Content>

