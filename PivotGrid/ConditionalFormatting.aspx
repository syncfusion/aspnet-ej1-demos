<%@ Page Title="PivotGrid-Conditional Formatting-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to format the appearance of value cells based on applied conditions" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ConditionalFormatting.aspx.cs" Inherits="WebSampleBrowser.PivotGrid.ConditionalFormatting" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
   <ej:PivotGrid ID="PivotGrid1" IsResponsive="true" runat="server" OnServerExcelExporting="PivotGrid_ServerExcelExporting" OnServerPDFExporting="PivotGrid_ServerPDFExporting" OnServerWordExporting="PivotGrid_ServerWordExporting" ClientIDMode="Static" EnableConditionalFormatting="true">
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
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                    <div class="col-md-3">
                        Conditional Formatting:
                    </div>
                <input type="button" id="Btn1" value="Apply" />
                <input type="button" id="Btn2" value="Reset" />
            </div>
            <div class="row" style="margin-top: 5px;">
                <table>
                    <tr>
                        <td class="chkrad">
                        Export To :
                        </td>
                        <td class="chkrad" colspan="2">
                            <select id="drpdwn">
                                <option value="excel">Excel</option>
                                <option value="word">Word</option>
                                <option value="pdf">PDF</option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
       </div>
   </div>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript" class="jsScript">
        function onLoad(args) {
            args.model.dataSource.data = pivot_dataset;
        }
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#Btn1").ejButton({
                roundedCorner: true,
                size: "small",
                type: ej.ButtonType.Button,
                click: "ApplyChanges"
            });
            $("#Btn2").ejButton({
                roundedCorner: true,
                size: "small",
                type: ej.ButtonType.Button,
                click: "Reset"
            });
            $('#drpdwn').ejDropDownList({ selectedIndex: null, change: "exportPivotGrid" });
            pGridObj = $('#PivotGrid1').data("ejPivotGrid");
        });
        function ApplyChanges() {
            var pivotGridObj = $('#PivotGrid1').data("ejPivotGrid");
            if (pivotGridObj.model.enableConditionalFormatting) {
                pivotGridObj.openConditionalFormattingDialog();
            }
            else {
                alert("Please set conditional Formatting as True");
            }
        }
        function exportPivotGrid(args) {
			var pGridObj = $('#PivotGrid1').data("ejPivotGrid");
            var dropDownObj = $('#drpdwn').data("ejDropDownList");
            var exportOption = dropDownObj.model.value;
                if (exportOption == "excel")
                    pGridObj.exportPivotGrid("excelExport", "fileName");
                else if (exportOption == "word")
                    pGridObj.exportPivotGrid("wordExport", "fileName");
                else if (exportOption == "pdf")
                    pGridObj.exportPivotGrid("pdfExport", "fileName");
        }
        function Reset() {
                        var pivotGridObj = $('#PivotGrid1').data("ejPivotGrid");
                        pivotGridObj._removeCellFormatting(true, false);
                        pivotGridObj._list = ["Add New"];
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
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotGrid1 {
            height: 350px; 
            width: 100%; 
            overflow: auto;
            float:left;
        }
        .row .cols-prop-area {
            min-height: 140px;
            width:25%;
        }

        .row .cols-sample-area {
            width: 72%;
        }
        #Btn2{
            margin-top:15px;
        }
		@media (min-width: 1920px) {.chkrad { width: 178px !important; } #Btn2{ margin-top:0px; } }

    </style>
</asp:Content>

