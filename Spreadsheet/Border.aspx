<%@ Page Title="Spreadsheet-Border and Wrap Text-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows cell text wrapping support and cell border support using Syncfusion ASP.NET Web Spreadsheet control." CodeBehind="Border.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.Border" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Formatting / Border and Wrap Text</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" ShowRibbon="false" EnableContextMenu="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="450" />
            <Sheets>
                <ej:Sheet>
                    <RangeSettings>
                        <ej:RangeSetting StartCell="B1" ShowHeader="false" />
                    </RangeSettings>
                </ej:Sheet>
            </Sheets>
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">

        function loadComplete(args) {
            var xlFormat = this.XLFormat, xlEdit = this.XLEdit;
            this.setWidthToColumns([40, 200, 40, 80, 80, 40, 200, 40, 120, 117]);
            xlFormat.format({ "style": { "font-weight": "bold" } }, "B1:B17");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "G1:G17");
            xlFormat.format({ "style": { "font-style": "italic", "font-weight": "bold" } }, "B16");
            this.setBorder({ "type": "left", "color": "#FF5668", "style": "solid" }, "I1");
            this.setBorder({ "type": "bottom", "color": "#FF5668", "style": "solid" }, "D3");
            this.setBorder({ "type": "right", "color": "#FF5668", "style": "solid" }, "D1");
            this.setBorder({ "type": "top", "color": "#FF5668", "style": "solid" }, "I3");
            this.setBorder({ "type": "allborder", "color": "#FF5668", "style": "solid" }, "D5");
            this.setBorder({ "type": "outside", "color": "#FF5668", "style": "dashed" }, "D7");
            this.setBorder({ "type": "thickbox", "color": "#FF5668", "style": "dashed" }, "I7");
            this.setBorder({ "type": "thickbottom", "color": "#FF5668", "style": "dashed" }, "D9");
            this.setBorder({ "type": "topandbottom", "color": "#FF5668", "style": "dashed" }, "I9");
            this.setBorder({ "type": "topandthickbottom", "color": "#FF5668", "style": "dashed" }, "D11");
            this.setBorder({ "type": "allborder", "color": "#2c74d1", "style": "solid" }, "D13:E15");
            this.setBorder({ "type": "outside", "color": "#e851bb", "style": "dashed" }, "I11:J13");
            this.setBorder({ "type": "doublebottom", "color": "#FF5668", "style": "double" }, "D17");
            this.setBorder({ "type": "topanddoublebottom", "color": "#FF5668", "style": "double" }, "I17");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "A19:F19");
            xlEdit.updateValue('G19', "Wrap Text");
            xlFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle" } }, "G19:G19");
            xlEdit.updateValue('I19', "Wrap extra-long text into multiple lines so you can see all of it.");
            this.wrapText("I19:I19");
            this.performSelection("B1");
        }

    </script>
</asp:Content>

