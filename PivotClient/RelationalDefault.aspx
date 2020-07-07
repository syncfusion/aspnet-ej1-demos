<%@ Page Title="PivotClient-Default Functionalities-RelationalDB-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot client control describes how to bind the pivot data, which is in JSON format at script-side." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RelationalDefault.aspx.cs" Inherits="WebSampleBrowser.OlapClient.RelationalDefault" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotClient ID="PivotClient1" runat="server" OnServerExporting="PivotClient1_ServerExporting" Title="Relational Browser" EnableMemberEditorSorting = "true" EnableSplitter="false" ClientIDMode="Static">
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
		<size Height="685px" Width="1000px"></size>
        <ClientSideEvents Load="OnLoad" RenderSuccess="setChartProperties" BeforeExport="Export" SaveReport="reportSettings" LoadReport="reportSettings" FetchReport="reportSettings"  />
    </ej:PivotClient>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotClient1 {
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
                this._pivotChart.model.primaryXAxis = { title: { text: "Country" }, labelRotation: 270 };
                this._pivotChart.model.primaryYAxis = { title: { text: "Amount" } };
            }
        }
        function reportSettings(args) {
            if (args.fetchReportSetting)
                return args.fetchReportSetting.url = "../wcf/OlapClientService.svc";
            else if (args.loadReportSetting)
                return args.loadReportSetting.url = "../wcf/OlapClientService.svc";
            else
                return args.saveReportSetting.url = "../wcf/OlapClientService.svc";
        }

        function Export(args) {
            args.url = "pivotClientExport";
        }
        function OnLoad(args) {
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
            //loadTheme(args);
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

