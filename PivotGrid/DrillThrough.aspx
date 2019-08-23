<%@ Page Title="PivotGrid-Drill Through-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to view the raw data besides each value cell" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DrillThrough.aspx.cs" Inherits="WebSampleBrowser.PivotGrid.DrillThrough" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:PivotGrid ID="PivotGrid1" EnableGroupingBar="true" EnableDrillThrough="true" runat="server" ClientIDMode="Static">
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
                <ej:Field FieldName="Price" FieldCaption="Price"></ej:Field>
            </Values>
        </DataSource>
        <ClientSideEvents Load="onLoad" DrillThrough="drillData" />

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
            if (args.model.dataSource.data == null)
                args.model.dataSource.data = pivot_dataset;
        }
        function renderGrid(args) {
            $(pivotGrid.element).html("");
            if (args.model.id == "rdbClient") {
                pivotGrid.model.url = "";
                pivotGrid.model.operationalMode = "clientmode";
                pivotGrid.model.dataSource = {
                    data: pivot_dataset, cube: "",
                    rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }],
                    columns: [{ fieldName: "Product", fieldCaption: "Product" }],
                    values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }],
                    filters:[]
                };
            }
            else {
                pivotGrid.model.dataSource = { data: null, cube: "" };
                pivotGrid.model.operationalMode = "servermode";
                pivotGrid.model.url = "../api/RelationalGrid";
            }
            pivotGrid._tempFilterData = [];
            pivotGrid._load();
        }
        function drillData(args) {
            gridData = args.selectedData;
            var dialogContent = ej.buildTag("div#Grid", { height: "50px" })[0].outerHTML;
            ejDialog = ej.buildTag("div#clientDialog.clientDialog", dialogContent, { "opacity": "1", "overflow":"auto" }).attr("title", "Drill Through Information")[0].outerHTML;
            $(ejDialog).appendTo("#" + this._id);
            this.element.find(".clientDialog").ejDialog({ width: "70%", height: "auto", content: "#" + this._id, enableResize: false, close: ej.proxy(ej.Pivot.closePreventPanel, this) });

            $("#Grid").ejGrid({
                dataSource: gridData,
            });

        }
	 window.loadPivotGridFrameTheme = function () {
            window.setTimeout(function () {
              var  pivotGridElement = $("#PivotGrid1").data("ejPivotGrid");
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
        .clientDialog {
        max-height:250px;
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


