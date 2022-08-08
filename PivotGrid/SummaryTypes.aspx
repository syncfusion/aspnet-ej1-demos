<%@ Page Title="PivotGrid-Summary Types-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control allows changing of aggregation types like maximum, minimum, sum, and average" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SummaryTypes.aspx.cs" Inherits="WebSampleBrowser.SummaryType" %>

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
                <ej:Field FieldName="Amount" FieldCaption="Amount" SummaryType="Average"></ej:Field>
                <ej:Field FieldName="Quantity" FieldCaption="Quantity" SummaryType="TotalSum"></ej:Field>
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
            $.grep(pivotGrid.model.dataSource.values, function (item) { return item.fieldName == selectedValue; })[0]["summaryType"] = args.text.toLowerCase();
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
         .row .cols-sample-area
         {
             float:left;
             width:75%;
         }
        .summarTypes {
            float: left;
            margin-left: -6px;
        }

        #drpdwn_input_wrapper {
            width: 60px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
                <div id="sampleProperties">
                    <div class="prop-grid content">
                        <div class="row" style=" margin-right: 10px !important;">
                            <div class="col-md-3 aligntop; margin-top:15px">
                                Amount
                            </div>
                            <div class="summarTypes">
                                <select id="Amount">
                                    <option>Sum</option>
                                    <option>Average</option>
                                    <option>Count</option>
                                    <option>Min</option>
                                    <option>Max</option>
                                </select>
                            </div>

                        </div>
                        <div class="row" style=" margin-right: 10px !important;">
                            <div class="col-md-3 aligntop; margin-top:15px">
                                Quantity
                            </div>
                            <div class="summarTypes">
                                <select id="Quantity">
                                    <option>Sum</option>
                                    <option>Average</option>
                                    <option>Count</option>
                                    <option>Min</option>
                                    <option>Max</option>
                                </select>
                            </div>

                        </div>
                    </div>
                </div>
</asp:Content>

