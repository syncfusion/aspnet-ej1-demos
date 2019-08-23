<%@ Page Title="PivotClient-Exporting Modes-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot client control demonstrates exporting the pivot grid and pivot chart to Excel, Word and PDF formats"  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ExportingModes.aspx.cs" Inherits="WebSampleBrowser.ExportingModes" %>

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
        <ClientSideEvents ChartLoad="setChartProperties" BeforeExport="Export" SaveReport="reportSettings" LoadReport="reportSettings" FetchReport="reportSettings"/>
    </ej:PivotClient>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                    <div style="line-height:2;float:left;margin-left:15px;">
                        Export Mode
                    </div>
                    <div class="col-md-3">
                        <select id="drpdwn">
                            <option value="chartandgrid">Chart and Grid</option>
                            <option value="chartonly">Chart Only</option>
                            <option value="gridonly">Grid Only</option>
                        </select>
                    </div>
                </div>
       </div>
   </div>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript" class="jsScript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#drpdwn").ejDropDownList({
            });
            ddlTarget = $('#drpdwn').data("ejDropDownList");
            ddlTarget.selectItemByText(ddlTarget.items[0].innerHTML);
            $("#drpdwn").ejDropDownList("option", "change", "ChangeMode");
        });
        function ChangeMode(args) {
            var clientObj = $("#PivotClient1").data("ejPivotClient");
            clientObj.model.clientExportMode = args.value;
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
            min-height: 150px;
            width: 30%;
            margin-top:-5px;
            margin-left:-1px;
            float:left;            
        }
    </style>
</asp:Content>

