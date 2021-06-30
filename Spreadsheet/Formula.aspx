<%@ Page Title="Spreadsheet-Formula-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows the calculation of the data in sheets using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="Formula.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.Formula" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Formula</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" ShowRibbon="false" EnableContextMenu="false" runat="server">
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
            var xlFormat = this.XLFormat, xlEdit = this.XLEdit;
            this.setWidthToColumns([187, 107, 42, 147, 98, 42, 114, 62, 74, 72]);
            this.XLSelection.selectRange("A1");
            xlFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle", "text-align": "center" } }, "A1:F1");
            xlFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle", "text-align": "center" } }, "A9:F9");
            xlFormat.format({ "style": { "font-weight": "bold", "vertical-align": "middle", "text-align": "center" } }, "G1:J1");
            //String Function
            xlEdit.updateValue("B2", '=CONCATENATE("one","big")');
            xlEdit.updateValue("B3", '=LOWER(G2)');
            xlEdit.updateValue("B4", '=UPPER(G3)');
            xlEdit.updateValue("B5", '=FIND("E","SPREAD")');
            xlEdit.updateValue("B6", '=REPLACE(H3,3,2,"10")');
            //Date time function
            xlEdit.updateValue("E2", '=CELL("address", H2)');
            xlEdit.updateValue("E3", '=ISBLANK(F2)');
            xlEdit.updateValue("E4", '=ISERROR(J4)');
            xlEdit.updateValue("E5", '=ISNUMBER(H5)');
            xlEdit.updateValue("E6", '=TYPE(H2)');
            //Math function
            xlEdit.updateValue("B10", '=SQRT(25)');
            xlEdit.updateValue("B11", '=AVERAGE(J3:J7)');
            xlEdit.updateValue("B12", '=SUM(H3:H7)');
            xlEdit.updateValue("B13", '=PRODUCT(H4,H5)');
            //Statistical and Logical
            xlEdit.updateValue("E10", '=AND(TRUE,FALSE)');
            xlEdit.updateValue("E11", '=SUMIF(J2:J13, 3)');
            xlEdit.updateValue("E12", '=MAX(I2:I6)');
            xlEdit.updateValue("E13", '=MIN(J2:J6)');
            this.lockCells("A2:A6", true);
            this.lockCells("D2:D6", true);
            this.lockCells("A10:A13", true);
            this.lockCells("D10:D13", true);
            this.protectSheet(true);
            xlFormat.format({ "style": { "text-align": "left" } }, "A2:A5");
            xlFormat.format({ "style": { "text-align": "left" } }, "D2:D2");
            xlFormat.format({ "style": { "text-align": "left" } }, "A10:A12");
            xlFormat.format({ "style": { "text-align": "left" } }, "D10:D13");
            xlFormat.format({ "type": "currency" }, "I2:I13");
            xlFormat.format({ "type": "currency" }, "J2:J13");
        }
      </script>
</asp:Content>

