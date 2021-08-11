<%@ Page Title="PivotTreeMap-Color Mapping-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot tree map describes how to differentiate the leaf nodes using various color codes." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ColorMapping.aspx.cs" Inherits="WebSampleBrowser.PivotTreeMap.ColorMapping" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="height:auto; min-width: 200px; width:auto ;white-space:nowrap; overflow:hidden">PivotTreeMap showing customer count over different customer geographic locations across a period of fiscal years.</div>
    <ej:PivotTreeMap ID="PivotTreeMap1" runat="server" IsResponsive="true" ClientIDMode="Static">
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
                            <ej:MeasuresItems FieldName="[Measures].[Customer Count]" />
                        </Measures>
                    </ej:Field>
                </Values>
            </DataSource>
        <ClientSideEvents RenderSuccess="onTypeChange" />
    </ej:PivotTreeMap>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3" style="width: 100px; padding-top: 3px; margin-top: 18px">
                    Color Mapping
                </div>
                <div class="col-md-3" style="margin-top: 17px">
                    <select id="mapping">
                        <option value="line" selected="selected">Normal</option>
                        <option value="spline">Range</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var ddlTarget, treemapTarget;
        $(function () {
            $('#mapping').ejDropDownList({
                width: "110px"
            });
            $("#sampleProperties").ejPropertiesPanel();
            ddlTarget = $('#mapping').data("ejDropDownList");
            ddlTarget.selectItemByText(ddlTarget.items[0].innerHTML);
            $("#mapping").ejDropDownList("option", "change", "onTypeChange");
            renderTreeMap = $('#PivotTreeMap1').data("ejPivotTreeMap");
        });
        function onTypeChange(args) {
            treemapTarget = $('#PivotTreeMap1TreeMapContainer').data("ejTreeMap");
            treemapTarget.model.colorValuePath = "";
            treemapTarget.model.enableGradient = false;
            treemapTarget.model.showLegend = false;
            treemapTarget.model.legendSettings.leftLabel = "";
            treemapTarget.model.legendSettings.rightLabel = "";
            treemapTarget.model.rangeColorMapping = [];
            if ((!ej.isNullOrUndefined(ddlTarget)) && ddlTarget._currentText.toLocaleLowerCase() == "range") {
                treemapTarget.model.colorValuePath = "Value";
                treemapTarget.model.rangeColorMapping.push(
                { color: "#a2e2fe", from: "0", to: "10" },
                { color: "#9de24f", from: "11", to: "250" },
                { color: "#ffff66", from: "251", to: "1000" },
                { color: "#C4C24A", from: "1001", to: "3000" },
                { color: "#f6b53f", from: "3001", to: "5000" },
                { color: "#6FAAB0", from: "5001", to: "10000" },
                { color: "#FF0040", from: "10001", to: "20000" }
                )
            }
            else {
                treemapTarget.model.colorValuePath = "Index";
                treemapTarget.model.rangeColorMapping.push(
                { color: "#9de24f", from: "0", to: "0" },
                { color: "#a2e2fe", from: "1", to: "1" },
                { color: "#ffff66", from: "2", to: "2" },
                { color: "#FF0040", from: "3", to: "3" },
                { color: "#f6b53f", from: "4", to: "4" },
                { color: "#6FAAB0", from: "5", to: "5" },
                { color: "#C4C24A", from: "6", to: "6" }
                )
            }
            treemapTarget.refresh();
        }
    </script>
    <!--Tooltip labels can be localized here-->
    <script id="tooltipTemplate" type="application/jsrender"> 
        <div style="background:White; color:black; font-size:12px; font-weight:normal; border: 1px solid #4D4D4D; white-space: nowrap;border-radius: 2px; margin-right: 25px; min-width: 110px;padding-right: 5px; padding-left: 5px; padding-bottom: 2px ;width: auto; height: auto;">
            <div>Measure(s) : {{:~Measures(#data)}}</div><div>Row : {{:~Row(#data)}}</div><div>Column : {{:~Column(#data)}}</div><div>Value : {{:~Value(#data)}}</div>
        </div>
    </script>    
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotTreeMap1 {
            min-height: 275px; 
            min-width: 525px; 
            height: 460px; 
            width: 98%;
            float:left;
        }
        .row .cols-prop-area
        {
            width: 25%;
            min-height: 140px;
        }
        .cols-sample-area{
            overflow:auto;
        }
    </style>
</asp:Content>

