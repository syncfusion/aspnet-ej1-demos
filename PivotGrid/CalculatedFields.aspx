<%@ Page Title="PivotGrid-Calculated Fields-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for ASP.NET pivot grid control shows adding a new calculated field (unbound/user-defined field) with other fields and basic arithmetic formula" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CalculatedFields.aspx.cs" Inherits="WebSampleBrowser.CalculatedField" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:PivotGrid ID="PivotGrid1" EnableGroupingBar="true" runat="server" ClientIDMode="Static">
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
                <ej:Field FieldName="Price" FieldCaption="Price" IsCalculatedField="true" Formula="Amount * 5"></ej:Field>
            </Values>
        </DataSource>
        <ClientSideEvents Load="onLoad" />

    </ej:PivotGrid>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#rdbServer, #rdbClient").ejRadioButton({ change: "renderGrid" });
            pivotGrid = $("#PivotGrid1").data("ejPivotGrid");
        });
        function onLoad(args) {
            args.model.dataSource.data = pivot_dataset;
            args.model.customObject = { isCalculatedField: true };
        }

        function renderGrid(args) {
            $(pivotGrid.element).html("");
            if (args.model.id == "rdbClient") {
                pivotGrid.model.url = "";
                pivotGrid.model.operationalMode = "clientmode";
                pivotGrid._calculatedField = [];
                pivotGrid.model.dataSource = {
                    data: pivot_dataset, cube: "",
                    rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }],
                    columns: [{ fieldName: "Product", fieldCaption: "Product" }],
                    values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Price", fieldCaption: "Price", isCalculatedField: true, formula: "Amount * Quantity" }, { fieldName: "Quantity", fieldCaption: "Quantity" }],
                    filters:[]
                };
            }
            else {
                pivotGrid.model.dataSource = { data: null, cube: "" };
                pivotGrid.model.operationalMode = "servermode";
                pivotGrid._calculatedField = [];
                pivotGrid.model.url = "../api/RelationalGrid";
            }
            pivotGrid._tempFilterData = [];
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
                .row .cols-prop-area {
            margin-top:30px;
            width: 30%;
            height: 120px;
            min-height: 0px;
        }
         .row .cols-sample-area {
             width: 100%;
         }
		 @media (min-width: 1920px) {.row .cols-prop-area { width: 21% !important; } }
    </style>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
     <div id="sampleProperties">
         <div class="prop-grid">
             <div class="row">
                 <div class="col-md-3" style="width:20%">
                     Mode :
                 </div>
                 <div class="col-md-3" style="width:30%">
                     <input type="radio" name="dftView" id="rdbClient" checked="checked" /><label for="rdbClient" class="clslab">Client</label>
                 </div>
                 <div class="col-md-3" style="width:30%">
                     <input type="radio" name="dftView" id="rdbServer" /><label for="rdbServer" class="clslab">Server</label>
                 </div>
             </div>
         </div>
     </div>
</asp:Content>


