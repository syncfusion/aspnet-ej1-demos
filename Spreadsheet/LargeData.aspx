<%@ Page Title="Spreadsheet-Large Data-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows how to import the large data using Syncfusion ASP.NET web Spreadsheet control" CodeBehind="LargeData.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.LargeData" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Large Data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" ColumnWidth="100" AllowFormulaBar="false" ShowRibbon="false" runat="server">
            <ScrollSettings Height="470" />
            <ImportSettings ImportUrl="https://js.syncfusion.com/demos/ejservices/data/Spreadsheet/LargeData.xlsx"
                ImportMapper="SpreadsheetHandler.ashx" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

