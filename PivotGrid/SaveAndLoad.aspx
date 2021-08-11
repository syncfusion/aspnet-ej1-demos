<%@ Page Title="PivotGrid-Save and Load-ASP.NET-SYNCFUSION" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to save and load pivot reports to the local web browser" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SaveAndLoad.aspx.cs" Inherits="WebSampleBrowser.SaveLoadReport" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotGrid ID="PivotGrid1" runat="server" EnableGroupingBar="true" ClientIDMode="Static">
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
                                        DataSource:
                                    </td>
                                    <td class="chkrad">
                                        <input type="radio" name="dataSource" id="rdbRelational" checked="checked" /><label for="rdbRelational" class="radioBtnLabel">Relational</label>
                                    </td>
                                    <td class="chkrad" colspan="2">
                                        <input type="radio" name="dataSource" id="rdbOlap" /><label for="rdbOlap" class="radioBtnLabel">OLAP</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="row" style="margin-top: 5px;">
                            <table>
                                <tr>
                                    <td class=" chkrad">
                                        Mode:
                                    </td>
                                    <td class="chkrad">
                                        <input type="radio" name="dataMode" id="rdbClient" checked /><label for="rdbClient" class="radioBtnLabel">Client</label>
                                    </td>
                                    <td class="chkrad" colspan="2">
                                        <input type="radio" name="dataMode" id="rdbServer" /><label for="rdbServer" class="radioBtnLabel">Server</label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="row" >
                            <table cellspacing="10">
                                <tr class="savereport">
                                    <td class=" chkrad">
                                        Save Report:
                                    </td>
                                    <td class=" chkrad">
                                        <input id="savedreport" type="text" />
                                    </td>
                                    <td class=" chkrad">
                                        <button id="btnSave" value="Save" name="Save" title="Save">Save</button>
                                    </td>
                                </tr>
                                <tr class="loadreport">
                                    <td class=" chkrad">
                                        Load Report:
                                    </td>
                                    <td class=" chkrad">
                                        <input type="text" id="drpdwn" />
                                    </td>
                                    <td class=" chkrad">
                                        <button id="btnLoad" value="Load" name="Load" title="Load">Load</button>
                                    </td>
                                </tr>
                            </table>
                    </div>
                </div>
            </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
          <script type="text/javascript">
              var btnTarget, rdbRelational, rdbOlap, rdbClient, rdbServer, pGridObj, relationalclientrptmode = [], olapclientrptmode = [], relationalserverrptmode = [], olapserverrptmode = [], datasource = [];

              $(function () {
                  $("#sampleProperties").ejPropertiesPanel();
                  $("#rdbRelational,#rdbOlap,#rdbClient,#rdbServer").ejRadioButton({ change: "renderPivotGrid" });
                  $("#btnSave").ejButton({ type: "button", roundedCorner: true, size: "small", click: "save" });
                  $("#btnLoad").ejButton({ type: "button", roundedCorner: true, size: "small", click: "load" });
                  rdbRelational = $('#rdbRelational').data("ejRadioButton"); rdbOlap = $('#rdbOlap').data("ejRadioButton"); rdbClient = $('#rdbClient').data("ejRadioButton"); rdbServer = $('#rdbServer').data("ejRadioButton");
                  pGridObj = $('#PivotGrid1').data("ejPivotGrid");
                  $("#savedreport").ejMaskEdit({ name: "mask", inputMode: ej.InputMode.Text, watermarkText: "Save Report", width: "70%" });
                  $('#drpdwn').ejDropDownList({ dataSource: [], targetID: "drpdwn", watermarkText: "Load Report", width: "70%" });
              });
              function onLoad(args) {
                  if (args.model.dataSource.data == null)
                      args.model.dataSource.data = pivot_dataset;
              }
              function save() {
                  var obj; isDuplicate = false, mode = null, reportCollection = [relationalclientrptmode, olapclientrptmode, relationalserverrptmode, olapserverrptmode];
                  var savedreport = $("#savedreport").data("ejMaskEdit");
                  if (rdbRelational.model.checked && rdbClient.model.checked)
                      mode = "Relational-Client";
                  else if (rdbRelational.model.checked && rdbServer.model.checked)
                      mode = "Relational-Server";
                  else if (rdbOlap.model.checked && rdbClient.model.checked)
                      mode = "Olap-Client";
                  else
                      mode = "Olap-Server";
                  if (savedreport.model.value == null) { window.alert("Report name can't be empty"); return; }
                  $.each(reportCollection, function (i, value) {
                      if (value.length > 0)
                          for (var j = 0; j < value.length; j++) {
                              if (!ej.isNullOrUndefined(value[j]))
                                  if (value[j].text == savedreport.model.value)
                                      value.splice(j, 1);
                          }
                  });
                  obj = { text: savedreport.model.value, value: mode };

                  if (obj.value == "Relational-Client") {
                      $.each(relationalclientrptmode, function (index, item) {
                          if (item.text == obj.text)
                              isDuplicate = true;
                      })
                      if (!isDuplicate)
                          relationalclientrptmode.push(obj);
                  }
                  else if (obj.value == "Relational-Server") {
                      $.each(relationalserverrptmode, function (index, item) {
                          if (item.text == obj.text)
                              isDuplicate = true;
                      })
                      if (!isDuplicate)
                          relationalserverrptmode.push(obj);
                  }
                  else if (obj.value == "Olap-Server") {
                      $.each(olapserverrptmode, function (index, item) {
                          if (item.text == obj.text)
                              isDuplicate = true;
                      })
                      if (!isDuplicate)
                          olapserverrptmode.push(obj);
                  }
                  else {
                      $.each(olapclientrptmode, function (index, item) {
                          if (item.text == obj.text)
                              isDuplicate = true;
                      })
                      if (!isDuplicate)
                          olapclientrptmode.push(obj);
                  }
                  $("#savedreport").val('');
                  if (rdbRelational.model.checked && rdbClient.model.checked)
                      datasource = relationalclientrptmode;
                  else if (rdbRelational.model.checked && rdbServer.model.checked)
                      datasource = relationalserverrptmode;
                  else if (rdbOlap.model.checked && rdbClient.model.checked)
                      datasource = olapclientrptmode;
                  else
                      datasource = olapserverrptmode;
                  $('#drpdwn').ejDropDownList({ dataSource: datasource, targetID: "drpdwn", watermarkText: "Load Report", width: "70%" });

                  url = rdbRelational.model.checked ? "../api/RelationalGrid" : "../api/OlapGrid";
                  name = savedreport.model.value;
                  storage = "db";
                  pGridObj.saveReport(name, storage, url);
              }
              function load() {
                  var loadreport = $("#drpdwn").data("ejDropDownList");
                  if (loadreport._currentText == null) { window.alert("Report name can't be empty"); return; }
                  url = (loadreport._selectedValue == "Relational-Client" || loadreport._selectedValue == "Relational-Server") ? "../api/RelationalGrid" : "../api/OlapGrid";
                  name = loadreport._currentText;
                  storage = "db";
                  pGridObj.loadReport(name, storage, url);
              }
              function renderPivotGrid(args) {
                  var pivotdataSource = { data: pivot_dataset, cube: "", rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }], columns: [{ fieldName: "Product", fieldCaption: "Product" }], values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }], filters: [] };
                  var olapDataSource = { data: "//bi.syncfusion.com/olap/msmdpump.dll", catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works", rows: [{ fieldName: "[Date].[Fiscal]" }], columns: [{ fieldName: "[Customer].[Customer Geography]" }], values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }], filters: [] };
                  if (rdbRelational.model.checked && rdbClient.model.checked)
                      datasource = relationalclientrptmode;
                  else if (rdbRelational.model.checked && rdbServer.model.checked)
                      datasource = relationalserverrptmode;
                  else if (rdbOlap.model.checked && rdbClient.model.checked)
                      datasource = olapclientrptmode;
                  else
                      datasource = olapserverrptmode;
                  $('#drpdwn').ejDropDownList({ dataSource: datasource, targetID: "drpdwn", watermarkText: "Load Report", width: "70%" });
                  $(pGridObj.element).html("");
                  pGridObj._waitingPopup.show();
                  if (rdbClient.model.checked) {
                      pGridObj.model.dataSource = rdbRelational.model.checked ? pivotdataSource : rdbOlap.model.checked ? olapDataSource : pivotdataSource;
                      pGridObj.model.url = "";
                  }
                  else {
                      pGridObj.model.dataSource = { data: null, cube: "" };
                      pGridObj.model.operationalMode = "servermode";
                      pGridObj.model.url = rdbRelational.model.checked ? "../api/RelationalGrid" : "../api/OlapGrid";
                  }
                  pGridObj._currentReportItems = [];
                  pGridObj._tempFilterData = [];
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
        .radioBtnLabel {
            margin-left: 5px;
        }

        .cols-prop-area .content {
            width: auto;
        }

        .row .cols-prop-area {
            min-height: 210px;
            width: auto;
        }
        tr.savereport > td
        {
            padding-bottom: 1em;
        }
        label {
            font-weight: normal;
        }
    </style>
</asp:Content>

