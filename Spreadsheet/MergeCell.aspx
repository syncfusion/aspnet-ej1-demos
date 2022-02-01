<%@ Page Title="Spreadsheet-Merge Cell-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows two or more individual cells together using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="MergeCell.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.MergeCell" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Merge Cell</span>
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
            var xlFormat = this.XLFormat;
            this.sheetRename("Merge Cells");
            this.setWidthToColumns([214, 160, 152, 132, 134, 153]);
            this.mergeCells("B1:B2", true);
            this.mergeCells("E1:E2", true);
            this.mergeCells("F1:F2", true);
            this.mergeAcrossCells("C1:D1", true);
            this.mergeCells("B5:B7", true);
            this.mergeCells("B10:B11", true);
            this.mergeCells("F3:F4", true);
            this.mergeCells("F8:F9", true);
            this.mergeCells("A1:A2", true);
            xlFormat.format({ "type": "currency" }, "C3:D13");
            xlFormat.format({ "style": { "font-weight": "bold", "text-align": "center", "vertical-align": "middle" } }, "A1:F2");
            xlFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle" } }, "A13:E13");
            xlFormat.format({ "type": "percentage" }, "E3:E13");
        }
    </script>
</asp:Content>


