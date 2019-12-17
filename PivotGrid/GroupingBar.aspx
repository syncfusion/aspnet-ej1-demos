<%@ Page Title="PivotGrid-Grouping Bar-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control demonstrates how to group the fields dynamically along with sorting and filtering" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="GroupingBar.aspx.cs" Inherits="WebSampleBrowser.ClientGroupingBar" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:PivotGrid ID="PivotGrid1" EnableGroupingBar="true" runat="server" ClientIDMode="Static" EnableMemberEditorSorting="true">
        <DataSource>
            <Rows>
                <ej:Field FieldName="Country" FieldCaption="Country" SortOrder="Ascending"></ej:Field>
                <ej:Field FieldName="State" FieldCaption="State" SortOrder="Descending"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Product" FieldCaption="Product"></ej:Field>
            </Columns>
            <Values>
                <ej:Field FieldName="Amount" FieldCaption="Amount"></ej:Field>
                <ej:Field FieldName="Quantity" FieldCaption="Quantity"></ej:Field>
            </Values>
            <Filters>
                <ej:Field FieldName="Date" FieldCaption="Date">
                    <FilterItems FilterType="Exclude" />
                </ej:Field>
            </Filters>
        </DataSource>
        <ClientSideEvents Load="onLoad" />

    </ej:PivotGrid>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var pivotGrid;
        $(function () {
            $("#rdbRelational, #rdbOlap").ejRadioButton({ change: "renderGrid" });
            pivotGrid = $("#PivotGrid1").data("ejPivotGrid");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onLoad(args) {
            if (args.model.dataSource.data == null)
                args.model.dataSource.data = pivot_dataset;
        }
        function renderGrid(args) {
            $(pivotGrid.element).html("");
            if (args.model.id == "rdbRelational") {
                pivotGrid.model.dataSource = {
                    data: pivot_dataset, cube: "",
                    rows: [{ fieldName: "Country", fieldCaption: "Country", sortOrder: ej.PivotAnalysis.SortOrder.Ascending }, { fieldName: "State", fieldCaption: "State", sortOrder: ej.PivotAnalysis.SortOrder.Descending }],
                    columns: [{ fieldName: "Product", fieldCaption: "Product" }],
                    values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }],
                    filters: [{ fieldName: "Date", fieldCaption: "Date", filterItems: { filterType: ej.PivotAnalysis.FilterType.Exclude, values: ["FY 2005"] } }]
                };
            }
            else {
                pivotGrid.model.dataSource = {
                    data: "//bi.syncfusion.com/olap/msmdpump.dll", catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works",
                    rows: [{ fieldName: "[Date].[Fiscal]" }],
                    columns: [{ fieldName: "[Customer].[Customer Geography]" }],
                    values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }], filters: []
                };
            }
            pivotGrid._currentReportItems = [];
            pivotGrid._load();
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
        .samplecontent
        {
            padding: 4px;
        }
        .clslab {
            margin-left: 1px !important;
        }
        .row .cols-prop-area
        {
            min-height: 150px;
            width: 18%;
            float:left;
        }
        .row {
            margin-left: 20px;
        }
        .row .cols-sample-area  {
             overflow: auto;
             width: 100%
        }
		@media (min-width: 1920px) {.row .cols-prop-area { width: 12% !important; } }
    </style>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid content">
              <div></div>Data Source:<br\></div>
            <div class="row">
                <div class="col-md-3">
                    <div class="chkrad">
                        <input type="radio" name="dftView" id="rdbRelational" checked="checked" /><label for="rdbRelational" class="clslab">Relational</label>
                      
                        <input type="radio" name="dftView" id="rdbOlap" /><label for="rdbOlap" class="clslab">OLAP</label>
                    </div>
                </div>
            </div>
        </div>
    </div>    
</asp:Content>


