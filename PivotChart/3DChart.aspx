<%@ Page Title="PivotChart-3DChart-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot chart control demonstrates different types of charts as 3D chart." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="3DChart.aspx.cs" Inherits="WebSampleBrowser._3DChart" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotChart ID="PivotChart1" runat="server" Enable3D="true" Rotation="24" IsResponsive="true" ClientIDMode="Static">
        <DataSource>
            <Rows>
                <ej:Field FieldName="Product" FieldCaption="Product"></ej:Field>
                <ej:Field FieldName="Date" FieldCaption="Date"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Country" FieldCaption="Country"></ej:Field>
            </Columns>
            <Values>
                <ej:Field FieldName="Amount" FieldCaption="Amount"></ej:Field>
            </Values>
        </DataSource>
        <CommonSeriesOptions Type="Column"  EnableAnimation="True" Tooltip-Visible="true"/>
        <ClientSideEvents Load="onLoad" />
        <Size Width="100%" Height="460px"></Size>
        <PrimaryYAxis>
            <Title Text="Amount"></Title>
        </PrimaryYAxis>
        <Legend RowCount="2"></Legend>
    </ej:PivotChart>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3" style="width: 75px; padding-top: 3px; margin-top: 18px">
                    Chart Type
                </div>
                <div class="col-md-3" style="margin-top: 17px">
                    <select id="chartType">
                        <option value="column"selected="selected">Column</option>
                        <option value="pie">Pie</option>
                        <option value="bar">Bar</option>
                        <option value="stackingcolumn">StackingColumn</option>
                        <option value="stackingbar">StackingBar</option>
                   </select>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var ddlTarget, chartTarget;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#chartType").ejDropDownList({
                width: "110px"
            });
            ddlTarget = $('#chartType').data("ejDropDownList");
            ddlTarget.selectItemByText(ddlTarget.items[0].innerHTML);
            chartTarget = $('#PivotChart1').data("ejPivotChart");
            $("#chartType").ejDropDownList("option", "change", "ChartTypeChanged");
        });
        function ChartTypeChanged(args) {
            chartTarget.model.type = args.text.toLowerCase();
            chartTarget.model.commonSeriesOptions.type = args.text.toLowerCase();
            chartTarget.renderControlSuccess({ "JsonRecords": JSON.stringify(chartTarget.getJSONRecords()), "OlapReport": chartTarget.getOlapReport() });
        }
        function onLoad(args) {
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
            loadTheme(args);
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotChart1
        {
            width: 100%;
            float: left;
            height: 450px;
        }
        .row .cols-prop-area
        {
            width: 22%;
            min-height: 140px;
        }
        .row .cols-sample-area
        {
            width: 75.7%;
        }
    </style>
</asp:Content>


