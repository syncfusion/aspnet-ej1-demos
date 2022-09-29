<%@ Page Title="Spreadsheet-Cell Formatting-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows highlight the particular cell or section of cells from whole workbook using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="CellFormatting.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.CellFormatting" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Formatting / Cell Formatting</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" ShowRibbon="false" EnableContextMenu="true" runat="server">
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
            var xlFormat = this.XLFormat;
            this.setWidthToColumns([150, 140, 140, 168, 110, 110, 127, 130]);
            xlFormat.format({ "style": { "font-weight": "bold", "color": "#4857a6" } }, "A1:A19");
            xlFormat.format({ "style": { "font-family": "Arial" } }, "B1:B13");
            xlFormat.format({ "style": { "font-family": "Times New Roman" } }, "C1:C13");
            xlFormat.format({ "style": { "font-family": "Tahoma" } }, "D1:D13");
            xlFormat.format({ "style": { "font-family": "Verdana" } }, "E1:E13");
            xlFormat.format({ "style": { "font-family": "Calibri" } }, "F1:F13");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "B3");
            xlFormat.format({ "style": { "font-style": "italic" } }, "C3");
            xlFormat.format({ "style": { "color": "#ec2024" } }, "B7");
            xlFormat.format({ "style": { "background-color": "#FFEB9C" } }, "C7");
            xlFormat.format({ "style": { "color": "#006100", "background-color": "#C6EFCE" } }, "D7");
            xlFormat.format({ "style": { "text-decoration": "underline" } }, "B9");
            xlFormat.format({ "style": { "text-decoration": "line-through" } }, "C9");
            xlFormat.format({ "style": { "text-align": "left" } }, "B11");
            xlFormat.format({ "style": { "text-align": "center" } }, "C11");
            xlFormat.format({ "style": { "text-align": "right" } }, "D11");
            xlFormat.format({ "style": { "vertical-align": "top" } }, "B13");
            xlFormat.format({ "style": { "vertical-align": "middle" } }, "C13");
            xlFormat.format({ "style": { "vertical-align": "bottom" } }, "D13");
            xlFormat.format({ "style": { "font-size": "8pt" } }, "B5");
            xlFormat.format({ "style": { "font-size": "11pt" } }, "C5");
            xlFormat.format({ "style": { "font-size": "12pt" } }, "D5");
            xlFormat.format({ "style": { "font-size": "14pt" } }, "E5");
            xlFormat.format({ "style": { "font-size": "16pt" } }, "F5");
			xlFormat.addNewCustomStyle("Arial", { style: { "font-family": "Arial" } });
			xlFormat.addNewCustomStyle("Bold", { style: { "font-weight": "Bold" } });
			xlFormat.addNewCustomStyle("8pt", { style: { "font-size": "8pt" } });
			xlFormat.addNewCustomStyle("Font Color", { style: { color: "#ec2024" } });
			xlFormat.addNewCustomStyle("Underline", { style: { "text-decoration": "underline" } });
			xlFormat.applyCustomCellStyle("Arial", "B17");
			xlFormat.applyCustomCellStyle("Bold", "C17");
			xlFormat.applyCustomCellStyle("8pt", "D17");
			xlFormat.applyCustomCellStyle("Font Color", "E17");
			xlFormat.applyCustomCellStyle("Underline", "F17");
			xlFormat.addNewCustomStyle("currency", { NumFormat: { decimalPlaces: 4, thousandSeparator : false, type : "currency"},
				style: { color: "#333333", "font-family": "Calibri", "font-size": "11pt", "font-style": "normal", "font-weight": "normal", "text-decoration": "none" }
			});
			xlFormat.addNewCustomStyle("percentage", {
				NumFormat: { decimalPlaces: 4, thousandSeparator: false, type: "percentage" },
				style: { color: "#333333", "font-family": "Calibri", "font-size": "11pt", "font-style": "normal", "font-weight": "normal", "text-decoration": "none" }
			});
			xlFormat.addNewCustomStyle("longdate", {
				NumFormat: { type: "longdate" },
				style: { color: "#333333", "font-family": "Calibri", "font-size": "11pt", "font-style": "normal", "font-weight": "normal", "text-decoration": "none" }
			});
			xlFormat.addNewCustomStyle("shortdate", {
				NumFormat: {type: "shortdate" },
				style: { color: "#333333", "font-family": "Calibri", "font-size": "11pt", "font-style": "normal", "font-weight": "normal", "text-decoration": "none" }
			});
			xlFormat.addNewCustomStyle("time", {
				NumFormat: {type: "time" },
				style: { color: "#333333", "font-family": "Calibri", "font-size": "11pt", "font-style": "normal", "font-weight": "normal", "text-decoration": "none" }
			});
			xlFormat.applyCustomCellStyle("currency", "B19");
			xlFormat.applyCustomCellStyle("percentage", "C19");
			xlFormat.applyCustomCellStyle("shortdate", "D19");
			xlFormat.applyCustomCellStyle("longdate", "E19");
			xlFormat.applyCustomCellStyle("time", "F19");
            this.XLResize.setRowHeight(12, 50);
            this.performSelection("A1");
        }

    </script>
</asp:Content>

