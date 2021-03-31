<%@ Page Title="Spreadsheet-Sparkline-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows more information to the user by visualizing the data in a small amount of space using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="Sparkline.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.Sparkline" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Sparkline</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" SheetCount="1" RowCount="32" AllowFormulaBar="false" AllowSparkline="true" ShowRibbon="false" EnableContextMenu="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="450" />
            <Sheets>
                <ej:Sheet SheetName="Sparkline" ShowGridlines="false">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="S1" />
                    </RangeSettings>
                </ej:Sheet>            
            </Sheets>
            <PageSettings PageCount="1" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function loadComplete(args) {
            var xlFormat = this.XLFormat, xlEdit = this.XLEdit, xlSparkline = this.XLSparkline, xlResize = this.XLResize;
            if (!this.model.isImport) {
                xlSparkline.createSparkline("C9:D9", "F3", "Column", { markerSettings: { visible: false }, highPointColor: "red", negativePointColor: "black" });
                xlFormat.format({ "style": { "font-weight": "bold" } }, "S1:V1");
                xlEdit.updateValue('B3', "Column Chart");
                xlFormat.format({ "style": { "font-weight": "bold" } }, "B3:B3");
                this.mergeCells("D3:D4", true);
                xlSparkline.createSparkline("S6", "D3", "Column", { markerSettings: { visible: false }, highPointColor: "red" });
                this.mergeCells("G3:H4", true);
                xlSparkline.createSparkline("T7:T11", "G3", "Column", { markerSettings: { visible: false }, highPointColor: "red", startPointColor: "black", endPointColor: "green", fill: "orange" });
                this.mergeCells("J3:J4", true);
                this.mergeCells("K3:K4", true);
                this.mergeCells("L3:L4", true);
                xlSparkline.createSparkline("T8:V10", "J3:L3", "Column", { markerSettings: { visible: false }, highPointColor: "black", startPointColor: "red", negativePointColor: "green" });
                this.mergeCells("N3:O3", true);
                this.mergeCells("N4:O4", true);
                this.mergeCells("N5:O5", true);
                xlSparkline.createSparkline("T2:V4", "N3:N5", "Column", { markerSettings: { visible: false }, highPointColor: "red", negativePointColor: "black" });
                xlEdit.updateValue('B8', "Winloss Chart");
                xlFormat.format({ "style": { "font-weight": "bold" } }, "B8:B8");
                this.mergeCells("D8:D9", true);
                xlSparkline.createSparkline("S7", "D8", "Winloss", { fill: "black" });
                this.mergeCells("G8:H9", true);
                xlSparkline.createSparkline("T3:T5", "G8", "Winloss", { fill: "red", });
                this.mergeCells("J8:J9", true);
                this.mergeCells("K8:K9", true);
                this.mergeCells("L8:L9", true);
                xlSparkline.createSparkline("T5:V7", "J8:L8", "Winloss");
                this.mergeCells("N8:O8", true);
                this.mergeCells("N9:O9", true);
                this.mergeCells("N10:O10", true);
                xlSparkline.createSparkline("T5:V7", "N8:N10", "Winloss");
                xlEdit.updateValue('B12', "Line Chart");
                xlFormat.format({ "style": { "font-weight": "bold" } }, "B12:B12");
                this.mergeCells("D12:E13", true);
                xlSparkline.createSparkline("T4:T8", "D12", "Line", { startPointColor: "red", endPointColor: "blue", highPointColor: "orange" });
                this.mergeCells("G12:H12", true);
                this.mergeCells("G13:H13", true)
                this.mergeCells("G14:H14", true)
                xlSparkline.createSparkline("S4:V6", "G12:G14", "Line", { highPointColor: "red" });
                xlSparkline.createSparkline("U5:V8", "J12:K12", "Line", { negativePointColor: "Black" });
            }
        }
    </script>
</asp:Content>

