<%@ Page Title="PivotGrid-Number Formats-ASP.NET-SYNCFUSION"   Language="C#"  MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to change the formats of value field items displayed in the control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="NumberFormats.aspx.cs" Inherits="WebSampleBrowser.SummaryType" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:PivotGrid ID="PivotGrid1" Url="" runat="server" ClientIDMode="Static">
        <DataSource>
            <Rows>
                <ej:Field FieldName="Country" FieldCaption="Country"></ej:Field>
                <ej:Field FieldName="State" FieldCaption="State"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Product" FieldCaption="Product"></ej:Field>
            </Columns>
            <Values>
                <ej:Field FieldName="Amount" FieldCaption="Amount" Format="currency"></ej:Field>
                <ej:Field FieldName="Quantity" FieldCaption="Quantity" Format="decimal"></ej:Field>
            </Values>
        </DataSource>
        <ClientSideEvents Load="onLoad" />

    </ej:PivotGrid>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#Amount").ejDropDownList({
                width: "80px"
            });
            ddlTarget = $('#Amount').data("ejDropDownList");
            ddlTarget.selectItemByText(ddlTarget.items[1].innerHTML);
            $("#Amount").ejDropDownList("option", "change", "onChange");
            $("#Quantity").ejDropDownList({
                width: "80px"
            });
            ddlTarget1 = $('#Quantity').data("ejDropDownList");
            ddlTarget1.selectItemByText(ddlTarget1.items[0].innerHTML);
            $("#Quantity").ejDropDownList("option", "change", "onChange");
            pivotGrid = $('#PivotGrid1').data("ejPivotGrid");

        });
        function onLoad(args) {
            args.model.dataSource.data = pivot_dataset;
        }

        function onChange(args) {
            var selectedValue = this._id;
            $.grep(pivotGrid.model.dataSource.values, function (item) { return item.fieldName == selectedValue; })[0]["format"] = args.text.toLowerCase();
            pivotGrid._populatePivotGrid();
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
            min-height: 140px;
            width: 20%;
            float:right;
        }
        .summarTypes {
            float: left;
            margin-left: -6px;
        }
        .row .cols-sample-area
         {
             float:left;
             width:75%;
         }
        #drpdwn_input_wrapper {
            width: 60px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
                <div id="sampleProperties">
                    <div class="prop-grid content">
                         <div class="row" style="white-space:nowrap; ">
                            <div class="col-md-3;" style="display:table-cell;">
                                Value Representation
                            </div>
                         </div>
                        <div class="row" style=" margin-right: 10px !important;margin-top:10px !important">
                            <div class="col-md-3 aligntop; margin-top:15px">
                                Amount
                            </div>
                            <div class="summarTypes">
                                <select id="Amount">
                                    <option>Decimal</option>
                                    <option>Currency</option>
                                    <option>Percentage</option>
                                    <option>Number</option>
                                    <option>Date</option>
                                    <option>Time</option>
                                    <option>Scientific</option>
                                    <option>Accounting</option>
                                    <option>Fraction</option>
                                </select>
                            </div>

                        </div>
                        <div class="row" style=" margin-right: 10px !important;">
                            <div class="col-md-3 aligntop; margin-top:15px">
                                Quantity
                            </div>
                            <div class="summarTypes">
                                <select id="Quantity">
                                    <option>Decimal</option>
                                    <option>Currency</option>
                                    <option>Percentage</option>
                                    <option>Number</option>
                                    <option>Date</option>
                                    <option>Time</option>
                                    <option>Scientific</option>
                                    <option>Accounting</option>
                                    <option>Fraction</option>
                                </select>
                            </div>

                        </div>
                    </div>
                </div>
</asp:Content>

