<%@ Page Title="PivotGrid-Frozen Headers-ASP.NET-SYNCFUSION" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid describes how the row and column headers remain frozen while scrolling the value cells." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="FrozenHeaders.aspx.cs" Inherits="WebSampleBrowser.FrozenHeader" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:PivotGrid ID="PivotGrid1" EnableToolTip="false" EnableGroupingBar="false" runat="server">
            <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll">
                <Rows>
                    <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
                    <ej:Field FieldName="[Product].[Product Categories]"></ej:Field>
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
        <FrozenHeaderSettings EnableFrozenHeaders="true"></FrozenHeaderSettings>
        </ej:PivotGrid>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function onLoad(args) {
            args.model.dataSource.data = pivot_dataset;
        }
        var pivotGrid, rdbRelational, rdbOlap, chkFrozenCol, chkFrozenRow;

        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#rdbRelational,#rdbOlap,#rdbclient,#rdbserver").ejRadioButton({ change: "renderPivotGrid" });
            $("#chkFrozenCol, #chkFrozenRow").ejCheckBox({ change: "renderPivotGrid" });
            chkFrozenCol = $("#chkFrozenCol").data("ejCheckBox"); chkFrozenRow = $("#chkFrozenRow").data("ejCheckBox");
            rdbRelational = $('#rdbRelational').data("ejRadioButton"); rdbOlap = $('#rdbOlap').data("ejRadioButton"), rdbClientMode = $('#rdbclient').data("ejRadioButton"); rdbServerMode = $('#rdbserver').data("ejRadioButton");
            pivotGrid = $('#LayoutSection_ControlsSection_PivotGrid1').data("ejPivotGrid");
        });

        function renderPivotGrid(args) {
            $(pivotGrid.element).html("");
            if (rdbRelational.model.checked) {
                pivotGrid.model.dataSource = {
                    data: pivot_dataset, cube: "",
                    rows: [{ fieldName: "State", fieldCaption: "State" }],
                    columns: [{ fieldName: "Country", fieldCaption: "Country" }],
                    values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }],
                    filters: []
                };
                pivotGrid.element.removeAttr("style");
				pivotGrid.element.css({"height": "250px", "width": "100%", "float" :"left"});
				pivotGrid.model.frozenHeaderSettings = { scrollerSize: 18, enableFrozenColumnHeaders: chkFrozenCol.checked(), enableFrozenRowHeaders: chkFrozenRow.checked(), enableFrozenHeaders: (chkFrozenCol.checked() && chkFrozenRow.checked()) ? true : false };
            }
            else {
                pivotGrid.model.dataSource = {
                    data: "//bi.syncfusion.com/olap/msmdpump.dll", catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works",
                    rows: [{ fieldName: "[Customer].[Customer Geography]" }, { fieldName: "[Product].[Product Categories]" }],
                    columns: [{ fieldName: "[Date].[Fiscal]" }],
                    values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }], filters: []
                };
                pivotGrid.element.removeAttr("style");
				pivotGrid.element.css({"height": "300px", "width": "100%", "float" :"left"});
				pivotGrid.model.frozenHeaderSettings = { scrollerSize: 18, enableFrozenColumnHeaders: chkFrozenCol.checked(), enableFrozenRowHeaders: chkFrozenRow.checked(), enableFrozenHeaders: (chkFrozenCol.checked() && chkFrozenRow.checked()) ? true : false };
            }
			if(!chkFrozenCol.checked() && !chkFrozenRow.checked()){
				pivotGrid.element.css("overflow", "auto");
			}
			pivotGrid._currentReportItems = [];
            pivotGrid._load();
        }
        window.loadPivotGridFrameTheme = function () {
            window.setTimeout(function () {
                var pivotGridElement = $(".e-pivotgrid").data("ejPivotGrid");
                if (pivotGridElement && pivotGridElement.getJSONRecords() != null)
                    pivotGridElement.renderControlFromJSON();
            }, 2500);
        }
     </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .e-pivotgrid {
            height: 300px; 
            width: 100%; 
        }
         .row .cols-prop-area {
            margin-top:10px;
            width: 29%;
            height: auto;
            min-height: 80px;
        }
         .row .cols-sample-area {
            width: 70%;
            float:left;
        }
         .radioBtnLabel, .chkBoxLabel {
            margin-left: 5px;
        }
        label {
            font-weight:normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
                <div id="sampleProperties">
                <div class="prop-grid">
                   <div class="row">
                        <table>
                            <tr>
                                <td class="col-md-3" style="width:150px">
                                    DataSource:
                                </td>
                                <td class="col-md-3" style="width:120px">
                                    <input type="radio" name="dataSource" id="rdbOlap" checked="checked" /><label for="rdbOlap" class="radioBtnLabel">OLAP</label>
                                </td>
                                <td class="col-md-3" style="width:120px">
                                    <input type="radio" name="dataSource" id="rdbRelational" /><label for="rdbRelational" class="radioBtnLabel">Relational</label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="row">
                        <div>
                            Frozen Header Settings
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td style="float:left; padding-right:15px">
                                        <input type="checkbox" name="frozenheader" id="chkFrozenCol" checked="checked" /><label for="chkFrozenCol" class="chkBoxLabel">Freeze Column Header</label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style ="float:left; padding-right:15px">
                                        <input type="checkbox" name="frozenheader" id="chkFrozenRow" checked="checked" /><label for="chkFrozenRow" class="chkBoxLabel">Freeze Row Header</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>

