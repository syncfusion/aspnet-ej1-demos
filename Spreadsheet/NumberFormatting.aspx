<%@ Page Title="Spreadsheet-Number Formatting-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows type of your data like currency, Percentage, Time, Short date, long date, Acccounting using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="NumberFormatting.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.NumberFormatting" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Formatting / Number Formatting</span>
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
            this.sheetRename("Number Formatting");
            this.setWidthToColumns([146, 43, 178, 43, 150, 43, 150, 43, 149]);
            xlFormat.format({ "type": "general" }, "I2:I5");
            xlFormat.format({ "type": "number" }, "C2:C5");
            xlFormat.format({ "type": "currency" }, "E2:E5");
            xlFormat.format({ "type": "accounting" }, "G2:G5");
            xlFormat.format({ "type": "percentage" }, "A2:A5");
            xlFormat.format({ "type": "shortdate" }, "A9:A12");
            xlFormat.format({ "type": "longdate" }, "C9:C12");
            xlFormat.format({ "type": "time" }, "E9:E12");
            xlFormat.format({ "type": "scientific" }, "G9:G12");
            xlFormat.format({ "type": "fraction" }, "I9:I12");
            xlFormat.format({ "type": "text" }, "E16:E19");
            xlFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle", "text-align": "center" } }, "A1:K1");
            xlFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle", "text-align": "center" } }, "A8:K8");
            xlFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle", "text-align": "center" } }, "E15");
            xlFormat.format({ "style": { "color": "#FF414f", "font-weight": "bold" } }, "D2:D9");
            xlFormat.format({ "style": { "color": "#F341ff", "font-weight": "bold" } }, "H2:H9");
            this.performSelection("A1");
        }
    </script>
</asp:Content>

