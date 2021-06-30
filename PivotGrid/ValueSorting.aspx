<%@ Page Title="PivotGrid-Value Sorting-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to sort the column values in column axis" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ValueSorting.aspx.cs" Inherits="WebSampleBrowser.ValueSorting" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:PivotGrid ID="PivotGrid1" EnableGroupingBar="true" runat="server" ClientIDMode="Static">
        <DataSource>
            <Rows>
                <ej:Field FieldName="Date" FieldCaption="Date"></ej:Field>
                <ej:Field FieldName="Product" FieldCaption="Product"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Country" FieldCaption="Country" ></ej:Field>
                <ej:Field FieldName="State" FieldCaption="State" ></ej:Field>
            </Columns>
            <Values>
                <ej:Field FieldName="Amount" FieldCaption="Amount"></ej:Field>
            </Values>
        </DataSource>
        <ValueSortSettings HeaderText="Canada##Alberta##Amount" HeaderDelimiters="##" SortOrder="Descending" />
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
            args.model.dataSource.data = pivotData;
        }

        function renderGrid(args) {
            pivotGrid.model.valueSortSettings.headerText = "Canada##Alberta##Amount";
            pivotGrid.model.valueSortSettings.headerDelimiters = "##";
            pivotGrid.model.valueSortSettings.sortOrder = ej.PivotAnalysis.SortOrder.Descending;
            $(pivotGrid.element).html("");
            if (args.model.id == "rdbClient") {
                pivotGrid.model.url = "";
                pivotGrid.model.operationalMode = "clientmode";
                pivotGrid._calculatedField = [];
                pivotGrid.model.dataSource = {
                    data: pivotData, cube: "",
                    rows: [{ fieldName: "Date", fieldCaption: "Date" }, { fieldName: "Product", fieldCaption: "Product" }],
                    columns: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }],
                    values: [{ fieldName: "Amount", fieldCaption: "Amount" }],
                    filters: []
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
		 @media (min-width: 1920px) {.row .cols-prop-area { width: 26% !important; } }
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


