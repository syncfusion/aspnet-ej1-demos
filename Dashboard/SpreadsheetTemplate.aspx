﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpreadsheetTemplate.aspx.cs" Inherits="WebSampleBrowser.Dashboard.SpreadsheetTemplate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Essential Studio for ASP.NET  : Spreadsheet Template</title>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta name="description" content="The spreadsheet control is a Microsoft Excel-like control for web. It includes the features of Microsoft Excel like editing, formulas, import, export and more"/>
    <link rel="shortcut icon" href='<%= Page.ResolveClientUrl("~/Content/images/favicon.ico")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/ej.widgets.core.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/flat-lime/ej.theme.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/Spreadsheet/SpreadsheetStyles.css")%>' />
    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsrender.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.globalize.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.validate.min.js")%>'></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.validate.unobtrusive.min.js")%>'></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.web.all.min.js")%>' type="text/javascript"></script>
	<script src='<%= Page.ResolveClientUrl("~/Scripts/ej.webform.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/properties.js")%>' type="text/javascript"></script>
</head>
<body>
    <form id="Form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
		<ej:Spreadsheet ID="Spreadsheet1" EnablePivotTable="true" AllowFormulaBar="false" RowCount ="110" ColumnCount="26" runat="server">
            <ScrollSettings Width="100%" Height="100%" IsResponsive="true" ScrollMode="Normal" />
            <Sheets>
        <ej:Sheet ShowGridlines="false">
            <RangeSettings>
                <ej:RangeSetting StartCell="J19" ShowHeader="true"/>
                <ej:RangeSetting StartCell="J25" ShowHeader="true"/>
            </RangeSettings>

        </ej:Sheet>
    </Sheets>
            <ClientSideEvents OpenFailure="openfailure" ActionComplete="actionComplete" LoadComplete="loadComplete"/>
        </ej:Spreadsheet>
   

    <script type="text/javascript">

        function openfailure(args) {
            this.alert(args.statusText);
        }

        function actionComplete(args) {
            var xlChart = this.XLChart;
            if (args.isDropDownAction) {
                if (args.currValue === "GAS") {
                    this.XLChart.refreshChart("Spreadsheet1_chart1", { range: [{ xRange: "B20:B22", yRange: "E20:E22" }] });
                }
                if (args.currValue === " MAINTANENCE") {
                    this.XLChart.refreshChart("Spreadsheet1_chart1", { range: [{ xRange: "J26:J28", yRange: "L26:L28" }] });
                }
            }
        }
        function loadComplete(args) {
            var xlFormat = this.XLFormat, xlEdit = this.XLEdit, xlChart = this.XLChart, chartRange, values, seriesPoints, fontColor = "#F79E20";
            if (!this.model.isImport) {
			    this.XLRibbon.addNamedRange("startMileage", "=Sheet1!$N$3", "Mileage", 1); 
                xlFormat.createTable({ header: true, name: "Table1", formatName: "TableStyleLight1" }, "B19:H22");
                xlFormat.createTable({ header: true, name: "Table2", formatName: "TableStyleLight1" }, "J19:N21");
                xlFormat.createTable({ header: true, name: "Table3", formatName: "TableStyleLight1" }, "J25:N28");
                this.sheetRename("Vehicle Log Book");
                xlEdit.updateValue('C2', 'VEHICLE');
                xlEdit.updateValue('E2', 'LOG');
                this.mergeCells("C2:D3", true);
                this.mergeCells("E2:F3", true);
                this.setWidthToColumns([22, 85, 105, 126, 66, 66, 71, 56, 20, 86, 126, 80, 76, 160, 170]);
                this.setHeightToRows([20, 48, 30, 20, 22, 20, 23, 20, 20, 30, 43, 20, 20, 26, 43, 20, 20, 42, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32]);
                xlFormat.format({ "style": { "background-color": "#EBEBE7" } }, "A1:Z110");
                xlFormat.format({ "style": { "font-size": "48pt", "color": "#ffffff", "text-align": "center", "background-color": "#F79E20" } }, "C2");
                xlFormat.format({ "style": { "font-size": "48pt", "color": "#ffffff", "text-align": "center", "background-color": "#000000" } }, "E2");
                this.setBorder({ style: "solid", type: "thickbottom", color: "#000000" }, "B4:N4");
                xlEdit.updateValue('N3', '10900');
                xlEdit.updateValue('M2', 'ODOMETER START:');
                xlFormat.format({ "style": { "font-size": "18pt", "color": fontColor, "text-align": "left" } }, "N3");
                xlFormat.format({ "style": { "font-size": "18pt" } }, "M2");
                this.updateData([{ value: 'GAS LOG', value2: 'GAS LOG' }, { value: 'DATE', value2: 'DATE' }, { value: '1/11/2016', value2: '1/11/2016' }, { value: '1/16/2016', value2: '1/16/2016' }, { value: '1/21/2016', value2: '1/21/2016' }], "B18:B22");
                this.updateData([{ value: 'PREV ODOM', value2: 'PREV ODOM' }, { value: 'GALLONS', value2: 'GALLONS' }], "C19:D19");
                this.updateData([{ value: 10, value2: '10' }, { value: 20, value2: '20' }, { value: 10, value2: '10' }], "D20:D22");
                this.updateData([{ value: 'COST', value2: 'COST' }, { value: 156.34, value2: '156.34' }, { value: 60.25, value2: '60.25' }, { value: 51.00, value2: '51.00' }], "E19:E22");
                xlFormat.format({ "type": "currency" }, "E20:E22");
                this.updateData([{ value: 'ODOM', value2: 'ODOM' }, { value: 11200, value2: "11,200" }, { value: 11600, value2: "11,600" }, { value: 11887, value2: '11,887' }], "F19:F22");
                this.updateData([{ value: 'RANGE', value2: 'RANGE' }, { value: 'MPG', value2: 'MPG' }], "G19:H19");
                xlFormat.format({ "style": { "font-size": "12pt", "color": fontColor } }, "B19:N19");
                xlFormat.format({ "style": { "font-size": "18pt" } }, "B18:J18");
                // prevodom value updation
                xlEdit.updateValue('C20', '=startMileage');
                xlEdit.updateValue('C21', '=F20');
                xlEdit.updateValue('C22', '=F21');
                xlEdit.updateValue('G20', '=F20-C20');
                xlEdit.updateValue('G21', '=F21-C21');
                xlEdit.updateValue('G22', '=F22-C22');
                xlEdit.updateValue('H20', '=G20/D20');
                xlEdit.updateValue('H21', '=G21/D21');
                xlEdit.updateValue('H22', '=G22/D22');
                xlEdit.updateValue('J18', 'LOAN PAYMENTS');
                xlEdit.updateValue('J24', 'MAINTENANCE LOG');
                xlFormat.format({ "style": { "font-size": "18pt" } }, "J24");
                xlFormat.format({ "style": { "text-align": "left" } }, "B19:N28");
                xlFormat.format({ "style": { "font-size": "12pt", "color": fontColor } }, "J25:N25");
                xlEdit.updateValue('B6', 'TOTAL MILEAGE');
                xlFormat.format({ "style": { "font-size": "10pt" } }, "B6");
                xlEdit.updateValue('B7', '=SUM(G20:G22)');
                xlFormat.format({ "style": { "font-size": "18pt", "color": fontColor, "text-align": "left" } }, "B7");
                this.mergeCells("B7:C7", true);
                xlEdit.updateValue('D6', 'TOTAL GAS COST');
                xlFormat.format({ "style": { "font-size": "10pt" } }, "D6");
                xlFormat.format({ "type": "currency" }, "D7");
                xlEdit.updateValue('D7', '=SUM(E20:E22)');
                xlFormat.format({ "style": { "font-size": "18pt", "color": fontColor, "text-align": "left" } }, "D7");
                xlEdit.updateValue('B10', 'AVERAGE MPG');
                xlFormat.format({ "style": { "font-size": "10pt" } }, "B10");
                xlEdit.updateValue('B11', '=SUM(H20:H22)');
                xlFormat.format({ "style": { "font-size": "18pt", "color": fontColor, "text-align": "left" } }, "B11");
                this.mergeCells("B11:C11", true);
                this.updateData([{ value: 'TOTAL', value2: 'TOTAL' }, { value: 'MAINTANENCE COST', value2: 'MAINTANENCE COST' }], "D9:D10");
                xlFormat.format({ "style": { "font-size": "10pt" } }, "D9:D10");
                xlEdit.updateValue('D11', '=SUM(L26:L28)');
                xlFormat.format({ "style": { "font-size": "18pt", "color": fontColor, "text-align": "left" } }, "D11");
                xlFormat.format({ "type": "currency" }, "D11");
                this.updateData([{ value: 'TOTAL', value2: 'TOTAL' }, { value: 'GALLONS OF GAS', value2: 'GALLONS OF GAS' }], "B13:B14");
                xlFormat.format({ "style": { "font-size": "10pt" } }, "B13:B14");
                xlEdit.updateValue('B15', '=SUM(D20:D22)');
                xlFormat.format({ "style": { "font-size": "18pt", "color": fontColor, "text-align": "left" } }, "B15");
                this.mergeCells("B15:C15", true);
                this.updateData([{ value: 'TOTAL', value2: 'TOTAL' }, { value: 'LOAN PAYMENTS', value2: 'LOAN PAYMENTS' }], "D13:D14");
                xlFormat.format({ "style": { "font-size": "10pt" } }, "D13:D14");
                xlEdit.updateValue('D15', '=SUM(L20:L21)');
                xlFormat.format({ "style": { "font-size": "18pt", "color": fontColor, "text-align": "left" } }, "D15");
                xlFormat.format({ "type": "currency" }, "D15");
                this.updateData([{ value: 'GRAPH', value2: 'GRAPH' }, { value: 'MAINTANENCE', value2: 'MAINTANENCE' }], "M6:N6");
                xlFormat.format({ "style": { "font-size": "12pt", "color": "#FFFFFF", "text-align": "center", "background-color": fontColor } }, "N6");
                this.XLValidate.applyDVRules("N6", ["list", "GAS, MAINTANENCE"], "list", true, true);
                chartRange = [{ xRange: "J26:J28", yRange: "L26:L28" }];
                values = { series: [{ points: [{ x: "1/5/2013", y: 45 }, { x: "1/18/2013", y: 91 }, { x: "3/1/2013", y: 88 }] }] };
                xlChart.createChart(null, { type: "line", enable3D: false, marker: { visible: false }, series: values.series, legend: { visible: false }, top: 175, left: 712, seriesRange: chartRange });
                this.updateData([{ value: 'GAS', value2: 'GAS' }, { value: 'MAINT', value2: 'MAINT' }, { value: 'LOAN', value2: 'LOAN' }], "A100:A102");
                xlEdit.updateValue('B100', '=SUM(E20:E22)');
                xlEdit.updateValue('B101', '=SUM(L26:L28)');
                xlEdit.updateValue('B102', '=SUM(L20:L21)');
                xlChart.createChart("A99:B102", {
                    "type": "doughnut", enable3D: false, "marker": { visible: true }, top: 168, left: 347, height: 225, width: 261, explode: true,
                    labelPosition: 'inside',
                    doughnutSize: 0.4,
                    enableAnimation: true
                });
                this.XLShape.setPicture('C4', "../Content/images/dashboard_img/vehicle.png", 117, 105, 7, 770);
                $("#Spreadsheet1_picture3").css('border-color', '#EBEBE7');
                $("#Spreadsheet1_chart1").css({ 'border-color': '#EBEBE7', 'background-color': '#EBEBE7' });
                $("#Spreadsheet1_chart2").css({ 'border-color': '#EBEBE7', 'background-color': '#EBEBE7' });
				this.setHeightToRows([{rowIndex: 1, height: 49}]);
				this.hideRow(100, 102);
				this.performSelection("A1");
            }
        }
    </script>
     </form>
</body>
</html>
