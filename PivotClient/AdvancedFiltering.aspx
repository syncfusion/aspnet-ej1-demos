<%@ Page Title="PivotClient-Advanced Filtering-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot client control describes filtering members by their captions and summary values along with sorting" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="AdvancedFiltering.aspx.cs" Inherits="WebSampleBrowser.OlapClient.AdvancedFiltering" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotClient ID="PivotClient1" runat="server" EnableAdvancedFilter="true" OnServerExporting="PivotClient1_ServerExporting" Title="PivotClient" ClientIDMode="Static">
        <DataSource >
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
        <ClientSideEvents Load="OnLoad1" RenderSuccess="setChartProperties" BeforeExport="Exporting" SaveReport="reportSettings" LoadReport="reportSettings" FetchReport="reportSettings"  />
    </ej:PivotClient>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
                <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3" style="width:100px"">
                            Data Source
                        </div>
                        <div class="col-md-3">
                            <table>
                                <tr>
                                    <td style="float:left; padding-right:15px">
                                        <input type="radio" name="datasource" id="rdbRelational" checked /><label for="rdbRelational" class="radioBtnLabel">Relational</label>
                                    </td>
                                    <td>
                                        <input type="radio" name="datasource" id="rdbOlap" /><label for="rdbOlap" class="radioBtnLabel">OLAP</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 5px;">
                       <div class="col-md-3" style="width:100px"">
                            Mode
                        </div>
                        <div class="col-md-3">
                            <table>
                                <tr>
                                    <td style="float:left; padding-right:35px">
                                        <input type="radio" name="dataMode" id="rdbClient" checked /><label for="rdbClient" class="clslab">Client</label>
                                    </td>
                                    <td>
                                        <input type="radio" name="dataMode" id="rdbServer" /><label for="rdbServer" class="clslab">Server</label>
                                    </td>
                                </tr>
                            </table>
                         </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                        <button id="ApplyBtn">Apply</button>
                            </div>
                    </div>
                </div>
            </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotClient1 {
            min-height: 275px; 
            min-width: 950px;
            float:left;
            margin-left:-16px;
        }
        .cols-sample-area {
            overflow:auto;
        }
		.control-panel {
            position: relative;
        }

         .row .cols-sample-area  {
             overflow: auto !important;
             width: 100%
        }
       
        .row .cols-prop-area
        {
            min-height: 150px;
            width: 40%;
            float:left;
        }
        .radioBtnLabel{
            margin-left:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">   
    <script type="text/javascript">
        var ddlTarget, chartTarget;
        function OnLoad1(args) {
            args.model.dataSource.data = [
                            { Amount: 100, Country: "Canada", Date: "FY 2005", Product: "Bike", Quantity: 2, State: "Alberta" },
                            { Amount: 200, Country: "Canada", Date: "FY 2006", Product: "Van", Quantity: 3, State: "British Columbia" },
                            { Amount: 300, Country: "Canada", Date: "FY 2007", Product: "Car", Quantity: 4, State: "Brunswick" },
                            { Amount: 150, Country: "Canada", Date: "FY 2008", Product: "Bike", Quantity: 3, State: "Manitoba" },
                            { Amount: 200, Country: "Canada", Date: "FY 2006", Product: "Car", Quantity: 4, State: "Ontario" },
                            { Amount: 100, Country: "Canada", Date: "FY 2007", Product: "Van", Quantity: 1, State: "Quebec" },
                            { Amount: 200, Country: "France", Date: "FY 2005", Product: "Bike", Quantity: 2, State: "Charente-Maritime" },
                            { Amount: 250, Country: "France", Date: "FY 2006", Product: "Van", Quantity: 4, State: "Essonne" },
                            { Amount: 300, Country: "France", Date: "FY 2007", Product: "Car", Quantity: 3, State: "Garonne (Haute)" },
                            { Amount: 150, Country: "France", Date: "FY 2008", Product: "Van", Quantity: 2, State: "Gers" },
                            { Amount: 200, Country: "Germany", Date: "FY 2006", Product: "Van", Quantity: 3, State: "Bayern" },
                            { Amount: 250, Country: "Germany", Date: "FY 2007", Product: "Car", Quantity: 3, State: "Brandenburg" },
                            { Amount: 150, Country: "Germany", Date: "FY 2008", Product: "Car", Quantity: 4, State: "Hamburg" },
                            { Amount: 200, Country: "Germany", Date: "FY 2008", Product: "Bike", Quantity: 4, State: "Hessen" },
                            { Amount: 150, Country: "Germany", Date: "FY 2007", Product: "Van", Quantity: 3, State: "Nordrhein-Westfalen" },
                            { Amount: 100, Country: "Germany", Date: "FY 2005", Product: "Bike", Quantity: 2, State: "Saarland" },
                            { Amount: 150, Country: "United Kingdom", Date: "FY 2008", Product: "Bike", Quantity: 5, State: "England" },
                            { Amount: 250, Country: "United States", Date: "FY 2007", Product: "Car", Quantity: 4, State: "Alabama" },
                            { Amount: 200, Country: "United States", Date: "FY 2005", Product: "Van", Quantity: 4, State: "California" },
                            { Amount: 100, Country: "United States", Date: "FY 2006", Product: "Bike", Quantity: 2, State: "Colorado" },
                            { Amount: 150, Country: "United States", Date: "FY 2008", Product: "Car", Quantity: 3, State: "New Mexico" },
                            { Amount: 200, Country: "United States", Date: "FY 2005", Product: "Bike", Quantity: 4, State: "New York" },
                            { Amount: 250, Country: "United States", Date: "FY 2008", Product: "Car", Quantity: 3, State: "North Carolina" },
                            { Amount: 300, Country: "United States", Date: "FY 2007", Product: "Van", Quantity: 4, State: "South Carolina" }
            ];           
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

        var btnTarget, relationalRadioBtnObj, olapRadioBtnObj, rdbClient, rdbServer;
        var pivotdataSource = {
            data: pivot_dataset,
            enableAdvancedFilter: true,
            cube: "",
            rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }],
            columns: [{ fieldName: "Product", fieldCaption: "Product" }],
            values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }],
            filters: []
        };
        $(function () {
            $("#rdbRelational,#rdbOlap, #rdbClient, #rdbServer").ejRadioButton(
                {
                 }
                );
            $("#languageList").ejDropDownList({
                width: "80px"
            });
            $("#sampleProperties").ejPropertiesPanel();



            $("#ApplyBtn").ejButton({
                roundedCorner: true,
                size: "small",
                type: ej.ButtonType.Button,
                click: "ApplyChanges"
            });
            relationalRadioBtnObj = $('#rdbRelational').data("ejRadioButton");
            olapRadioBtnObj = $('#rdbOlap').data("ejRadioButton");
            rdbClient = $('#rdbClient').data("ejRadioButton");
            rdbServer = $('#rdbServer').data("ejRadioButton");
        });

        function onLoad(args) {
            if (args.model.dataSource.data == null)
                args.model.dataSource.data = pivot_dataset;
        }

        function ApplyChanges(args) {
            var PivotClient = $('.e-pivotclient').data("ejPivotClient");
            var pivotdataSource = {
                data: pivot_dataset, cube: "",
                enableAdvancedFilter: true,
                rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }],
                columns: [{ fieldName: "Product", fieldCaption: "Product" }],
                values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }],
                filters: []
            };
            var olapDataSource = {
                enableAdvancedFilter: true,
                data: "//bi.syncfusion.com/olap/msmdpump.dll",
                catalog: "Adventure Works DW 2008 SE",
                cube: "Adventure Works",
                rows: [{ fieldName: "[Date].[Fiscal]" }],
                columns: [{ fieldName: "[Customer].[Customer Geography]" }],
                values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }, { fieldName: "[Measures].[Growth in Customer Base Trend]" }], axis: "columns" }],
                filters: []
            };

            $(".e-pivotclient").remove();
            var gridPanel = ej.buildTag("div#PivotClient1", "", { "display": "block" })[0].outerHTML;
            $(gridPanel).appendTo(".cols-sample-area");

            if (rdbClient.model.checked) {
                $("#PivotClient1").ejPivotClient({
                    title: "PivotClient",
                    dataSource: relationalRadioBtnObj.model.checked ? pivotdataSource : olapRadioBtnObj.model.checked ? olapDataSource : pivotdataSource, enableKPI: (relationalRadioBtnObj.model.checked ? false : olapRadioBtnObj.model.checked ? true : false),
                    renderSuccess: "setChartProperties", beforeExport: "Export", saveReport: "reportSettings", fetchReport: "reportSettings", loadReport: "reportSettings"
                });
            }
            else {
                PivotClient.model.dataSource = { data: null, cube: "" };
                PivotClient.model.operationalMode = "servermode";
                $("#PivotClient1").ejPivotClient({
                    title: "PivotClient",
                    url: "../" + (relationalRadioBtnObj.model.checked ? "api/RelationalClient" : "api/OlapClient"),
                    enableAdvancedFilter: (true), enableKPI: (relationalRadioBtnObj.model.checked ? false : olapRadioBtnObj.model.checked ? true : false), customObject: { "Report": "KPI" },
                    renderSuccess: "setChartProperties", beforeExport: "Export", saveReport: "reportSettings", fetchReport: "reportSettings", loadReport: "reportSettings"
                });
            }

        }
		window.loadPivotClientFrameTheme = function () {
            window.setTimeout(function () {
                var pivotClientElement = $("#PivotClient1").data("ejPivotClient");
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

