<%@ Page Title="Spreadsheet-Sorting and Filtering-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows sorting a columns in either ascending or descending order using  Syncfusion ASP.NET Web Spreadsheet control." CodeBehind="SortFilter.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.SortFilter" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Sorting and Filtering</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" ShowRibbon="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="450" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">

        function loadComplete(args) {
            var xlSort = this.XLSort;
            this.setWidthToColumns([104, 145, 135, 185, 190, 186]);
            this.sheetRename("Sorting and Filtering");
            this.XLFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle", "text-align": "center" } }, "A1:G1");
            xlSort.sortByRange("B2:B15", "B", "ascending");
            xlSort.sortByRange("E2:E15", "E", "descending");
            this.XLFilter.filter("A1:G15");
            this.performSelection("A2");
        }

    </script>
</asp:Content>

