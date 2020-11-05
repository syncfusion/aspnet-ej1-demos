<%@ Page Title="Spreadsheet-Picture-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows how to insert the picture in Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="Picture.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.Picture" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Picture</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" ShowRibbon="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="450" />
            <ImportSettings ImportMapper="SpreadsheetHandler.ashx" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function loadComplete(args) {
            this.XLShape.setPicture('D4', "../Content/images/spreadsheet/ladybug.png", 538, 319);
        }
  </script>
</asp:Content>

