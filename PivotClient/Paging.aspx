<%@ Page Title="PivotClient-Paging-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot client control describes how to load large records with paging to improve performance."  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Paging.aspx.cs" Inherits="WebSampleBrowser.Paging" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <div class="control">
        <ej:PivotClient ID="PivotClient" runat="server" OnServerExporting="PivotClient_ServerExporting" Title="OLAP Browser" EnableVirtualScrolling="true" ClientIDMode="Static">
            <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll">
                <Rows>
                    <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
                </Rows>
                <Columns>
                    <ej:Field FieldName="[Date].[Date]"></ej:Field>
                </Columns>
                <Values>
                    <ej:Field Axis="Column">
                        <Measures>
                            <ej:MeasuresItems FieldName="[Measures].[Internet Sales Amount]" />
                        </Measures>
                    </ej:Field>
                </Values>
                <PagerOptions CategoricalPageSize="3" SeriesPageSize="3" CategoricalCurrentPage="1" SeriesCurrentPage="1" />
            </DataSource>
            <ClientSideEvents RenderSuccess="setChartProperties" BeforeExport="Exporting" SaveReport="reportSettings" LoadReport="reportSettings" FetchReport="reportSettings"/>
        </ej:PivotClient>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <table>
                    <tr>
                        <td class=" chkrad">Mode :
                        </td>
                        <td class="chkrad">
                            <input type="radio" name="dataMode" id="rdbClient" checked /><label for="rdbClient" class="radioBtnLabel">Client</label>
                        </td>
                        <td class="chkrad" colspan="2">
                            <input type="radio" name="dataMode" id="rdbServer" /><label for="rdbServer" class="radioBtnLabel">Server</label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="row" style="margin-top: 5px;">
                <table>
                    <tr>
                        <td class="chkrad">Paging Type :
                        </td>
                        <td class="chkrad">
                            <input type="radio" name="type" id="vScrolling" checked="checked" /><label for="vScrolling" class="radioBtnLabel">Virtual Scrolling</label>
                        </td>
                        <td class="chkrad" colspan="2">
                            <input type="radio" name="type" id="paging" /><label for="paging" class="radioBtnLabel">Paging</label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotClient1 {
            min-height: 275px;
            min-width: 950px;
            float: left;
            margin-left: -16px;
        }

        .radioBtnLabel {
            margin-left: 5px;
        }

        .row .cols-sample-area {
            min-width:1063px;
            width: 100%;
			overflow: auto;
        }

        .cols-prop-area .content {
            width: auto;
        }

        .row .cols-prop-area {
            min-height: 170px;
            width: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var ddlTarget, chartTarget, vScrolling, paging, rdbClient, rdbServer, pGridObj;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#vScrolling,#paging,#rdbClient,#rdbServer").ejRadioButton({ change: "renderPivotClient" });
            vScrolling = $('#vScrolling').data("ejRadioButton");
            paging = $('#paging').data("ejRadioButton"); rdbClient = $('#rdbClient').data("ejRadioButton");
            rdbServer = $('#rdbServer').data("ejRadioButton");
        });
        function renderPivotClient(args) {
            $(".e-pivotclient").remove();
            var clientData = "";
            if (rdbClient.model.checked) {
                clientData = {
                    data: "//bi.syncfusion.com/olap/msmdpump.dll",
                    catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works",
                    columns: [{ fieldName: "[Customer].[Customer Geography]" }], rows: [{ fieldName: "[Date].[Date]" }],
                    values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }],
                    filters: [],
                    pagerOptions: {
                        categoricalPageSize: 3,
                        seriesPageSize: 3,
                        categoricalCurrentPage: 1,
                        seriesCurrentPage: 1
                    }
                }
            }
            var targetPanel = ej.buildTag("div#PivotClient", "", { "min-height": "275px", width: "100%" })[0].outerHTML;
            if (paging.model.checked) {
                $(targetPanel).appendTo(".control");
                if (clientData == "")
                    $("#PivotClient").ejPivotClient({ url: "../api/OlapClient", customObject: { "Report": "Paging" }, renderSuccess: "setChartProperties", enablePaging: true, beforeExport: "Export", saveReport: "reportSettings", fetchReport: "reportSettings", loadReport: "reportSettings" });
                else
                    $("#PivotClient").ejPivotClient({ dataSource: clientData, enablePaging: true, renderSuccess: "setChartProperties", beforeExport: "Export", saveReport: "reportSettings", fetchReport: "reportSettings", loadReport: "reportSettings" });
            }
            else {
                $(targetPanel).appendTo(".control");
                if (clientData == "") 
                    $("#PivotClient").ejPivotClient({ url: "../api/OlapClient", customObject: { "Report": "Paging" }, renderSuccess: "setChartProperties", enableVirtualScrolling: true, beforeExport: "Export", saveReport: "reportSettings", fetchReport: "reportSettings", loadReport: "reportSettings" });
                else 
                    $("#PivotClient").ejPivotClient({ dataSource: clientData, enableVirtualScrolling: true, renderSuccess: "setChartProperties", beforeExport: "Export", saveReport: "reportSettings", fetchReport: "reportSettings", loadReport: "reportSettings" });
            }
        }
        function setChartProperties(args) {
            this._pivotChart.model.load = "loadTheme";
            if (args._successAction == undefined || args._successAction == "Filter") {
                this._pivotChart.model.legend.rowCount = 2;
                this._pivotChart.model.primaryXAxis = { title: { text: "Fiscal Year" }, labelRotation: 270 };
                this._pivotChart.model.primaryYAxis = { title: { text: "Internet Sales Amount" } };
            }
        }
        function Exporting(args) {
            args.url = "pivotClientExport";
        }
        function Export(args) {
            args.url = "../api/OlapClient/ExportPivotClient";
        }
        function reportSettings(args) {
            if (args.fetchReportSetting)
                return args.fetchReportSetting.url = "../wcf/OlapClientService.svc";
            else if (args.loadReportSetting)
                return args.loadReportSetting.url = "../wcf/OlapClientService.svc";
            else
                return args.saveReportSetting.url = "../wcf/OlapClientService.svc";
        }
		window.loadPivotClientFrameTheme = function () {
            window.setTimeout(function () {
                var pivotClientElement = $("#PivotClient").data("ejPivotClient");
                pivotClientElement._load();
            }, 500);
        }
    </script>
    <!--Tooltip labels can be localized here-->
    <script id="tooltipTemplate" type="application/jsrender"> 
        <div style="background:White; color:black; font-size:12px; font-weight:normal; border: 1px solid #4D4D4D; white-space: nowrap;border-radius: 2px; margin-right: 25px; min-width: 110px;padding-right: 5px; padding-left: 5px; padding-bottom: 2px ;width: auto; height: auto;">
            <div>Measure(s) : {{:~Measures(#data)}}</div><div>Row : {{:~Row(#data)}}</div><div>Column : {{:~Column(#data)}}</div><div>Value : {{:~Value(#data)}}</div>
        </div>
    </script>
</asp:Content>

