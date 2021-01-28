<%@ Page Title="PivotGrid-Excel-like Layout-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control shows the control in excel-like layout." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ExcelLikeLayout.aspx.cs" Inherits="WebSampleBrowser.ExcelLikeLayout" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotGrid ID="PivotGrid1" EnableGroupingBar="true" runat="server" Layout="ExcelLikeLayout" ClientIDMode="Static">
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
                                <table>
                                    <tr>
                                        <td class="chkrad">
                                            Data Source : 
                                        </td>
                                        <td class="chkrad">
                                            <input type="radio" name="dataSource" id="rdbRelational" checked /><label for="rdbRelational" class="clslab">Relational</label>
                                        </td>
                                        <td class="chkrad" colspan="2">
                                            <input type="radio" name="dataSource" id="rdbOlap" /><label for="rdbOlap" class="clslab">OLAP</label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        <div class="row" style="margin-top: 5px;">
                            <table>
                                <tr>
                                    <td class=" chkrad">
                            Mode :
                            </td>
                            <td class="chkrad">
                                <input type="radio" name="dataMode" id="rdbClient" checked /><label for="rdbClient" class="clslab">Client</label>
                            </td>
                            <td class="chkrad" colspan="2">
                                <input type="radio" name="dataMode" id="rdbServer" /><label for="rdbServer" class="clslab">Server</label>
                            </td>
                            </tr>
                            </table>
                       </div>
                   </div>
              </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
          <script type="text/javascript">
              var btnTarget, rdbRelational, rdbOlap, rdbClient, rdbServer, pGridObj;
              $(function () {
                  $("#sampleProperties").ejPropertiesPanel();
                  $("#rdbRelational,#rdbOlap,#rdbClient,#rdbServer").ejRadioButton({ change: "renderPivotGrid" });
                  rdbRelational = $('#rdbRelational').data("ejRadioButton"); rdbOlap = $('#rdbOlap').data("ejRadioButton"); rdbClient = $('#rdbClient').data("ejRadioButton"); rdbServer = $('#rdbServer').data("ejRadioButton");
                  pGridObj = $('#PivotGrid1').data("ejPivotGrid");
              });
              function onLoad(args) {
                  if (args.model.dataSource.data == null)
                      args.model.dataSource.data = pivot_dataset;
              }
              function renderPivotGrid(args) {
                  $(pGridObj.element).html("");
                  if (rdbClient.model.checked) {
                      pGridObj.model.operationalMode = "clientmode";
                      var pivotdataSource = { data: pivot_dataset, cube: "", rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }], columns: [{ fieldName: "Product", fieldCaption: "Product" }], values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }], filters: [] };
                      var olapDataSource = { data: "//bi.syncfusion.com/olap/msmdpump.dll", catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works", rows: [{ fieldName: "[Date].[Fiscal]" }], columns: [{ fieldName: "[Customer].[Customer Geography]" }], values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }], filters: [] };
                      pGridObj.model.dataSource = rdbRelational.model.checked ? pivotdataSource : rdbOlap.model.checked ? olapDataSource : pivotdataSource;
                      pGridObj.model.url = "";
                  }
                  else {
                      pGridObj.model.dataSource = { data: null, cube: "" };
                      pGridObj.model.operationalMode = "servermode";
                      pGridObj.model.url = rdbRelational.model.checked ? "../api/RelationalGrid" : "../api/OlapGrid";
                  }
                  pGridObj._excelLikeJSONRecords = null;
                  pGridObj._currentReportItems = [];
                  pGridObj._tempFilterData = [];
                  pGridObj._load();
              }
        window.loadPivotGridFrameTheme = function () {
            window.setTimeout(function () {
                pivotGridElement = $("#PivotGrid1").data("ejPivotGrid");
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
        .row .cols-sample-area{
            width:100%;
        }
       .cols-prop-area .content {
            width: auto;
        }
        .row .cols-prop-area {
            min-height: 120px;
            width: auto;
        }
    </style>
</asp:Content>

