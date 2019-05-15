<%@ Page Title="PivotGrid-Cell Editing-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to edit the value cells at runtime." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CellEditing.aspx.cs" Inherits="WebSampleBrowser.CellEditing" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:PivotGrid ID="PivotGrid1" EnableCellEditing="true" runat="server" ClientIDMode="Static">
        <DataSource>
            <Rows>
                <ej:Field FieldName="Country" FieldCaption="Country"></ej:Field>
                <ej:Field FieldName="State" FieldCaption="State"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Date" FieldCaption="Date"></ej:Field>
                <ej:Field FieldName="Product" FieldCaption="Product"></ej:Field>
            </Columns>
            <Values>
                <ej:Field FieldName="Amount" FieldCaption="Amount"></ej:Field>
                <ej:Field FieldName="Quantity" FieldCaption="Quantity"></ej:Field>
            </Values>
        </DataSource>
        <ClientSideEvents Load="onLoad" />

    </ej:PivotGrid>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var pivotGrid;
        $(function () {
            $("#clientMode, #serverMode").ejRadioButton({ change: "renderGrid" });
            $("#Btn").ejButton({
                roundedCorner: true,
                size: "small",
                type: ej.ButtonType.Button,
                click: "Reset"
            });
            pivotGrid = $("#PivotGrid1").data("ejPivotGrid");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onLoad(args) {
            if (args.model.dataSource.data == null)
                args.model.dataSource.data = pivot_dataset;
        }
        function renderGrid(args) {
            $(pivotGrid.element).html("");
            if (args.model.id == "clientMode") {
                pivotGrid.model.operationalMode = ej.PivotGrid.OperationalMode.ClientMode;
                pivotGrid.model.url = "";
                pivotGrid.setOlapReport(null);
                pivotGrid.model.dataSource = {
                    data: pivot_dataset, cube: "",
                    rows: [{ fieldName: "Country", fieldCaption: "Country"}, { fieldName: "State", fieldCaption: "State" }],
                    columns: [{ fieldName: "Date", fieldCaption: "Date" },{ fieldName: "Product", fieldCaption: "Product" }],
                    values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }],
                    filters:[]
                };
            }
            else {
                pivotGrid.model.dataSource = { data: null, cube: "" };
                pivotGrid.model.operationalMode = ej.PivotGrid.OperationalMode.ServerMode;
                pivotGrid.model.url = "../api/RelationalGrid";
            }
            pivotGrid.refreshPivotGrid();
        }
        function Reset(args)
        {
            pivotGrid.refreshPivotGrid();
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
        .row .cols-sample-area  {
             overflow: auto;
             width: 100%
        }
         .row .cols-prop-area {
            margin-top:10px;
            width: 45%;
            height: auto;
            min-height: 80px;
        }
        label {
            font-weight:normal;
        }
		@media (min-width: 1920px) {.row .cols-prop-area { width: 26% !important; } }
    </style>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
     <div id="sampleProperties">
                <div class="prop-grid">
                   <div class="row">
                        <table>
                            <tr>
                                <td class="col-md-3" style="width:100px">
                                    Mode:
                                </td>
                                <td class="col-md-3" style="width:120px">
                                    <input type="radio" name="dftView" id="clientMode" checked="checked" /><label for="clientMode" class="clslab">Client Mode</label>
                                </td>
                                <td class="col-md-3" style="width:120px">
                                    <input type="radio" name="dftView" id="serverMode" /><label for="serverMode" class="clslab">Server Mode</label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="row">
                        <table>
                            <tr>
                                <td class="col-md-3" style="width:100px">
                                    Editing:
                                </td>
                                <td class="col-md-3" style="width:120px;margin-top:-4px">
                                    <input type="button" id="Btn" value="Reset" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
</asp:Content>


