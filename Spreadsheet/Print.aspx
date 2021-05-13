<%@ Page Title="Spreadsheet-Print and Gridlines-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows print the entire spreadsheet or only selected data using Syncfusion ASP.NET Web Spreadsheet control." CodeBehind="Print.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.Print" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Print and Gridlines</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" ShowRibbon="false" EnableContextMenu="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="450" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    <ej:Button ID="button_large" runat="server" ClientSideOnClick="btnClick" Type="Button" Text="Print" ShowRoundedCorner="true" Size="Small" Width="105px">
                </ej:Button>
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton ID="gridlines" Size="Small" ShowRoundedCorner="true" DefaultText="Hide Gridlines" ActiveText="Show Gridlines" Width="105" ClientSideOnChange="tglebtnChange" runat="server"></ej:ToggleButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function loadComplete(args) {
            var xlFormat = this.XLFormat;
            this.setWidthToColumns([175, 194, 114, 180]);
            this.sheetRename("Print and Gridlines");
            xlFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle", "text-align": "center" } }, "A1:G1");
            xlFormat.format({ "style": { "text-align": "left" } }, "E2:E21");
            xlFormat.format({ "style": { "text-align": "left" } }, "D2:D199");
            xlFormat.format({ "style": { "text-align": "left" } }, "D2:D199");
            this.performSelection("A1");
        }
        function tglebtnChange(e) {
            var xlObj = $('#<%= FlatSpreadsheet.ClientID %>').data("ejSpreadsheet");
            xlObj.option({sheets: [{ "showGridlines": !e.isChecked, "printGridlines": !e.isChecked }]});
        }
        function btnClick(e) {
            var xlObj = $('#<%= FlatSpreadsheet.ClientID %>').data("ejSpreadsheet");
            xlObj.XLPrint.printSheet();
        }
    </script>
</asp:Content>

