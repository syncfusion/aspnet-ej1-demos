<%@ Page Title="Spreadsheet-Movie List-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows how to set the picture and filter using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="MLTemplate.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.MLTemplate" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Movie List</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" ShowRibbon="false" AllowFormulaBar="false" EnableContextMenu="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="540" />
            <Sheets>
                <ej:Sheet ShowGridlines="false">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="B3" ShowHeader="false" />
                    </RangeSettings>
                </ej:Sheet>
            </Sheets>
            <ImportSettings ImportMapper="SpreadsheetHandler.ashx" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function loadComplete(args) {
            this.setWidthToColumns([32, 57, 63, 120, 80, 215, 90, 98, 80, 85, 323]);
            this.XLFormat.format({ "style": { "background-color": "#000000", "color": "#FFFFFF", "font-size": "8pt" } }, "A1:V40");
            this.XLFormat.format({ "style": { "background-color": "#ffcb0d" } }, "A1:K1");
            this.XLFormat.format({ "style": { "background-color": "#ffcb0d", "font-size": "9pt", color: "#000000", "font-weight": "bold" } }, "B3:K3");
            this.XLShape.setPicture('A1', "../Content/images/spreadsheet/mv.png", 1275, 160);
            this.setHeightToRows([162, 25, 25, 35, 35, 35, 35]);
            this.XLFilter.filter("B3:K7");
            this.XLFormat.format({ "style": { "background-color": "#262626" } }, "B5:K5");
            this.XLFormat.format({ "style": { "background-color": "#262626" } }, "B7:K7");
            this.XLFormat.format({ "style": { "text-align": "left" } }, "B4:C7");
            this.XLFormat.format({ "style": { "vertical-align": "middle" } }, "B4:K7");
            $("#<%= FlatSpreadsheet.ClientID %>" + "_picture1").css("background-color", "transparent");
        }
    </script>
</asp:Content>

