<%@ Page Title="PivotChart-Exporting-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot chart control describes exporting pivot chart to Excel, CSV, JPEG, PNG, SVG, GIF, and PDF formats"  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Exporting.aspx.cs" Inherits="WebSampleBrowser.Exporting" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotChart ID="PivotChart1" runat="server" IsResponsive="true" OnServerExcelExporting="PivotChart_ServerExcelExporting" OnServerPDFExporting="PivotChart_ServerPDFExporting" OnServerWordExporting="PivotChart_ServerWordExporting" OnServerImageExporting="PivotChart_ServerImageExporting" ClientIDMode="Static">
        <DataSource>
            <Rows>
                <ej:Field FieldName="Country" FieldCaption="Country"></ej:Field>
                <ej:Field FieldName="State" FieldCaption="State"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Product" FieldCaption="Product"></ej:Field>
            </Columns>
            <Values>
                <ej:Field FieldName="Amount" FieldCaption="Amount"></ej:Field>
                <ej:Field FieldName="Quantity" FieldCaption="Quantity"></ej:Field>
            </Values>
        </DataSource>
        <CommonSeriesOptions Type="Column"  EnableAnimation="True" Tooltip-Visible="true" />
        <ClientSideEvents Load="onLoad"  BeforeExport="Export"/>
        <Size Width="100%" Height="460px"></Size>
        <PrimaryYAxis>
            <Title Text="Amount"></Title>
        </PrimaryYAxis>
		<Zooming EnableScrollbar="true" />
        <Legend RowCount="2"></Legend>
    </ej:PivotChart>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                    <table>
                        <tr>
                            <td class="chkrad">
                                Data Source : 
                            </td>
                            <td class="chkrad">
                                <input type="radio" name="dataSource" id="rdbRelational" checked /><label for="rdbRelational" class="clslab">Relational</label>
                            </td>
                            <td class="chkrad" colspan="2">
                                <input type="radio" name="dataSource" id="rdbOlap" /><label for="rdbOlap" class="clslab">OLAP</label>
                            </td>
                        </tr>
                    </table>
                </div>
            <div class="row" style="margin-top: 5px;">
                <table>
                    <tr>
                        <td class=" chkrad">
                Mode :
                </td>
                <td class="chkrad">
                    <input type="radio" name="dataMode" id="rdbClient" checked /><label for="rdbClient" class="clslab">Client</label>
                </td>
                <td class="chkrad" colspan="2">
                    <input type="radio" name="dataMode" id="rdbServer" /><label for="rdbServer" class="clslab">Server</label>
                </td>
                </tr>
                </table>
            </div>
            <div class="row" style="margin-top: 5px;">            
                <table>
                    <tr>
                        <td class="chkrad">
                            Export Option :
                        </td>
                        <td class="chkrad" colspan="2">
                            <select id="drpdwn">
                                <option value="excel">Excel</option>
                                <option value="word">Word</option>
                                <option value="pdf">PDF</option>
                                <option value="png">PNG</option>
                                <option value="emf">EMF</option>
                                <option value="gif">GIF</option>
                                <option value="jpg">JPG</option>
                                <option value="bmp">BMP</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="row" style="margin-top: 5px;">
                <table>
                    <tr>
                        <td class="chartType" style="width:150px;">
                            Image Format :
                        </td>
                        <td class="excelChart"></td>
                    </tr>
                </table>
            </div>
                 <div class="row" style="margin:20px 0px 10px 20px">
                    <button id="btnExport" value="Export" name="Export" title="Export">Export</button>
                </div> 
            </div> 
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var ddlTarget, chartTarget, rdbRelational, rdbOlap, rdbClient, rdbServer, chartObj;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#rdbRelational,#rdbOlap,#rdbClient,#rdbServer").ejRadioButton({ change: "renderPivotChart" });
            $('#drpdwn').ejDropDownList({ change: "exportType" });
            $('#drpdwn').ejDropDownList({ selectedIndex: 0 });
            $("#btnExport").ejButton({
                roundedCorner: true,
                size: "small",
                click: "ExportBtnClick",
                type: ej.ButtonType.Button
            });
            rdbRelational = $('#rdbRelational').data("ejRadioButton"); rdbOlap = $('#rdbOlap').data("ejRadioButton"); rdbClient = $('#rdbClient').data("ejRadioButton"); rdbServer = $('#rdbServer').data("ejRadioButton");
            chartObj = $('#PivotChart1').data("ejPivotChart");
        });
        function onLoad(args) {
            if (args.model.dataSource.data == null)
                args.model.dataSource.data = pivot_dataset;
            loadTheme(args);
        }
        function Export(args) {
            if (args.exportChartAsImage && $(".chartTypeCheckBox").length > 0 && !$(".chartTypeCheckBox").data("ejCheckBox").model.checked)
                args.exportChartAsImage = false;
        }
        function exportType(args) {
            if (args.text == "Excel") {
                if ($(".chartTypeCheckBox").length > 0)
                    $(".chartTypeCheckBox").ejCheckBox("enable");
                else {
                    var checkBox = ej.buildTag("div.chartTypeCheckBox")[0].outerHTML;
                    $(".excelChart").append($(checkBox));
                    $(".chartTypeCheckBox").ejCheckBox({ checked: true, size: "small" });
                }
            }
            else
                $(".chartTypeCheckBox").ejCheckBox("disable");
        }
        function ExportBtnClick(args) {
            var dropDownObj = $('#drpdwn').data("ejDropDownList");
            var exportOption = dropDownObj.model.value;
            var mode = chartObj.model.operationalMode;
            chartObj.model.operationalMode = ej.PivotChart.OperationalMode.ClientMode;
            if (chartObj.model.serverEvents == null) {
                chartObj.model.uniqueId = "ctl00$ctl00$LayoutSection$ControlsSection$PivotChart1";
                chartObj.model.serverEvents = ["excelExport", "pdfExport", "wordExport", "imageExport"];
            }
            switch (exportOption) {
                case "excel":
                    chartObj.exportPivotChart("excelExport", "Sample", ej.PivotChart.ExportOptions.Excel);
                    break;
                case "word":
                    chartObj.exportPivotChart("wordExport", "Sample",ej.PivotChart.ExportOptions.Word);
                    break;
                case "pdf":
                    chartObj.exportPivotChart("pdfExport", "Sample", ej.PivotChart.ExportOptions.PDF);
                    break;
                case "png":
                    chartObj.exportPivotChart("imageExport", "Sample", ej.PivotChart.ExportOptions.PNG);
                    break;
                case "emf":
                    chartObj.exportPivotChart("imageExport", "Sample", ej.PivotChart.ExportOptions.EMF);
                    break;
                case "gif":
                    chartObj.exportPivotChart("imageExport", "Sample", ej.PivotChart.ExportOptions.GIF);
                    break;
                case "jpg":
                    chartObj.exportPivotChart("imageExport", "Sample", ej.PivotChart.ExportOptions.JPG);
                    break;
                case "bmp":
                    chartObj.exportPivotChart("imageExport", "Sample", ej.PivotChart.ExportOptions.BMP);
                    break;
            }
            chartObj.model.operationalMode = mode;
            //For Exporting in Server Mode
            //chartObj.exportPivotChart(ej.PivotChart.ExportOptions.Excel);
        }
        function renderPivotChart(args) {
            $(".e-pivotchart").remove();
            var chartPanel = ej.buildTag("div#PivotChart1", "", { "float": "left" })[0].outerHTML;
            $(chartPanel).appendTo(".cols-sample-area");
            if (rdbClient.model.checked) {
                var pivotdataSource = { data: pivot_dataset, cube: "", rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }, { fieldName: "Date", fieldCaption: "Date" }], columns: [{ fieldName: "Product", fieldCaption: "Product" }], values: [{ fieldName: "Amount", fieldCaption: "Amount" }], filters: [] };
                var olapDataSource = { data: "//bi.syncfusion.com/olap/msmdpump.dll", catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works", rows: [{ fieldName: "[Date].[Fiscal]" }], columns: [{ fieldName: "[Customer].[Customer Geography]" }], values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }], filters: [] };
                $("#PivotChart1").ejPivotChart({
                    beforeExport:"Export",
                    dataSource: rdbRelational.model.checked ? pivotdataSource : olapDataSource,
                    enableAnimation: true, isResponsive: true,zooming : { enableScrollbar : true},
                    type: ej.PivotChart.ChartTypes.Column, tooltip: { visible: true },
                    size: { height: "460px", width: "100%" }, legend: { visible: true },
                    load: "loadTheme"
                });
            }
            else {
                $("#PivotChart1").ejPivotChart({
                    beforeExport:"Export",
                    url: rdbRelational.model.checked ? "../api/RelationalChart" : "../api/OLAPChart",
                    enableAnimation: true, isResponsive: true,zooming : { enableScrollbar : true},
                    type: ej.PivotChart.ChartTypes.Column, tooltip: { visible: true },
                    size: { height: "460px", width: "100%" }, legend: { visible: true },
                    load: "loadTheme"
                });
            }
            chartObj = $('#PivotChart1').data("ejPivotChart");
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotChart1
        {
            min-height: 275px; 
            min-width: 525px; 
            height: 460px; 
            width: 100%;
            float:left;
        }
         .row .cols-sample-area{
            width:100%;
        }
       .cols-prop-area .content {
            width: auto;
        }
        .row .cols-prop-area {
            min-height: 210px;
            width: auto;
        }
        #btnExport{
            margin-left:170px;
        }
    </style>
</asp:Content>

