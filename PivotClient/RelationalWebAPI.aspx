<%@ Page Title="PivotClient-WebAPI-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot client control describes how to bind the pivot data through Web API service." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RelationalWebAPI.aspx.cs" Inherits="WebSampleBrowser.OlapClient.RelationalWebAPI" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotClient ID="PivotClient1" runat="server" Url="../api/RelationalClient" OnServerExporting="PivotClient1_ServerExporting" Title="Relational Browser" EnableSplitter="false" ClientIDMode="Static">
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
        .cols-sample-area
        {
            width:100%!important;              
            overflow:auto;
        }
        .cols-prop-area{
            min-height: 120px !important;
        }
    </style>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">   
    <script type="text/javascript">
        var deferUpdate, pivotClient;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#deferUpdate").ejCheckBox({ size: "medium", checked: false, change: "refreshClient" });
            deferUpdate = $('#deferUpdate').data("ejCheckBox");
            pivotClient = $("#PivotClient1").data("ejPivotClient");
        });
        function refreshClient(args) {
            $(pivotClient.element).html("");
            pivotClient.model.enableDeferUpdate = deferUpdate.model.checked;
            pivotClient._load();
        }
        var ddlTarget, chartTarget;
        function setChartProperties(args) {
            if (this._pivotChart && (args._successAction == undefined || args._successAction == "Filter")) {
            this._pivotChart.model.load = "loadTheme";
                this._pivotChart.model.legend.rowCount = 2;
                this._pivotChart.model.primaryXAxis = { title: { text: "Country" }, labelRotation: 270 };
                this._pivotChart.model.primaryYAxis = { title: { text: "Amount" } };
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

