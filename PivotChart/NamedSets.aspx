<%@ Page Title="PivotChart-Named Sets-ASP.NET-SYNCFUSION"   Language="C#"  MetaDescription="This demo for ASP.NET pivot chart control describes a named set, which is a set of dimension members predefined in the OLAP cube." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="NamedSets.aspx.cs" Inherits="WebSampleBrowser.PivotChart.NamedSets" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <div class="control">
        <ej:PivotChart ID="PivotChart1" runat="server" IsResponsive="true" ClientIDMode="Static">
            <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll">
                <Columns>
                    <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
                </Columns>
                <Rows>
                    <ej:Field FieldName="[Core Product Group]" IsNamedSets="true"></ej:Field>
                </Rows>
                <Values>
                    <ej:Field Axis="Column">
                        <Measures>
                            <ej:MeasuresItems FieldName="[Measures].[Internet Sales Amount]" />
                        </Measures>
                    </ej:Field>
                </Values>
            </DataSource>
            <CommonSeriesOptions Type="Column" EnableAnimation="True" Tooltip-Visible="true" />
            <ClientSideEvents Load="loadTheme" />
            <Size Width="100%" Height="460px"></Size>
            <PrimaryXAxis>
                <Title Text="Core Product Group (Named Set)"></Title>
            </PrimaryXAxis>
            <PrimaryYAxis>
                <Title Text="Internet Sales Amount"></Title>
            </PrimaryYAxis>
			<Zooming EnableScrollbar="true" />
            <Legend RowCount="2"></Legend>
        </ej:PivotChart>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotChart1 {
            min-height: 275px;
            min-width: 525px;
            height: 460px;
            width: 100%;
            float: left;
        }

        .radioBtnLabel {
            margin-left: 5px;
        }

        .row .cols-sample-area {
            width: 100%;
        }

        .cols-prop-area .content {
            width: auto;
        }

        .chkrad {
            width: 100px;
        }

        .row .cols-prop-area {
            min-height: 110px;
            width: auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <table>
                    <tr>
                        <td class=" chkrad" style="width: 80px">Mode :
                        </td>
                        <td class="chkrad">
                            <input type="radio" name="dataMode" id="rdbClient" checked="checked" /><label for="rdbClient" class="radioBtnLabel">Client</label>
                        </td>
                        <td class="chkrad" colspan="2">
                            <input type="radio" name="dataMode" id="rdbServer" /><label for="rdbServer" class="radioBtnLabel">Server</label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var rdbClient, rdbServer;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#rdbClient,#rdbServer").ejRadioButton({ change: "renderPivotChart" });
            rdbClient = $('#rdbClient').data("ejRadioButton"); rdbServer = $('#rdbServer').data("ejRadioButton");
        });
        function renderPivotChart(args) {
            $(".e-pivotchart").remove();
            var chartPanel = ej.buildTag("div#PivotChart1", "", { height: "460", width: "100%" })[0].outerHTML;
            $(chartPanel).appendTo(".control");
            if (rdbClient.model.checked) {
                $("#PivotChart1").ejPivotChart({
                    dataSource: {
                        data: "//bi.syncfusion.com/olap/msmdpump.dll",
                        catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works",
                        columns: [{ fieldName: "[Customer].[Customer Geography]" }],
                        rows: [{ fieldName: "[Core Product Group]", isNamedSets: true }],
                        values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }],
                        filters: []
                    },
                    isResponsive: true,zooming : { enableScrollbar : true},
                    type: ej.PivotChart.ChartTypes.Column,
                    commonSeriesOptions: {
                        enableAnimation: true,
                        type: ej.PivotChart.ChartTypes.Column, tooltip: { visible: true }
                    },
                    size: { height: "460px", width: "100%" },
                    primaryYAxis: { title: { text: "Internet Sales Amount" }, labelRotation: 0 },
                    primaryXAxis: { title: { text: "Core Product Group (Named Set)" } },
                    legend: { visible: true },
                    load: "loadTheme"
                });
            }
            else {
                $("#PivotChart1").ejPivotChart({
                    url: "../api/NamedSet",
                    isResponsive: true,zooming : { enableScrollbar : true},
                    type: ej.PivotChart.ChartTypes.Column,
                    commonSeriesOptions: {
                        enableAnimation: true,
                        type: ej.PivotChart.ChartTypes.Column, tooltip: { visible: true }
                    },
                    size: { height: "460px", width: "100%" },
                    primaryYAxis: { title: { text: "Internet Sales Amount" }, labelRotation: 0 },
                    primaryXAxis: { title: { text: "Fiscal Year" } },
                    legend: { visible: true },
                    load: "loadTheme"
                });
            }
        }
    </script>
</asp:Content>

