<%@ Page Title="Spreadsheet-Table-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows how to organizes the information into rows and columns using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="Table.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.Table" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Table</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowClipboard="false" AllowUndoRedo="false" AllowConditionalFormats="false"
            AllowHyperlink="false" AllowFormulaBar="false" AllowFormatPainter="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" OpenFailure="openfailure" />
            <ScrollSettings Height="540" />
            <Sheets>
                <ej:Sheet>
                    <RangeSettings>
                        <ej:RangeSetting ShowHeader="false" />
                    </RangeSettings>
                </ej:Sheet>
            </Sheets>
            <ExportSettings AllowExporting="false" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">

        function loadComplete(args) {
            var i, formatObj = [], formatName = ["TableStyleLight8", "TableStyleLight10", "TableStyleLight9", "TableStyleMedium8", "TableStyleDark3", "TableStyleDark2"], xlFormat = this.XLFormat;
            for (i = 0; i < formatName.length; i++)
                formatObj[i] = { "header": true, "name": "Table" + (i + 1), "formatName": formatName[i] };
            this.sheetRename("Format as Table");
            this.setWidthToColumns([103, 133, 112, 123, 123, 115, 112, 115]);
            xlFormat.createTable(formatObj[0], "A1:B4");
            xlFormat.createTable(formatObj[1], "D1:E4");
            xlFormat.createTable(formatObj[2], "G1:H4");
            xlFormat.createTable(formatObj[3], "A8:B11");
            xlFormat.createTable(formatObj[4], "D8:E11");
            xlFormat.createTable(formatObj[5], "G8:H11");
            this.performSelection("A2");
        }

        function openfailure(args) {
            this.alert(args.statusText);
        }

    </script>
</asp:Content>

