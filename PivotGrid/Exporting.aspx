<%@ Page Title="PivotGrid-Exporting-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample for Syncfusion Essential JS1 for ASP.NET pivot grid control demonstrates exporting to Microsoft Excel, CSV, and PDF formats." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Exporting.aspx.cs" Inherits="WebSampleBrowser.Exporting" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotGrid ID="PivotGrid1" runat="server" OnServerExcelExporting="PivotGrid_ServerExcelExporting" OnServerPDFExporting="PivotGrid_ServerPDFExporting" OnServerWordExporting="PivotGrid_ServerWordExporting" OnServerCSVExporting="PivotGrid_ServerCSVExporting" ClientIDMode="Static" EnableRowGrandTotal="false">
        <DataSource>
            <Rows>
                <ej:Field FieldName="Country" FieldCaption="Country" ShowSubTotal="False"></ej:Field>
                <ej:Field FieldName="State" FieldCaption="State" ShowSubTotal="False"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Product" FieldCaption="Product" ShowSubTotal="False"></ej:Field>
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
                        <div class="row" style="margin-top: 5px;">
                            <table>
                                <tr>
                                    <td class="chkrad">
                                        Export Option :
                                    </td>
                                    <td class="chkrad" colspan="2">
                                        <select id="drpdwn">
                                            <option value="excel">Excel</option>
                                            <option value="word">Word</option>
                                            <option value="pdf">PDF</option>
                                            <option value="csv">CSV</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="row" style="margin:20px 0px 10px 20px">
                            <button id="btnExport" value="Export" name="Export" title="Export">Export</button>
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
                  $('#drpdwn').ejDropDownList({ selectedIndex: 0 });
                  $("#btnExport").ejButton({ roundedCorner: true, size: "small", type: ej.ButtonType.Button, click: "exportPivotGrid" });
                  rdbRelational = $('#rdbRelational').data("ejRadioButton"); rdbOlap = $('#rdbOlap').data("ejRadioButton"); rdbClient = $('#rdbClient').data("ejRadioButton"); rdbServer = $('#rdbServer').data("ejRadioButton");
                  pGridObj = $('#PivotGrid1').data("ejPivotGrid");
              });
              function onLoad(args) {
                  if (args.model.dataSource.data == null)
                      args.model.dataSource.data = pivot_dataset;
              }
              function exportPivotGrid(args) {
                  var dropDownObj = $('#drpdwn').data("ejDropDownList");
                  var exportOption = dropDownObj.model.value;
                  if (exportOption == "excel")
                      pGridObj.exportPivotGrid("excelExport", "fileName");
                  else if (exportOption == "word")
                      pGridObj.exportPivotGrid("wordExport", "fileName");
                  else if (exportOption == "pdf")
                      pGridObj.exportPivotGrid("pdfExport", "fileName");
                  else
                      pGridObj.exportPivotGrid("csvExport", "fileName");
              }
              function renderPivotGrid(args) {
                  $(pGridObj.element).html("");
                  if (rdbClient.model.checked) {
                      var pivotdataSource = { data: pivot_dataset, cube: "", rows: [{ fieldName: "Country", fieldCaption: "Country", showSubTotal: false, }, { fieldName: "State", fieldCaption: "State", showSubTotal: false, }], columns: [{ fieldName: "Product", fieldCaption: "Product", showSubTotal: false, showSubTotal: false, }], values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }], filters: []};
                      var olapDataSource = { data: "//bi.syncfusion.com/olap/msmdpump.dll", catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works", rows: [{ fieldName: "[Date].[Fiscal]" }], columns: [{ fieldName: "[Customer].[Customer Geography]" }], values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }], filters: [] };
                      pGridObj.model.dataSource = rdbRelational.model.checked ? pivotdataSource : rdbOlap.model.checked ? olapDataSource : pivotdataSource;
                      pGridObj.model.enableRowGrandTotal = false;
                      pGridObj.model.url = "";
                      pGridObj.model.operationalMode = "clientmode";
                  }
                  else {
                      pGridObj.model.dataSource = { data: null, cube: "" };
                      pGridObj.model.operationalMode = "servermode";
                      pGridObj.model.url = rdbRelational.model.checked ? "../api/RelationalGrid" : "../api/OlapGrid";
                      pGridObj.model.enableRowGrandTotal = false;
                  }
                  pGridObj._load();
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
        .row .cols-sample-area{
            width:100%;
        }
       .cols-prop-area .content {
            width: auto;
        }
        .row .cols-prop-area {
            min-height: 210px;
            width: auto;
        }
        #btnExport{
            margin-left:170px;
        }
    </style>
</asp:Content>

