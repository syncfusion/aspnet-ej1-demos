<%@ Page Title="PivotClient-Calculated Members-ASP.NET-SYNCFUSION" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot client control describes how to render the calculated members and measures." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CalculatedMembers.aspx.cs" Inherits="WebSampleBrowser.CalculatedMembers" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <div class="control">
        <ej:PivotClient ID="PivotClient1" runat="server" OnServerExporting="PivotClient1_ServerExporting" Title="OLAP Browser" EnableSplitter="false" ClientIDMode="Static">
            <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll">
                <Rows>
                    <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
                </Rows>
                <Columns>
                    <ej:Field FieldName="[Date].[Fiscal]"></ej:Field>
                    <ej:Field FieldName="BikeAndComponenets" Expression="([Product].[Product Categories].[Category].[Bikes] + [Product].[Product Categories].[Category].[Components] )" HierarchyUniqueName="[Product].[Product Categories]"></ej:Field>

                </Columns>
                <Values>
                    <ej:Field Axis="Column">
                    <measures>
                            <ej:MeasuresItems FieldName="[Measures].[Order Quantity]" />
                            <ej:MeasuresItems FieldName="Order on Discount" Expression="[Measures].[Order Quantity] + ([Measures].[Order Quantity] * 0.10)" />
                        </measures>
                    </ej:Field>
                </Values>
            </DataSource>
            <ToolbarIconSettings EnableCalculatedMember="true" />
            <ClientSideEvents Load="onLoad" RenderSuccess="setChartProperties" BeforeExport="Export" SaveReport="reportSettings" LoadReport="reportSettings" FetchReport="reportSettings" />
        </ej:PivotClient>
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

        .cols-sample-area {
            width: 100% !important;
            overflow: auto;
        }

        .cols-prop-area {
            min-height: 120px !important;
            width: 30% !important;
        }
    </style>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var deferUpdate, pivotClient;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#rdbServer, #rdbClient").ejRadioButton({ change: "renderClient" });
        });
        var ddlTarget, chartTarget;
        function renderClient(args) {
            $("#PivotClient1").remove();
            var clientData = "";
            var targetPanel = ej.buildTag("div#PivotClient1", "", { "min-height": "275px", width: "100%" })[0].outerHTML;
            $(targetPanel).appendTo(".control");
            if (args.model.id == "rdbClient") {
                clientData = {
                    data: "//bi.syncfusion.com/olap/msmdpump.dll", //data
                    catalog: "Adventure Works DW 2008 SE",
                    cube: "Adventure Works",
                    columns: [{ fieldName: "[Customer].[Customer Geography]" },
                      {
                          fieldName: "BikeAndCat",
                          expression: "([Product].[Product Categories].[Category].[Bikes] + [Product].[Product Categories].[Category].[Components] )",
                          hierarchyUniqueName: "[Product].[Product Categories]"
                      }
                    ],
                    rows: [{ fieldName: "[Date].[Fiscal]" }],
                    values: [{
                        measures: [{ fieldName: "[Measures].[Order Quantity]" }, { fieldName: "Order on Discount", expression: "[Measures].[Order Quantity] + ([Measures].[Order Quantity] * 0.10)" }], axis: "columns"
                    }]
                };
            }
            {
                if (clientData == "")
                    $("#PivotClient1").ejPivotClient({ url: "../api/OlapClient", toolbarIconSettings: { enableCalculatedMember: true }, title:"OLAP Browser", customObject: { "Report": "CalculatedMember" }, renderSuccess: "setChartProperties", beforeExport: "Export", saveReport: "reportSettings", fetchReport: "reportSettings", loadReport: "reportSettings" });
                else
                    $("#PivotClient1").ejPivotClient({ dataSource: clientData, toolbarIconSettings: { enableCalculatedMember: true }, title: "OLAP Browser", renderSuccess: "setChartProperties", beforeExport: "Export", saveReport: "reportSettings", fetchReport: "reportSettings", loadReport: "reportSettings" });
            }
        }
        function setChartProperties(args) {
            this._pivotChart.model.load = "loadTheme";
            if (args._successAction == undefined || args._successAction == "Filter") {
                this._pivotChart.model.legend.rowCount = 2;
                this._pivotChart.model.primaryXAxis = { title: { text: "Fiscal Year" }, labelRotation: 270 };
                this._pivotChart.model.primaryYAxis = { title: { text: "Customer Count" } };
            }
            pivotClient = $("#PivotClient1").data("ejPivotClient");
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
        function onLoad(args) {
            args.model.customObject = { "Report": "CalculatedMember" };
        }
        window.loadPivotClientFrameTheme = function () {
            window.setTimeout(function () {
                var pivotClientElement = $("#PivotClient1").data("ejPivotClient");
                pivotClientElement._load();
            }, 500);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3" style="width: 20%">
                    Mode :
                </div>
                <div class="col-md-3" style="width: 30%">
                    <input type="radio" name="dftView" id="rdbClient" checked="checked" /><label for="rdbClient" class="clslab">Client</label>
                </div>
                <div class="col-md-3" style="width: 30%">
                    <input type="radio" name="dftView" id="rdbServer" /><label for="rdbServer" class="clslab">Server</label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


