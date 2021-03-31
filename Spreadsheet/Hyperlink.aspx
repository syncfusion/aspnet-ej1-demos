<%@ Page Title="Spreadsheet-Hyperlink and Comment-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows how to navigate the web link and how to add the additional information about the cell using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="Hyperlink.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.Hyperlink" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Hyperlink and Comment</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" SheetCount="3" AllowFormulaBar="false" ShowRibbon="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="470" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function loadComplete(args) {
            var sheetIdx, xlFormat = this.XLFormat, xlComment = this.XLComment;
            sheetIdx = 1;              //sheet 1            
            this.sheetRename("Hyperlink");
            this.setWidthToColumns([152, 135, 162, 172, 172, 152]);
            xlFormat.format({ "style": { "font-weight": "bold" } }, "A1:F1");
            xlFormat.format({ "type": "currency" }, "C2:D11");
            this.setHyperlink("E3:E3", { "cellAddr": "A1:D2" }, 2);
            this.setHyperlink("E4:E4", { "cellAddr": "G1:J2" }, 2);
            this.setHyperlink("E6:E6", { "cellAddr": "A1:D2" }, 3);
            this.setHyperlink("E8:E8", { "cellAddr": "M1:P2" }, 2);
            this.setHyperlink("E9:E9", { "cellAddr": "G1:J2" }, 3);
            this.setHyperlink("F2:F2", { "webAddr": "http://www.amazon.com" }, 1);
            this.setHyperlink("F4:F4", { "webAddr": "http://www.aliexpress.com" }, 1);
            this.setHyperlink("F5:F5", { "webAddr": "http://www.alibaba.com" }, 1);
            this.setHyperlink("F8:F8", { "webAddr": "http://www.ebay.com" }, 1);
            xlComment.setComment("A2", "Casual Footwears with wide variety of colors.", false);
            xlComment.setComment("A4", "Formal Footwears with wide range of sizes.", false);
            xlComment.setComment("A7", "Sneakers with recent designs.", false);
            xlComment.setComment("D4", "Good price for good quality.", false);
            xlComment.setComment("D10", "High price for tough and stylish design.", false);
            xlComment.setComment("C6", "Cheap and best with price and quality.", false);
            xlComment.setComment("B7", "Low cost good design.", false);
            xlComment.setComment("B11", "T-Shirts for a class.", false);
            xlComment.deleteComment("B11");
            xlComment.showHideComment(this.getCell(6, 1, sheetIdx));
            sheetIdx = 2;               //sheet 2
            this.gotoPage(sheetIdx, false);
            this.setWidthToColumns([115, 115, 115, 115, 64, 64, 115, 115, 123, 125, 64, 64, 125, 125, 125, 125]);
            xlFormat.format({ "style": { "font-weight": "bold", "font-size": "12pt", "color": "#666699" } }, "A1:D1");
            xlFormat.format({ "style": { "font-weight": "bold", "font-size": "12pt", "color": "#666699" } }, "G1:J1");
            xlFormat.format({ "style": { "font-weight": "bold", "font-size": "12pt", "color": "#666699" } }, "M1:P1");
            this.updateRange(sheetIdx, { dataSource: getFormalSource(), startCell: "G1", showHeader: true });
            this.updateRange(sheetIdx, { dataSource: getRunningSource(), startCell: "M1", showHeader: true });
            this.updateRange(sheetIdx, { dataSource: getSportSource(), startCell: "A1", showHeader: true });
            xlFormat.format({ "type": "currency" }, "C2:D2");
            xlFormat.format({ "type": "currency" }, "I2:J2");
            xlFormat.format({ "type": "currency" }, "N2:O2");
            sheetIdx = 3;            //sheet3
            this.gotoPage(sheetIdx, false);
            this.setWidthToColumns([115, 115, 115, 115, 64, 64, 115, 115, 123, 125, 64, 125, 125, 64, 125]);
            xlFormat.format({ "style": { "font-weight": "bold", "font-size": "12pt", "color": "#666699" } }, "A1:D1");
            xlFormat.format({ "style": { "font-weight": "bold", "font-size": "12pt", "color": "#666699" } }, "G1:J1");
            this.updateRange(sheetIdx, { dataSource: getFlipFlopperSource(), startCell: "A1", showHeader: true });
            this.updateRange(sheetIdx, { dataSource: getLoaferSource(), startCell: "G1", showHeader: true });
            xlFormat.format({ "type": "currency" }, "D2:E2");
            xlFormat.format({ "type": "currency" }, "J2:K2");
            this.gotoPage(1, false);
            this.performSelection("A2");
        }

        function getSportSource() {
            return [{ "Item Name": "Sports Shoes", Quantity: 20, Price: "$30", Amount: "$600" }];
        }
        function getFormalSource() {
            return [{ "Item Name": "Formal Shoes", Quantity: 20, Price: "$15", Amount: "$300" }];
        }
        function getFlipFlopperSource() {
            return [{ "Item Name": "Flip- Flops & Slippers", Quantity: 30, Price: "$10", Amount: "$300" }];
        }
        function getRunningSource() {
            return [{ "Item Name": "Running Shoes", Quantity: 20, Price: "$10", Amount: "$200" }];
        }
        function getLoaferSource() {
            return [{ "Item Name": "Loafers", Quantity: 31, Price: "$10", Amount: "$310" }];
        }
    </script>
</asp:Content>

