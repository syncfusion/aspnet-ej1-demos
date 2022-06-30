<%@ Page Title="PivotClient-Drill Through-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot client control describes how to view the raw data besides each value cell."  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DrillThrough.aspx.cs" Inherits="WebSampleBrowser.PivotClient.DrillThrough" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotClient ID="PivotClient1" runat="server" OnServerExporting="PivotClient1_ServerExporting" Url="../api/DrillThrough" Title="OLAP Browser" EnableSplitter="false" EnableDrillThrough="true" ClientIDMode="Static">
        <ClientSideEvents  RenderSuccess="setChartProperties" Load="onLoad" BeforeExport="Export" SaveReport="reportSettings" LoadReport="reportSettings" FetchReport="reportSettings" DrillThrough="drilledData"/>
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
        #Grid1 .e-rowcell {
            font-weight: normal !important;
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
        function onLoad(args) {
            args.model.customObject = { "Report": "DrillThrough" }
        }
        function drilledData(args) {
            $(".e-dialog, .e-clientDialog, .e-tableDlg").remove();
            gridData = ej.isNullOrUndefined(args.data.d) ? JSON.parse(args.data.DrillDataTable) : JSON.parse(args.data.d[1].Value);
            if (!ej.isNullOrUndefined(gridData)) {
                for (var i = 0; i < gridData.length; i++) {
                    Object.keys(gridData[i]).forEach(function (key, value) {
                        var newkey = key.replace(/\]/g, '').replace(/\[/g, '');
                        if (newkey.indexOf("-") > -1) {
                            var colName = newkey.split("-");
                            var HName = newkey.split("-")[colName.length - 1];
                            if (HName.indexOf(".") > -1) {
                                var Lname = HName.split(".");
                                newkey = Lname[Lname.length - 1];
                            }
                            else
                                newkey = HName;
                        }
                        gridData[i][newkey] = gridData[i][key];
                        delete gridData[i][key];
                    });
                }
            }
            var dialogContent = ej.buildTag("div#" + this._id + "_tableDlg.e-tableDlg", $("<div id=\"Grid1\"></div>"))[0].outerHTML;
            var dialogFooter = ej.buildTag("div", ej.buildTag("button#btnOK.e-dialogBtnOK", "Hierarchy Selector")[0].outerHTML, { "float": "right", "margin": "-5px 0 6px" })[0].outerHTML
            ejDialog = ej.buildTag("div#clientDialog.e-clientDialog", dialogContent + dialogFooter, { "opacity": "1" }).attr("title", "Drill Through Information")[0].outerHTML;
            $(ejDialog).appendTo("#" + this._id);
            $("#btnOK").ejButton().css({ margin: "30px 0 20px 0" });
            $("#Grid1").ejGrid({
                dataSource: gridData,
                allowScrolling: true,
                scrollSettings: { width: "85%" },
                allowPaging: true,
                allowResizing: true,
                allowResizeToFit: true,
                pageSettings: { pageSize: 8 }
            });
            this.element.find(".e-clientDialog").ejDialog({ width: "auto", content: "#" + this._id, enableResize: false, close: ej.proxy(ej.Pivot.closePreventPanel, this) });
            var pivotClient = this;
            pivotClient._waitingPopup.hide()
            $("#btnOK").click(function () {
                $(".e-dialog, .e-clientDialog, .e-tableDlg").remove();
                if (pivotClient.model.operationalMode == ej.PivotGrid.OperationalMode.ServerMode) {
                    pivotClient._waitingPopup.show()
                    pivotClient.doAjaxPost("POST", "../api/DrillThrough/" + pivotClient.model.serviceMethodSettings.drillThroughHierarchies, JSON.stringify({ "currentReport": pivotClient.currentReport, "layout": "normal", "cellPos": "", "customObject": JSON.stringify(pivotClient.model.customObject) }), function (args) {
                        ej.Pivot.openHierarchySelector(pivotClient, args);
                    })
                }
            });
        }
        function refreshClient(args) {
            $(pivotClient.element).html("");
            pivotClient.model.enableDeferUpdate = deferUpdate.model.checked;
            pivotClient._load();
        }
        var ddlTarget, chartTarget;
        function setChartProperties(args) {
            this._pivotChart.model.load = "loadTheme";
            if (args._successAction == undefined || args._successAction == "Filter") {
                this._pivotChart.model.legend.rowCount = 2;
                this._pivotChart.model.primaryXAxis = { title: { text: "Fiscal Year" }, labelRotation: 270 };
                this._pivotChart.model.primaryYAxis = { title: { text: "Customer Count" } };
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

