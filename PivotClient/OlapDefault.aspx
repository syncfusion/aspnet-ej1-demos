<%@ Page Title="PivotClient-Default Functionalities-OLAP-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot client control describes how to bind the OLAP cube data from SSAS (XML/A)."  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="OlapDefault.aspx.cs" Inherits="WebSampleBrowser.OlapClient.OlapDefault" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotClient ID="PivotClient1" runat="server" OnServerExporting="PivotClient1_ServerExporting" Title="OLAP Browser" EnableSplitter="false" ClientIDMode="Static">
        <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll">
            <Rows>
                <ej:Field FieldName="[Date].[Fiscal]"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
            </Columns>
            <Values>
                <ej:Field Axis="Column">
                    <Measures>
                        <ej:MeasuresItems FieldName="[Measures].[Internet Sales Amount]" />
                    </Measures>
                </ej:Field>
            </Values>
        </DataSource>
        <ClientSideEvents  RenderSuccess="setChartProperties" BeforeExport="Export" SaveReport="reportSettings" LoadReport="reportSettings" FetchReport="reportSettings" />
    </ej:PivotClient>
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
    </style>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">   
    <script type="text/javascript">
        var ddlTarget, chartTarget;
        function setChartProperties(args) {
            this._pivotChart.model.load = "loadTheme";
            if (args._successAction == undefined || args._successAction == "Filter") {
                this._pivotChart.model.legend.rowCount = 2;
                this._pivotChart.model.primaryXAxis = { title: { text: "Fiscal Year" }, labelRotation: 270 };
                this._pivotChart.model.primaryYAxis = { title: { text: "Internet Sales Amount" } };
            }
        }
        function Export(args) {
            args.url = "pivotClientExport";
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

