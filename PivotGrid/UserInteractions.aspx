<%@ Page Title="PivotGrid-User Interactions-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for ASP.NET pivot grid control describes how to rearrange the fields to change the pivot report and pivot view at runtime." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="UserInteractions.aspx.cs" Inherits="WebSampleBrowser.UserInteractions" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotGrid ID="PivotGrid1" runat="server" ClientIDMode="Static" EnableGroupingBar="true" PivotTableFieldListID="PivotSchemaDesigner">
        <DataSource>
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
        </DataSource>
        <ClientSideEvents Load="onLoad" />
    </ej:PivotGrid>
    <ej:PivotSchemaDesigner ID="PivotSchemaDesigner" runat=server ClientIDMode="Static"></ej:PivotSchemaDesigner>

</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
  <script type="text/javascript">
      var pivotGrid, relationalRadioBtn, olapRadioBtn;
      $(function () {
          $("#sampleProperties").ejPropertiesPanel();
          $("#rdbRelational").ejRadioButton({ checked: true, change: renderGrid });
          $("#rdbOlap").ejRadioButton({ change: renderGrid });
          pivotGrid = $("#PivotGrid1").data("ejPivotGrid");
          relationalRadioBtn = $('#rdbRelational').data("ejRadioButton"); olapRadioBtn = $('#rdbOlap').data("ejRadioButton");
      });
      function onLoad(args) {
          if (args.model.dataSource.data == null)
              args.model.dataSource.data = pivot_dataset;
      }
      function renderGrid(args) {
          var pivotdataSource = {
              data: pivot_dataset, cube: "",
              rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }],
              columns: [{ fieldName: "Product", fieldCaption: "Product" }],
              values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }],
              filters: []
          };
          var olapDataSource = {
              data: "//bi.syncfusion.com/olap/msmdpump.dll", catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works",
              rows: [{ fieldName: "[Date].[Fiscal]" }],
              columns: [{ fieldName: "[Customer].[Customer Geography]" }],
              values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }],
              filters: []
          };
          $(".e-pivotgrid").remove();
          $(".e-pivotschemadesigner").remove();
          var gridPanel = ej.buildTag("div#PivotGrid1", "", { "float": "left", "display": "block" })[0].outerHTML;
          var gridSchemaPanel = ej.buildTag("div#PivotSchemaDesigner", "", { height: "650px", "float": "right", "display": "block" })[0].outerHTML;
          $(gridPanel).appendTo(".cols-sample-area");
          $(gridSchemaPanel).appendTo(".cols-sample-area");

          $("#PivotGrid1").ejPivotGrid({
              dataSource: relationalRadioBtn.model.checked ? pivotdataSource : olapRadioBtn.model.checked ? olapDataSource : pivotdataSource, pivotTableFieldListID: "PivotSchemaDesigner",
              enableGroupingBar: true,
          });
          if (olapRadioBtn.model.checked)
              $("#PivotSchemaDesigner").ejPivotSchemaDesigner({ olap: { showKPI: false, showNamedSets: true } });
          else
              $("#PivotSchemaDesigner").ejPivotSchemaDesigner();
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
        .e-pivotgrid {
            height: 350px; 
            width: 50%; 
            overflow: auto;
            float:left;
        }
		.e-pivotschemadesigner{
		width: 40% !important; 
		}
        .row .cols-prop-area {
            margin-top:30px;
            width: 40%;
            height: 120px;
            min-height: 0px;
        }
         .row .cols-sample-area {
             width: 100%;
         }
		 @media (min-width: 1920px) {.row .cols-prop-area { width: 22% !important; } }
    </style>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
   <div id="sampleProperties">
         <div class="prop-grid">
             <div class="row">
                 <div class="col-md-3" style="width:25%">
                     Data Source
                 </div>
                 <div class="col-md-3" style="width:35%;">
                     <input type="radio" name="dftView" id="rdbRelational" /><label for="rdbRelational" class="clslab">Relational</label>
                 </div>
                 <div class="col-md-3" style="width:35%;">
                     <input type="radio" name="dftView" id="rdbOlap" /><label for="rdbOlap" class="clslab">OLAP</label>
                 </div>
             </div>
         </div>
     </div>
</asp:Content>

