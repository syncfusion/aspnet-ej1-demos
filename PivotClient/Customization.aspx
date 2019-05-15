<%@ Page Title="PivotClient-Display Options-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot client control describes how to customize the control layout like default view and tile view" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Customization.aspx.cs" Inherits="WebSampleBrowser.Customization" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotClient ID="PivotClient1" runat="server" OnServerExporting="PivotClient1_ServerExporting" ClientIDMode="Static" Title="OLAP Browser">
        <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll">
                <Rows>
                    <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
                </Rows>
                <Columns>
                    <ej:Field FieldName="[Date].[Fiscal]"></ej:Field>
                </Columns>
                <Values>
                    <ej:Field Axis="Column">
                        <Measures>
                            <ej:MeasuresItems FieldName="[Measures].[Internet Sales Amount]" />
                        </Measures>
                    </ej:Field>
                </Values>                
            </DataSource>
        <ClientSideEvents RenderSuccess="setChartProperties" BeforeExport="Exporting" SaveReport="reportSettings" LoadReport="reportSettings" FetchReport="reportSettings"/>
    </ej:PivotClient>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Control Placement:
                </div>
                <div class="col-md-3">
                    <input type="text" id="ctrlPlace" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Display Mode:
                </div>
                <div class="col-md-3">
                    <input type="text" id="dispMode" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Default View:
                </div>
                <div class="col-md-3">
                    <table>
                        <tr>
                            <td class="chkrad">
                                <input type="radio" name="dftView" id="Radio1" /><label for="Radio1" class="clslab">Chart</label>
                            </td>
                            <td class="chkrad" colspan="2">
                                <input type="radio" name="dftView" id="Radio2" /><label for="Radio2" class="clslab">Grid</label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Toggle Panel:
                </div>
                <div class="col-md-3">
                    <table>
                        <tr>
                            <td class="chkrad">
                                <input type="radio" name="tglPln" id="Radio3" /><label for="Radio3" class="clslab">True</label>
                            </td>
                            <td class="chkrad" colspan="2">
                                <input type="radio" name="tglPln" id="Radio4" /><label for="Radio4" class="clslab">False</label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                    <div class="col-md-3">
                        Responsive:
                    </div>
                    <div class="col-md-3">
                        <table>
                            <tr>
                                <td class="chkrad">
                                    <input type="radio" name="tglPln" id="Radio5" /><label for="Radio3" class="clslab">True</label>
                                </td>
                                <td class="chkrad" colspan="2">
                                    <input type="radio" name="tglPln" id="Radio6" /><label for="Radio4" class="clslab">False</label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            <div class="row">
                <input type="button" id="Btn1" value="Apply" />
            </div>
       </div>
   </div>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript" class="jsScript">
        var clientTarget;
        var ddlTarget1; var ddlTarget2; var btnTarget; 
        var rbTarget1; var rbTarget2; var rbTarget3; var rbTarget4;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#Radio1").ejRadioButton();
            $("#Radio2").ejRadioButton({ checked: true });
            $("#Radio3").ejRadioButton();
            $("#Radio4").ejRadioButton({ checked: true });
            $("#Radio5").ejRadioButton();
            $("#Radio6").ejRadioButton({ checked: true });
            $("#Btn1").ejButton({
                roundedCorner: true,
                size: "small",
                type: ej.ButtonType.Button,
                click: "ApplyChanges"
            });
            var controlPalcements = [{ option: "Tab", value: ej.PivotClient.ControlPlacement.Tab }, { option: "Tile", value: ej.PivotClient.ControlPlacement.Tile}];
            var displayModes = [{ option: "Chart Only", value: ej.PivotClient.DisplayMode.ChartOnly }, { option: "Grid Only", value: ej.PivotClient.DisplayMode.GridOnly }, { option: "Chart and Grid", value: ej.PivotClient.DisplayMode.ChartAndGrid}];
            $('#ctrlPlace').ejDropDownList({
                dataSource: controlPalcements,
                fields: { text: "option", value: "value" }
            });
            $('#dispMode').ejDropDownList({
                dataSource: displayModes,
                fields: { text: "option", value: "value" }
            });
            ddlTarget1 = $('#ctrlPlace').data("ejDropDownList");
            ddlTarget2 = $('#dispMode').data("ejDropDownList");
            rbTarget1 = $('#Radio1').data("ejRadioButton"); rbTarget2 = $('#Radio2').data("ejRadioButton");
            rbTarget3 = $('#Radio3').data("ejRadioButton"); rbTarget4 = $('#Radio4').data("ejRadioButton");
            rbTarget5 = $('#Radio5').data("ejRadioButton"); rbTarget6 = $('#Radio6').data("ejRadioButton");
            ddlTarget1.selectItemByText(ddlTarget1.model.dataSource[0].option);
            ddlTarget2.selectItemByText(ddlTarget2.model.dataSource[2].option);
            clientTarget = $("#PivotClient1").data("ejPivotClient");
        });
        var isInitClick = true;
        function ApplyChanges(args) {
             clientTarget = $('#PivotClient1').data("ejPivotClient");
            if (isInitClick && ddlTarget1.text == "Tab" && ddlTarget2.text == "Chart and Grid"
            && rbTarget3.model.checked && rbTarget4.model.checked)
                return false;
            else {
                var ctlPlace = ddlTarget1.model.text == "Tab" ? "tab" : ddlTarget1.model.text == "Tile" ? "tile" : "";
                var dispMode = ddlTarget2.model.dataSource[ddlTarget2.selectedIndexValue].value;
                var dftView = rbTarget1.model.checked ? "chart" : rbTarget2.model.checked ? "grid" : "chart";
                var tglPanel = rbTarget3.model.checked ? true : rbTarget4.model.checked ? false : false;
                var responsive = rbTarget5.model.checked ? true : rbTarget6.model.checked ? false : false;
                isInitClick = false;
                if (clientTarget != null){
                    clientTarget._destroy();
                    $("#PivotClient1").ejPivotClient({
                        dataSource: {
                            data: "//bi.syncfusion.com/olap/msmdpump.dll", //data
                            catalog: "Adventure Works DW 2008 SE",
                            cube: "Adventure Works",
                            rows: [
                                {
                                    fieldName: "[Date].[Fiscal]"
                                }
                            ],
                            columns: [
                                {
                                    fieldName: "[Customer].[Customer Geography]"
                                }
                            ],
                            values: [
                                {
                                    measures: [
                                        {
                                            fieldName: "[Measures].[Internet Sales Amount]"
                                        }
                                    ],
                                    axis: "columns"
                                }
                            ]
                        },
                        title: "OLAP Browser", isResponsive: responsive,
                        displaySettings: {
                            mode: dispMode,
                            defaultView: dftView,
                            controlPlacement: ctlPlace,
                            enableTogglePanel: tglPanel,
                        }, load: "OnLoad", renderSuccess: "setChartProperties", beforeExport: "Export", saveReport: "reportSettings", fetchReport: "reportSettings", loadReport: "reportSettings"
                    });
               }
            }
        }
        function OnLoad(args) {
        }
        function setChartProperties(args) {
            if (this.model.displaySettings.mode != ej.PivotClient.DisplayMode.GridOnly) {
                this._pivotChart.model.load = "loadTheme";
                if (args._successAction == undefined || args._successAction == "Filter") {
                    this._pivotChart.model.legend.rowCount = 2;
                    this._pivotChart.model.primaryXAxis = { title: { text: "Fiscal Year" }, labelRotation: 270 };
                    this._pivotChart.model.primaryYAxis = { title: { text: "Internet Sales Amount" } };
                }
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

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotClient1 {
            min-height: 300px; 
            min-width: 950px;
            width:100%;
            float:left;
            margin-left:-16px;
        }
        .cols-sample-area
        {
            width:100%!important;              
            overflow:auto;
        }
        .row .cols-prop-area
        {
            min-height: 250px;
            width: 51%;
            margin-top:-5px;
            margin-left:-1px;
            float:left;            
        }
    </style>
</asp:Content>

