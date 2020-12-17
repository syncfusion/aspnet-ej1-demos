<%@ Page Title="Spreadsheet-Conditional Formatting-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows highlight the conditions applied cell using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="ConditionalFormatting.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.ConditionalFormatting" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Formatting / Conditional Formatting</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" ShowRibbon="false" EnableContextMenu="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="450" />
            <Sheets>
                <ej:Sheet>
                    <RangeSettings>
                        <ej:RangeSetting ShowHeader="false" />
                    </RangeSettings>
                </ej:Sheet>
            </Sheets>
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">

        function loadComplete(args) {
            var xlFormat = this.XLFormat, xlCFormat = this.XLCFormat;
            sheetIdx = 1;             //sheet 1
            this.sheetRename("Conditional Formatting");
            this.setWidthToColumns([167, 132, 41, 167, 132, 41, 131, 134]);
            this.mergeCells("A1:A5", true);
            this.mergeCells("D1:D5", true);
            this.mergeCells("G1:G5", true);
            this.mergeCells("G7:G11", true);
            this.mergeCells("A7:A11", true);
            this.mergeCells("D7:D11", true);
            xlCFormat.setCFRule({ "action": "greaterthan", "inputs": ["5000"], "color": "redft", "range": "E7:E11" });
            xlCFormat.setCFRule({ "action": "lessthan", "inputs": ["30"], "color": "yellowft", "range": "H1:H5" });
            xlCFormat.setCFRule({ "action": "between", "inputs": ["400", "500"], "color": "greenft", "range": "B7:B11" });
            xlCFormat.setCFRule({ "action": "equalto", "inputs": ["20"], "color": "redf", "range": "H7:H11" });
            xlCFormat.setCFRule({ "action": "textcontains", "inputs": ["loafers"], "color": "redt", "range": "B1:B5" });
            xlCFormat.setCFRule({ "action": "dateoccur", "inputs": ["02/04/2014"], "color": "redft", "range": "E1:E5" });
            xlFormat.format({ "style": { "font-weight": "bold", "font-size": "10pt", "vertical-align": "middle", "text-align": "center" } }, "A1:A13");
            xlFormat.format({ "style": { "font-weight": "bold", "font-size": "10pt", "vertical-align": "middle", "text-align": "center" } }, "D1:D13");
            xlFormat.format({ "style": { "font-weight": "bold", "font-size": "10pt", "vertical-align": "middle", "text-align": "center" } }, "G1:G7");
            this.performSelection("B1");
        }

    </script>
</asp:Content>

