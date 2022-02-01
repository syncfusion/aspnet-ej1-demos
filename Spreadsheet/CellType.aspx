<%@ Page Title="Spreadsheet-Cell Type-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows how to insert the Buttons, Datepicker,Checkbox,DropDown list in Syncfusion ASP.NET Web Spreadsheet control." CodeBehind="CellType.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.CellType" %>

<%@ Register assembly="Syncfusion.EJ" namespace="Syncfusion.JavaScript.Models" tagprefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Cell Type</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        </div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowCellType="true" AllowFormulaBar="false" EnableContextMenu="false" OnServerExcelExporting="Spreadsheet_ServerExcelExporting" OnServerCsvExporting="Spreadsheet_ServerCsvExporting" OnServerPdfExporting="Spreadsheet_ServerPdfExporting" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="450" />
            <Sheets>
                <ej:Sheet>
                    <RangeSettings>
                        <ej:RangeSetting StartCell="A1" />
                    </RangeSettings>
                    <CellTypes>
                        <ej:CellType Range="F5">
                            <Settings Type="Button" BackgroundColor="yellow" Color="black" Text="BUTTON" />
                        </ej:CellType>
                        <ej:CellType Range="F7">
                            <Settings Type="CheckBox" IsChecked="true" />
                        </ej:CellType>
                        <ej:CellType Range="F9">
                            <Settings Type="DatePicker" />
                        </ej:CellType>
                        <ej:CellType Range="F3">
                            <Settings Type="DropDownList" DataSourceRange="A2:A11" />
                        </ej:CellType>
                        <ej:CellType Range="H5">
                            <Settings Type="Button" Text="BUTTON" Color="brown" />
                        </ej:CellType>
                        <ej:CellType Range="H7">
                            <Settings Type="CheckBox" />
                        </ej:CellType>
                        <ej:CellType Range="H9">
                            <Settings Type="DatePicker" Value="2/12/2016" />
                        </ej:CellType>
                        <ej:CellType Range="H3">
                            <Settings Type="DropDownList" DataSourceRange="B2:B11" />
                        </ej:CellType>
                    </CellTypes>
                </ej:Sheet>
            </Sheets>
            <ImportSettings ImportMapper="SpreadsheetHandler.ashx" />
        </ej:Spreadsheet>
    <div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">

        function loadComplete(args) {
            var xlFormat = this.XLFormat, xlEdit = this.XLEdit;
            if (!this.model.isImport) {
                this.sheetRename("Cell Type");
                this.setWidthToColumns([133, 93, 59, 59, 122, 142, 92, 142, 82]);
                this.XLResize.setRowHeight(4, 27);
                xlEdit.updateValue('E3', 'DropDown List');
                xlEdit.updateValue('E5', 'Button');
                xlEdit.updateValue('E7', 'Check Box');
                xlEdit.updateValue('E9', 'Date Picker');
                this.XLFormat.format({ "style": { "font-weight": "bold" } }, "A1:C1");
                this.XLFormat.format({ "style": { "font-weight": "bold" } }, "E3:E9");
                this.XLFormat.format({ "style": { "text-align": "left" } }, "H7");
                this.mergeCells("E1:H1", true);
                xlEdit.updateValue('E1', 'CELL TYPES');
                this.XLFormat.format({ "style": { "font-weight": "bold", 'text-align': 'center' } }, "E1");
                $("#<%= FlatSpreadsheet.ClientID %>" + "_Ribbon").ejRibbon('instance').collapse();
            }
        }

    </script>
</asp:Content>

