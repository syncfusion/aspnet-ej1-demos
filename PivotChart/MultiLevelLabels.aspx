<%@ Page Title="PivotChart-Multi-level Labels-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot chart control describes the grouping label or multilevel label for drill-down and drill-up options." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MultiLevelLabels.aspx.cs" Inherits="WebSampleBrowser.MultiLevelLabels" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotChart ID="PivotChart1" runat="server" IsResponsive="true" EnableMultiLevelLabels="true" ClientIDMode="Static">
        <DataSource>
            <Rows>
                <ej:Field FieldName="Country" FieldCaption="Country"></ej:Field>
                <ej:Field FieldName="State" FieldCaption="State"></ej:Field>
                <ej:Field FieldName="Date" FieldCaption="Date"></ej:Field>
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
        <ClientSideEvents Load="onLoad" />
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
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var ddlTarget, chartTarget, rdbRelational, rdbOlap, rdbClient, rdbServer, chartObj;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#rdbRelational,#rdbOlap,#rdbClient,#rdbServer").ejRadioButton({ change: "renderPivotChart" });           
            rdbRelational = $('#rdbRelational').data("ejRadioButton"); rdbOlap = $('#rdbOlap').data("ejRadioButton"); rdbClient = $('#rdbClient').data("ejRadioButton"); rdbServer = $('#rdbServer').data("ejRadioButton");
            chartObj = $('#PivotChart1').data("ejPivotChart");
        });
        function onLoad(args) {
            if (args.model.dataSource.data == null)
                args.model.dataSource.data = pivot_dataset;
            loadTheme(args);
        }       
        function renderPivotChart(args) {
            $(".e-pivotchart").remove();
            var chartPanel = ej.buildTag("div#PivotChart1", "", { "float": "left" })[0].outerHTML;
            $(chartPanel).appendTo(".cols-sample-area");
            if (rdbClient.model.checked) {
                var pivotdataSource = { data: pivot_dataset, cube: "", rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }, { fieldName: "Date", fieldCaption: "Date" }], columns: [{ fieldName: "Product", fieldCaption: "Product" }], values: [{ fieldName: "Amount", fieldCaption: "Amount" }], filters: [] };
                var olapDataSource = { data: "//bi.syncfusion.com/olap/msmdpump.dll", catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works", rows: [{ fieldName: "[Date].[Fiscal]" }], columns: [{ fieldName: "[Customer].[Customer Geography]" }], values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }], filters: [] };
                $("#PivotChart1").ejPivotChart({
                    dataSource: rdbRelational.model.checked ? pivotdataSource : olapDataSource, enableMultiLevelLabels: true,
                    isResponsive: true, zooming: { enableScrollbar: true },
                    type: ej.PivotChart.ChartTypes.Column,
                    commonSeriesOptions: {
                        enableAnimation: true,
                        type: ej.PivotChart.ChartTypes.Column, tooltip: { visible: true }
                    },
                    size: { height: "460px", width: "100%" }, legend: { visible: true },
                    load: "loadTheme"
                });
            }
            else {
                $("#PivotChart1").ejPivotChart({
                    url: rdbRelational.model.checked ? "../api/RelationalChart" : "../api/OLAPChart",
                    isResponsive: true, zooming: { enableScrollbar: true }, enableMultiLevelLabels: true,
                    type: ej.PivotChart.ChartTypes.Column,
                    commonSeriesOptions: {
                        enableAnimation: true,
                        type: ej.PivotChart.ChartTypes.Column, tooltip: { visible: true }
                    },
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
            min-height: 130px;
            width: auto;
        }
        #btnExport{
            margin-left:170px;
        }
    </style>
</asp:Content>

