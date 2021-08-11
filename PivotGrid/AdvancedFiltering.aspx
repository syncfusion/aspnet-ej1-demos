<%@ Page Title="PivotGrid-Advanced Filtering-ASP.NET-SYNCFUSION"   Language="C#"  MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control demonstrates filtering of members by their captions and summary values along with sorting" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="AdvancedFiltering.aspx.cs" Inherits="WebSampleBrowser.PivotGrid.OlapAdvancedFilter" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">    
<ej:PivotGrid ID="PivotGrid1" EnableAdvancedFilter="true" EnableGroupingBar="true" runat="server" PivotTableFieldListID="PivotSchemaDesigner1" ClientIDMode="Static">
        <DataSource  >
            <Rows>
                <ej:Field FieldName="Country" FieldCaption="Country"></ej:Field>
                <ej:Field FieldName="State" FieldCaption="State"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Product" FieldCaption="Product"></ej:Field>
            </Columns>
            <Values>
                <ej:Field FieldName="Amount" FieldCaption="Amount"></ej:Field>
                <ej:Field FieldName="Quantity" FieldCaption="Quantity"></ej:Field>
            </Values>
            <Filters>
                <ej:Field FieldName="Date" FieldCaption="Date"></ej:Field>
            </Filters>
        </DataSource>
        <ClientSideEvents Load="onLoad"/>
    </ej:PivotGrid>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
                <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3" style="width:100px"">
                            Data Source
                        </div>
                        <div class="col-md-3">
                            <table>
                                <tr>
                                    <td style="float:left; padding-right:15px">
                                        <input type="radio" name="datasource" id="rdbRelational" checked /><label for="rdbRelational" class="radioBtnLabel">Relational</label>
                                    </td>
                                    <td>
                                        <input type="radio" name="datasource" id="rdbOlap" /><label for="rdbOlap" class="radioBtnLabel">OLAP</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 5px;">
                       <div class="col-md-3" style="width:100px"">
                            Mode
                        </div>
                        <div class="col-md-3">
                            <table>
                                <tr>
                                    <td style="float:left; padding-right:35px">
                                        <input type="radio" name="dataMode" id="rdbClient" checked /><label for="rdbClient" class="clslab">Client</label>
                                    </td>
                                    <td>
                                        <input type="radio" name="dataMode" id="rdbServer" /><label for="rdbServer" class="clslab">Server</label>
                                    </td>
                                </tr>
                            </table>
                         </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                        <button id="ApplyBtn">Apply</button>
                            </div>
                    </div>
                </div>
            </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var btnTarget, relationalRadioBtnObj, olapRadioBtnObj, rdbClient, rdbServer;

        var pivotdataSource = {
            data: pivot_dataset,
            enableAdvancedFilter: true,
            cube: "",
            rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }],
            columns: [{ fieldName: "Product", fieldCaption: "Product" }],
            values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }],
            filters: []
        };
        $(function () {
        $("#rdbRelational,#rdbOlap, #rdbClient, #rdbServer").ejRadioButton();
            $("#languageList").ejDropDownList({
                width: "80px"
            });
            $("#sampleProperties").ejPropertiesPanel();

            $("#ApplyBtn").ejButton({
                roundedCorner: true,
                size: "small",
                type: ej.ButtonType.Button,
                click: "ApplyChanges"
            });
            relationalRadioBtnObj = $('#rdbRelational').data("ejRadioButton");
            olapRadioBtnObj = $('#rdbOlap').data("ejRadioButton");
            rdbClient = $('#rdbClient').data("ejRadioButton");
            rdbServer = $('#rdbServer').data("ejRadioButton");
        });

        function onLoad(args) {
            if (args.model.dataSource.data == null)
                args.model.dataSource.data = pivot_dataset;
        }

        function ApplyChanges(args) {
            var pivotGrid = $('.e-pivotgrid').data("ejPivotGrid");
            var pivotdataSource = {
                data: pivot_dataset, cube: "",
                enableAdvancedFilter: true,
                rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }],
                columns: [{ fieldName: "Product", fieldCaption: "Product" }],
                values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }],
                filters: []
            };
            var olapDataSource = {
                enableAdvancedFilter: true,
                data: "//bi.syncfusion.com/olap/msmdpump.dll",
                catalog: "Adventure Works DW 2008 SE",
                cube: "Adventure Works",
                rows: [{ fieldName: "[Date].[Fiscal]" }],
                columns: [{ fieldName: "[Customer].[Customer Geography]" }],
                values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }],
                filters: []
            };

            $(".e-pivotgrid").remove();
            var gridPanel = ej.buildTag("div#PivotGrid1", "", { "display": "block" })[0].outerHTML;
            $(gridPanel).appendTo(".cols-sample-area");

            if (rdbClient.model.checked) {
                $("#PivotGrid1").ejPivotGrid({
                    dataSource: relationalRadioBtnObj.model.checked ? pivotdataSource : olapRadioBtnObj.model.checked ? olapDataSource : pivotdataSource,
                    enableGroupingBar: true,
                });
            }
            else {
                pivotGrid.model.dataSource = { data: null, cube: "" };
                pivotGrid.model.operationalMode = "servermode";
                $("#PivotGrid1").ejPivotGrid({
                    url:  (relationalRadioBtnObj.model.checked ? "../api/RelationalGrid" : "../wcf/OlapGridservice.svc"),
                    enableGroupingBar: true,
                    enableAdvancedFilter: ( true)
                });
            }

        }
        window.loadPivotGridFrameTheme = function () {
            window.setTimeout(function () {
                var pivotGridElement = $("#PivotGrid1").data("ejPivotGrid");
                if (pivotGridElement && pivotGridElement.model.enableGroupingBar && pivotGridElement.getJSONRecords() != null)
                    pivotGridElement.renderControlFromJSON();
            }, 2500);
        }
        </script>
 </asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .row .cols-sample-area  {
             overflow: auto !important;
             width: 100%
        }
        #PivotGrid1 {
            height: 350px; 
            width:100%;
            overflow: auto;
            float:left;
            margin:20px 0 0 20px;
        }
       .e-pivotschemadesigner {
            width: 40% !important;
            float:right;
        }
        .gridlayout {
            float: left;
            margin-left: -6px;
        }
         #drpdwn_input_wrapper
        {
            width: 60px;
        }
        .row .cols-prop-area
        {
            min-height: 150px;
            width: 40%;
            float:left;
        }
        .radioBtnLabel{
            margin-left:5px;
        }
  .control-panel {
            position: relative;
        }
		@media (min-width: 1920px) {.row .cols-prop-area { width: 24% !important; } }
    </style>
</asp:Content>

