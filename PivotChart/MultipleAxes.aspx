<%@ Page Title="PivotChart-Multiple Axes-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot chart control describes how to render and configure the multiple axes in the pivot chart" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MultipleAxes.aspx.cs" Inherits="WebSampleBrowser.PivotChart.Olap1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:pivotchart id="PivotChart1" runat="server" isresponsive="true" clientidmode="Static">
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
                            <ej:MeasuresItems FieldName="[Measures].[Customer Count]" />
                        </Measures>
                    </ej:Field>
                </Values>
            </DataSource>
        <CommonSeriesOptions Type="Column"  EnableAnimation="True" Tooltip-Visible="true"/>
        <ClientSideEvents Load="loadTheme" BeforeSeriesRender="onBeforeRender"/>
        <Size Width="100%" Height="600px"></Size>
        <PrimaryXAxis>
            <Title Text="Date - Fiscal"></Title>
        </PrimaryXAxis>
        <PrimaryYAxis>
            <Title Text="Customer Count"></Title>
        </PrimaryYAxis>
		<Zooming EnableScrollbar="false" />
        <Legend RowCount="4"></Legend>
        <Axes>
            <ej:Axis Name="yAxisConfig" RowIndex="0" OpposedPosition="true" LabelFormat="c">
                <Title Text="Internet Sales Amount"></Title>
                <MajorGridLines Visible="false"></MajorGridLines>
                <AxisLine Visible="true"></AxisLine>
            </ej:Axis>
        </Axes>
    </ej:pivotchart>
</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotChart1 {
            min-height: 275px;
            min-width: 525px;
            height: 600px;
            width: 100%;
            float: left;
        }
    </style>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function onBeforeRender(args) {
            for (var i = 0; i < args.series.length; i++) {
                if (args.series[i].name.indexOf("Internet Sales Amount") > -1) {
                    args.series[i].yAxisName = "yAxisConfig";
                    args.series[i].type = "spline";
                    args.series[i].marker.visible = true;
                }
            }
            return args;
        }
    </script>
</asp:Content>

