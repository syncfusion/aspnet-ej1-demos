<%@ Page Title="Spreadsheet-Context Menu-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows the default functionality of the context menu using Syncfusion ASP.NET Web Spreadsheet control." CodeBehind="ContextMenu.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.ContextMenu" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Context Menu</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" OnServerExcelExporting="Spreadsheet_ServerExcelExporting" OnServerCsvExporting="Spreadsheet_ServerCsvExporting" OnServerPdfExporting="Spreadsheet_ServerPdfExporting" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" OpenFailure="openfailure" />
            <ScrollSettings Height="540" />
            <ImportSettings ImportMapper="SpreadsheetHandler.ashx" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">

        function loadComplete(args) {            
            if (!this.model.isImport) {
                this.setWidthToColumns([80, 62, 63]);
                this.XLFormat.format({ "style": { "font-weight": "bold" } }, "A1:C1");
                this.XLChart.createChart("A1:B8", { type: "line", enable3D: false, marker: { visible: true }, top: 60, left: 300 });
            }
        }

        function openfailure(args) {
            this.alert(args.statusText);
        }

    </script>
</asp:Content>

