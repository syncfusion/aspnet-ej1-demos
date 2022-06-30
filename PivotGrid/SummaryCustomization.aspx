<%@ Page Title="PivotGrid-Summary Customization-ASP.NET-SYNCFUSION" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how the grand total and subtotal values can be hidden at runtime" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SummaryCustomization.aspx.cs" Inherits="WebSampleBrowser.SummaryCustomization" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:PivotGrid ID="PivotGrid1" EnableGroupingBar="true" EnableRowGrandTotal="false" runat="server" ClientIDMode="Static">
        <DataSource>
            <Rows>
                <ej:Field FieldName="Date" FieldCaption="Date"></ej:Field>
                <ej:Field FieldName="Product" FieldCaption="Product"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Country" FieldCaption="Country"></ej:Field>
                <ej:Field FieldName="State" FieldCaption="State"></ej:Field>
            </Columns>
            <Values>
                <ej:Field FieldName="Amount" FieldCaption="Amount" ></ej:Field>
                <ej:Field FieldName="Quantity" FieldCaption="Quantity"></ej:Field>
            </Values>
        </DataSource>
        <ClientSideEvents Load="onLoad" AfterServiceInvoke="refreshGrid"/>
    </ej:PivotGrid>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function onLoad(args) {
            if (args.model.dataSource.data == null)
            args.model.dataSource.data = pivot_dataset;
        }
        var rdbRelational, rdbOlap, rdbClientMode, rdbServerMode, rdbRowHide, rdbColumnHide, rdbHideAll, pivotGrid;

        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#rdbRelational,#rdbOlap,#rdbclient,#rdbserver,#hiderowgdtot,#hidecolumngdtot,#hidegdtot").ejRadioButton({ change: "renderPivotGrid" });
            rdbRelational = $('#rdbRelational').data("ejRadioButton"); rdbOlap = $('#rdbOlap').data("ejRadioButton"), rdbClientMode = $('#rdbclient').data("ejRadioButton"); rdbServerMode = $('#rdbserver').data("ejRadioButton"); rdbRowHide = $('#hiderowgdtot').data("ejRadioButton"); rdbColumnHide = $('#hidecolumngdtot').data("ejRadioButton"); rdbHideAll = $('#hidegdtot').data("ejRadioButton");
            pivotGrid = $('#PivotGrid1').data("ejPivotGrid");
            $("#Row,#Column").ejDropDownList({
                watermarkText: "Hide SubTotals",
                showCheckbox: true,
                width: "150px"
            });
            ddlTarget = $('#Row').data("ejDropDownList");
            $("#Row").ejDropDownList("option", "change", "onChange");
        });

        function onChange(args) {
            var selectedValues = this.target.value.split(",");
            pivotGrid = $('#PivotGrid1').data("ejPivotGrid");
            if (rdbRelational.model.checked && rdbClientMode.model.checked) {
                if (pivotGrid.model.dataSource.rows.length > 0)
                    $.each(pivotGrid.model.dataSource.rows, function (e, item) { if (item.fieldName.length > 0) item["showSubTotal"] = true; });
                if (pivotGrid.model.dataSource.columns.length > 0)
                    $.each(pivotGrid.model.dataSource.columns, function (e, item) { if (item.fieldName.length > 0) item["showSubTotal"] = true; });
                $.each(selectedValues, function (e, selectedValue) {
                    if (pivotGrid.model.dataSource.rows.length > 0)
                        $.each(pivotGrid.model.dataSource.rows, function (e, item) { if (item.fieldName.length > 0 && item.fieldName == selectedValue) item["showSubTotal"] = false; });
                    if (pivotGrid.model.dataSource.columns.length > 0)
                        $.each(pivotGrid.model.dataSource.columns, function (e, item) { if (item.fieldName.length > 0 && item.fieldName == selectedValue) item["showSubTotal"] = false; });
                });
                pivotGrid._populatePivotGrid();
            }
            else {
                if ($.type(pivotGrid.getOlapReport()) === "string") {
                    var dataSource = JSON.parse(pivotGrid.getOlapReport())
                    if (dataSource.PivotRows.length > 0)
                        $.each(dataSource.PivotRows, function (e, item) { if (item.FieldName.length > 0) item["showSubTotal"] = true; });
                    if (dataSource.PivotColumns.length > 0)
                        $.each(dataSource.PivotColumns, function (e, item) { if (item.FieldName.length > 0) item["showSubTotal"] = true; });
                    $.each(selectedValues, function (e, selectedValue) {
                        if (dataSource.PivotRows.length > 0)
                            $.each(dataSource.PivotRows, function (e, item) { if (item.FieldName.length > 0 && item.FieldName == selectedValue) item["showSubTotal"] = false; });
                        if (dataSource.PivotColumns.length > 0)
                            $.each(dataSource.PivotColumns, function (e, item) { if (item.FieldName.length > 0 && item.FieldName == selectedValue) item["showSubTotal"] = false; });
                    });
                    pivotGrid.setOlapReport(JSON.stringify(dataSource));
                    pivotGrid.setJSONRecords(JSON.stringify(pivotGrid.getJSONRecords()));
                    pivotGrid.renderControlFromJSON(JSON.stringify(pivotGrid.getJSONRecords()));
                }
            }
        }

        function refreshGrid(args) {
            pivotGrid = $('#PivotGrid1').data("ejPivotGrid");
            if (this.model.operationalMode == "servermode" && this.model.analysisMode == "pivot") {
                selectedValues = ddlTarget.target.value.split(",");
                if (rdbRelational.model.checked && rdbServerMode.model.checked) {
                    var dataSource = JSON.parse(pivotGrid.getOlapReport());
                    if (dataSource.PivotRows.length > 0)
                        $.each(dataSource.PivotRows, function (e, item) { if (item.FieldName != "") item["showSubTotal"] = true; });
                    if (dataSource.PivotColumns.length > 0)
                        $.each(dataSource.PivotColumns, function (e, item) { if (item.FieldName != "") item["showSubTotal"] = true; });
                    $.each(selectedValues, function (e, selectedValue) {
                        if (dataSource.PivotRows.length > 0)
                            $.each(dataSource.PivotRows, function (e, item) { if (item.FieldName != "" && item.FieldName == selectedValue) item["showSubTotal"] = false; });
                        if (dataSource.PivotColumns.length > 0)
                            $.each(dataSource.PivotColumns, function (e, item) { if (item.FieldName != "" && item.FieldName == selectedValue) item["showSubTotal"] = false; });
                    });
                    this.setOlapReport(JSON.stringify(dataSource));
                    this.setJSONRecords(JSON.stringify(this.getJSONRecords()));
                    if (args.action != "fetchMembers")
                        this.renderControlFromJSON(JSON.stringify(this.getJSONRecords()));
                }
            }
        }
        function renderPivotGrid(args) {
            var pivotdataSource = { data: pivot_dataset, cube: "", rows: [{ fieldName: "Date", fieldCaption: "Date" }, { fieldName: "Product", fieldCaption: "Product" }], columns: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }], values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }], filters: [] };
            var olapDataSource = { data: "//bi.syncfusion.com/olap/msmdpump.dll", catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works", rows: [{ fieldName: "[Date].[Fiscal]" }], columns: [{ fieldName: "[Customer].[Customer Geography]" }], values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }], filters: [] };
            $(pivotGrid.element).html("");
            if (rdbClientMode.model.checked) {
                if (rdbRelational.model.checked)
                    $(".sourcefield").css("display", "");
                else
                    $(".sourcefield").css("display", "none");
                pivotGrid.model.dataSource = rdbRelational.model.checked ? pivotdataSource : rdbOlap.model.checked ? olapDataSource : pivotdataSource;
                pivotGrid.model.enableGroupingBar = true;
                pivotGrid.model.url = "";
            }
            else {
                if (rdbRelational.model.checked) {
                    $(".sourcefield").css("display", "");
                    $(".grandtot").css("display", "");
                }
                else
                    $(".sourcefield").css("display", "none");
                pivotGrid.model.dataSource = { data: null, cube: "" };
                pivotGrid.model.analysisMode = rdbRelational.model.checked ? "pivot" : "olap";
                pivotGrid.model.operationalMode = "servermode";
                pivotGrid.model.url = rdbRelational.model.checked ? "../api/RelationalGrid" : "../api/OlapGrid";
                pivotGrid.model.enableGroupingBar = true;
            }
            if (rdbRowHide.model.checked) {
                pivotGrid.model.enableColumnGrandTotal = pivotGrid.model.enableGrandTotal = true;
                pivotGrid.model.enableRowGrandTotal = false;
            }
            else if (rdbColumnHide.model.checked) {
                pivotGrid.model.enableRowGrandTotal = pivotGrid.model.enableGrandTotal = true;
                pivotGrid.model.enableColumnGrandTotal = false;
            }
            else {
                pivotGrid.model.enableRowGrandTotal = pivotGrid.model.enableColumnGrandTotal = true;
                pivotGrid.model.enableGrandTotal = false;
            }
            pivotGrid._tempFilterData = [];
            pivotGrid._load();
            ddlTarget.unCheckAll();
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
        #PivotGrid1 {
            height: 350px; 
            width: 100%; 
            overflow: auto;
            float:left;
        }
         .row .cols-prop-area {
            margin-top:10px;
            width: 60%;
            height: auto;
            min-height: 80px;
        }
        .radioBtnLabel {
            margin-left: 5px;
        }
        #Column_wrapper {
            margin-left: 110px;
        }
        label {
            font-weight:normal;
        }
		@media (min-width: 1920px) {.row .cols-prop-area { width: 33% !important; } }
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
                                    <input type="radio" name="dataSource" id="rdbRelational" checked="checked" /><label for="rdbRelational" class="radioBtnLabel">Relational</label>
                                </td>
                                <td class="col-md-3" style="width:120px">
                                    <input type="radio" name="dataSource" id="rdbOlap" /><label for="rdbOlap" class="radioBtnLabel">OLAP</label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-3" style="width:150px">
                            Mode:
                        </div>
                        <div class="col-md-3" style="width:120px">
                            <input type="radio" name="datasource" id="rdbclient" checked="checked" /><label for="rdbRelational" class="radioBtnLabel">Client Mode</label>
                        </div>
                        <div class="col-md-3" style="width:120px">
                            <input type="radio" name="datasource" id="rdbserver" /><label for="rdbOlap" class="radioBtnLabel">Server Mode</label>
                        </div>
                    </div>
                    <div class="row grandtot">
                        <div class="col-md-3" style="width:150px">
                            Hide GrandTotal:
                        </div>
                        <div class="col-md-3" style="width:120px">
                            <input type="radio" name="hidetotal" id="hiderowgdtot" checked="checked" /><label for="rdbRelational" class="radioBtnLabel">Row</label>
                        </div>
                        <div class="col-md-3" style="width:120px">
                            <input type="radio" name="hidetotal" id="hidecolumngdtot" /><label for="rdbOlap" class="radioBtnLabel">Column</label>
                        </div>
                        <div class="col-md-3" style="width:80px">
                            <input type="radio" name="hidetotal" id="hidegdtot" /><label for="rdbOlap" class="radioBtnLabel">Both</label>
                        </div>
                    </div>
                    <div class="row sourcefield">
                        <div class="col-md-3" style="width:150px">
                            Hide SubTotal:
                        </div>
                        <div class="col-md-3">
                            <div class="row" style="padding:0; margin-top:-5px">
                                <select id="Row">
                                    <option value="Date">Date</option>
                                    <option value="Product">Product</option>
                                    <option value="Country">Country</option>
                                    <option value="State">State</option>
                                </select>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>

