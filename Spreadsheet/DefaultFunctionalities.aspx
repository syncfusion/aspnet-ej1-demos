<%@ Page Title="Spreadsheet-Default-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MetaDescription="This demo shows default Functionalities of Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="DefaultFunctionalities.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.SpreadsheetASP.DefaultFunctionalities" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" OnServerExcelExporting="Spreadsheet_ServerExcelExporting" OnServerCsvExporting="Spreadsheet_ServerCsvExporting" OnServerPdfExporting="Spreadsheet_ServerPdfExporting"  runat="server">
            <ClientSideEvents LoadComplete="loadComplete" OpenFailure="openfailure" />
            <ScrollSettings Height="540"/>
            <ImportSettings ImportMapper="SpreadsheetHandler.ashx" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function loadComplete(args) {
            var xlFormat = this.XLFormat;
            if (!this.model.isImport) {
                this.setWidthToColumns([142, 132, 110, 105, 102, 112, 122, 122, 102]);
                xlFormat.format({ "style": { "font-weight": "bold" } }, "A1:H1");
                xlFormat.format({ "type": "currency" }, "E2:H11");
                this.XLRibbon.updateRibbonIcons();
            }
        }
        function openfailure(args) {
            this.alert(args.statusText);
        }
    </script>
</asp:Content>

