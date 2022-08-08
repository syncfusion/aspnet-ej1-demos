<%@ Page Title="Spreadsheet-Chart-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows a graphical representation of data using Syncfusion ASP.NET Web Spreadsheet control" CodeBehind="Chart.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.Chart" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Chart</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" SheetCount="9" RowCount="32" AllowFormulaBar="false" ShowRibbon="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" ActionBegin="actionBegin" />
            <ScrollSettings Height="450" />
            <Sheets>
                <ej:Sheet SheetName="2D Column">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="A1" />
                    </RangeSettings>
                </ej:Sheet>
                <ej:Sheet SheetName="3D Column">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="A1" />
                    </RangeSettings>
                </ej:Sheet>
                <ej:Sheet SheetName="2D Bar">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="A1" />
                    </RangeSettings>
                </ej:Sheet>
                <ej:Sheet SheetName="3D Bar">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="A1" />
                    </RangeSettings>
                </ej:Sheet>
                <ej:Sheet SheetName="Radar">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="A1" />
                    </RangeSettings>
                </ej:Sheet>
                <ej:Sheet SheetName="Line">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="A1" />
                    </RangeSettings>
                </ej:Sheet>
                <ej:Sheet SheetName="Area">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="A1" />
                    </RangeSettings>
                </ej:Sheet>
                <ej:Sheet SheetName="Pie">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="A1" />
                    </RangeSettings>
                </ej:Sheet>
                <ej:Sheet SheetName="Scatter">
                    <RangeSettings>
                        <ej:RangeSetting StartCell="A1" />
                    </RangeSettings>
                </ej:Sheet>
            </Sheets>
            <PageSettings PageCount="9" />
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">

        function loadComplete(args) {
            var offsetTop, xlFormat = this.XLFormat, xlEdit = this.XLEdit, xlChart = this.XLChart;;
            this.setWidthToColumns([{ colIndex: 0, width: 90 }, { colIndex: 1, width: 85 }, { colIndex: 2, width: 100 }, { colIndex: 11, width: 70 }]);
            this.mergeCells("F16:G16", true);
            xlEdit.updateValue('F16', "2D Column");
            xlFormat.format({ "type": "currency" }, "B2:B21");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "F16:F16");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "A1:C1");
            xlChart.createChart("A1:B6", { type: "column", enable3D: false, marker: false, top: 40, left: 260, width: 340, height: 250 });
            this.gotoPage(2, false);
            this.setWidthToColumns([{ colIndex: 0, width: 90 }, { colIndex: 1, width: 85 }, { colIndex: 2, width: 100 }, { colIndex: 11, width: 70 }]);
            this.mergeCells("F16:H16", true);
            xlEdit.updateValue('F16', "3D Column");
            xlFormat.format({ "type": "currency" }, "B2:B21");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "F16:F16");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "A1:C1");
            xlChart.createChart("A1:B6", { type: "column", enable3D: true, marker: { visible: false }, top: 40, left: 260, width: 340, height: 250 });
            this.gotoPage(3, false);
            this.setWidthToColumns([{ colIndex: 0, width: 90 }, { colIndex: 1, width: 85 }, { colIndex: 2, width: 100 }, { colIndex: 11, width: 70 }]);
            this.mergeCells("F16:G16", true);
            xlEdit.updateValue('F16', "2D Bar");
            xlFormat.format({ "type": "currency" }, "B2:B21");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "F16:F16");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "A1:C1");
            xlChart.createChart("A1:B6", { type: "bar", enable3D: false, marker: { visible: false }, top: 40, left: 260, width: 340, height: 250 });
            this.gotoPage(4, false);
            this.setWidthToColumns([{ colIndex: 0, width: 90 }, { colIndex: 1, width: 85 }, { colIndex: 2, width: 100 }, { colIndex: 11, width: 70 }]);
            this.mergeCells("F16:G16", true);
            xlEdit.updateValue('F16', "3D Bar");
            xlFormat.format({ "type": "currency" }, "B2:B21");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "F16:F16");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "A1:C1");
            xlChart.createChart("A1:B6", { type: "bar", enable3D: true, marker: { visible: false }, top: 40, left: 260, width: 340, height: 250 });
            this.performSelection("A1");
            this.gotoPage(5, false);
            this.setWidthToColumns([{ colIndex: 0, width: 90 }, { colIndex: 1, width: 85 }, { colIndex: 2, width: 100 }, { colIndex: 11, width: 70 }]);
            this.mergeCells("F16:G16", true);
            xlEdit.updateValue('F16', "Radar with Markers");
            xlFormat.format({ "type": "currency" }, "B2:B21");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "F16:F16");
            xlFormat.format({ "style": { "font-weight": "bold", "font-size": "12px" } }, "A1:C1");
            xlChart.createChart("A1:B6", { type: "radar", enable3D: false, marker: { visible: true }, top: 40, left: 260, width: 340, height: 250 });
            this.gotoPage(6, false);
            this.setWidthToColumns([{ colIndex: 0, width: 90 }, { colIndex: 1, width: 85 }, { colIndex: 2, width: 100 }, { colIndex: 11, width: 70 }]);
            this.mergeCells("F16:G16", true);
            xlEdit.updateValue('F16', "Line with Markers");
            xlFormat.format({ "type": "currency" }, "B2:B21");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "F16:F16");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "A1:C1");
            xlChart.createChart("A1:B6", { type: "line", enable3D: false, marker: { visible: true }, top: 40, left: 260, width: 340, height: 250 });
            this.gotoPage(7, false);
            this.setWidthToColumns([{ colIndex: 0, width: 90 }, { colIndex: 1, width: 85 }, { colIndex: 2, width: 100 }, { colIndex: 7, width: 90 }, { colIndex: 11, width: 70 }]);
            this.mergeCells("F16:G16", true);
            xlEdit.updateValue('F16', "2D Area");
            xlFormat.format({ "type": "currency" }, "B2:B21");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "F16:F16");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "A1:C1");
            offsetTop = (ej.browserInfo.name === "mozilla") ? 341 : 325;
            xlChart.createChart("A1:B6", { type: "Area", enable3D: false, marker: { visible: false }, top: 40, left: 260, width: 340, height: 250 });
            this.gotoPage(8, false);
            this.setWidthToColumns([{ colIndex: 0, width: 90 }, { colIndex: 1, width: 85 }, { colIndex: 2, width: 100 }, { colIndex: 7, width: 90 }, { colIndex: 11, width: 70 }]);
            this.mergeCells("F16:G16", true);
            xlEdit.updateValue('F16', "3D Pie");
            xlFormat.format({ "type": "currency" }, "B2:B21");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "F16:F16");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "A1:C1");
            xlChart.createChart("A1:C6", { type: "pie", enable3D: true, marker: { visible: false }, top: 40, left: 260, width: 360, height: 250 });
            this.gotoPage(9, false);
            this.setWidthToColumns([90, 85, 100]);
            this.mergeCells("F16:G16", true);
            xlEdit.updateValue('F16', "Scatter");
            xlFormat.format({ "type": "currency" }, "B2:B21");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "F16:F16");
            xlFormat.format({ "style": { "font-weight": "bold" } }, "A1:C1");
            xlChart.createChart("A1:B6", { type: "scatter", enable3D: false, marker: { visible: false }, top: 40, left: 260, width: 340, height: 250 });
            this.gotoPage(1, false);
            this.performSelection("A1");
            this.setSheetFocus();
        }

        function actionBegin(args) {
            if (args.reqType === "gotoSheet" && !args.newSheet) {
                var charts, len, i = 0;
                charts = this.getSheetElement(args.gotoIndex).find(".e-datavisualization-chart");
                len = charts.length;
                while (i < len) {
                    $(charts[i]).ejChart("redraw");
                    i++;
                }
            }
        }

    </script>
</asp:Content>

