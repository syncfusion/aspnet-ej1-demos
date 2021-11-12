<%@ Page Title="Spreadsheet-Data Validation-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows how to restrict the users to enter the valid data in a range using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="DataValidation.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.DataValidation" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Data Validation</span>
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
            var values, xlFormat = this.XLFormat, xlValidate = this.XLValidate;
            this.setWidthToColumns([122, 42, 212, 42, 162, 42, 89, 42, 192, 42, 202]);
            xlFormat.format({ "style": { "font-weight": "bold", "text-align": "center" } }, "A1:K1");
            xlFormat.format({ "type": "currency" }, "E2:E15");
            this.sheetRename("Data Validation");
            values = ["Greater", "6", ""];
            xlValidate.applyDVRules("A2:A15", values, "number", true, true);
            xlValidate.highlightInvalidData("A2:A15");
            values = ["LessOrEqual", "35", ""];
            xlValidate.applyDVRules("C2:C15", values, "text", true, true);
            xlValidate.highlightInvalidData("C2:C15");
            values = ["Between", "150", "200"];
            xlValidate.applyDVRules("E2:E15", values, "decimal", true, true);
            xlValidate.highlightInvalidData("E2:E15");
            values = ["list", "=A4:A10", ""];
            xlValidate.applyDVRules("G2:G15", values, "list", true, true);
            xlValidate.highlightInvalidData("G2:G15");
            values = ["Greater", "07/09/2014", ""];
            xlValidate.applyDVRules("I2:I15", values, "date", true, true);
            xlValidate.highlightInvalidData("I2:I15");
            values = ["GreaterOrEqual", "11:23:23", ""];
            xlValidate.applyDVRules("K2:K15", values, "time", true, true);
            xlValidate.highlightInvalidData("K2:K15");
            this.performSelection("A2");
        }
    </script>
</asp:Content>

