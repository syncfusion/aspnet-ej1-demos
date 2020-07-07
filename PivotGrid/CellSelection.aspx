<%@ Page Title="PivotGrid-Cell Selection-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to select a range of values either on mouse drag or keyboard interaction" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CellSelection.aspx.cs" Inherits="WebSampleBrowser.CellSelection" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
   <ej:PivotGrid ID="PivotGrid1" IsResponsive="true" runat="server"  ClientIDMode="Static" EnableCellSelection="true" >
    <ClientSideEvents CellSelection="valueCellClick" Load="onLoad"/>
       <DataSource>
            <Rows>
                <ej:Field FieldName="Country" FieldCaption="Country"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Product" FieldCaption="Product"></ej:Field>
            </Columns>
            <Values>
                <ej:Field FieldName="Amount" FieldCaption="Amount"></ej:Field>
                <ej:Field FieldName="Quantity" FieldCaption="Quantity"></ej:Field>
            </Values>
        </DataSource>
   </ej:PivotGrid>
       <div id="container">
      <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
      <ej:Chart ID="Chart1" runat="server" Width="900" Height="450" CanResize="true" OnClientLoad="loadTheme" >
         <Legend   Visible="true" Alignment="Center" Position="Bottom"></Legend>
          <CommonSeriesOptions EnableAnimation="true" Type="Column"></CommonSeriesOptions>
      </ej:Chart>
  </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
     <script type="text/javascript">
         function onLoad(args) {
             args.model.dataSource.data = pivot_dataset;
         }
         $(function () {
             var cellvalue = [], rowheaders = [], colheaders = [], chartLables = [], colHeaderLable = [], rowseries = [], rowseriesheader = [], seriesvalue = [], columnseriesheader = [], measure, measureValue = [];
             var j = 0, row = 0, column = 0;
             valueCellClick = function (evt) {
                 if (evt.JSONRecords.length && (evt.JSONRecords[0].CSS.indexOf("colheader") != -1 || evt.JSONRecords[0].CSS.indexOf("rowheader") != -1 || evt.JSONRecords[0].CSS.indexOf("summary") != -1)) return false;
                 else{
                 var chart = $(".e-datavisualization-chart").data('ejChart');
                 cellvalue = evt.JSONRecords;
                 rowheaders = evt.rowHeader;
                 colheaders = evt.columnHeader;
                 measure = evt.measureCount;
                 measureValue = measure.split(":");
                 if (measureValue[0] == "Row")
                     row = parseInst(parseInt(measureValue[1]));
                 else
                     column = parseInt(parseInt(measureValue[1]));

                 $.each(rowheaders, function (i, el) {

                     if ($.inArray(el, chartLables) === -1)
                         chartLables.push(el);
                 });
                 $.each(colheaders, function (i, el) {
                     if ($.inArray(el, colHeaderLable) === -1)
                         colHeaderLable.push(el);
                 });
                 for (var j = 0; j < chartLables.length; j++) {
                     rowseries = !($.isNumeric(chartLables[j])) ? (chartLables[j]).split("##") : $(chartLables[j])[0].toString();
                     var temp = 0;
                     for (var k = 0; k < rowseries.length; k++) {
                         if (rowseries[k].toLowerCase().indexOf("total") >= 0)
                             temp++;
                     }
                     if (temp == 0)
                         chartLables[j] = rowseries[rowseries.length - (row + 1)];
                     else if ((temp == 0) && (rowseries.length == 1)) {
                         chartLables[j] = rowseries[rowseries.length - 1];
                     }
                     else if (temp > 0) {
                         chartLables.splice(j, 1);
                         j--;
                     }
                 }
                 for (var j = 0; j < colHeaderLable.length; j++) {
                     columnseriesheader = colHeaderLable[j].split("##");
                     var temp = 0;
                     for (var k = 0; k < columnseriesheader.length; k++) {
                         if (columnseriesheader[k].toLowerCase().indexOf("total") >= 0)
                             temp++;
                     }
                     if (temp == 0) {
                         var label = "";
                         for (var k = 0; k < columnseriesheader.length; k++)
                             label += label == "" ? columnseriesheader[k] : " - " + columnseriesheader[k];
                         colHeaderLable[j] = label;
                     }
                     else if ((temp == 0) && (columnseriesheader.length == 1)) {
                         colHeaderLable[j] = columnseriesheader[columnseriesheader.length - 1];
                     }
                     else if (temp > 0) {
                         colHeaderLable.splice(j, 1);
                         j--;
                     }
                 }
                 var count = 0;
                 for (var k = 0; k < cellvalue.length; k++) {
                     var style = cellvalue[k].CSS;
                    var colHeaderCell = $("#" + this._id).find("th[data-p*='" + cellvalue[0].Index.split(",")[0] + ",']").last();;
                    var isFound = false;
                    var isbrklp = false;
                    for (var col = parseInt(colHeaderCell.attr("data-p").split(",")[0]) ; col >= 0; col--) {
                        for (var r = parseInt(colHeaderCell.attr("data-p").split(",")[1] - 1) ; r >= 0; r--) {
                            if ($("#" + this._id).find("th[data-p*='" + col + "," + r + "']").length > 0) {
                                var element = $("#" + this._id).find("th[data-p*='" + col + "," + r + "']").find(".expand");                                
                                    isFound = (element.length > 0) ? true:false;                                
                               isbrklp = true;
                                break;
                            }
						}
                        if (isbrklp)
                            break;                        
                    }
                    if (style != "summary value"|| $("#" + this._id).find("[data-p*='" + cellvalue[k].Index + "']").prevAll().find(".expand").length>0 ||isFound ) { 
                         seriesvalue[count] = cellvalue[k];
                         count++;
                     }
                 }
                 var chartSeries = new Array(); var seriesPoints = new Array(); var XValues = chartLables; var tempArray = new Array();
                 var YValues = new Array(); var pointsCount = 0; var count = 0; var seriesName = new Array(); var points; var cellcount = 0;
                 jQuery.each(chartLables, function (index, value) {
                     var YPoints = new Array();
                     for (var i = 0; i < colHeaderLable.length; i++) {
						 points = { "xValues": chartLables[index], "yValues": (seriesvalue[cellcount].Value == ""? 0 :parseInt(seriesvalue[cellcount].Value)) };
                         YPoints.push(points);
                         cellcount++;
                     }
                     seriesPoints.push(YPoints);
                 });
                 jQuery.each(colHeaderLable, function (index, value) {
                     tempArray.push(new Array());
                 });
                 jQuery.each(chartLables, function (index, value) {
                     for (var i = 0; i < seriesPoints[index].length; i++) {
                         tempArray[i].push((seriesPoints[index])[i]);
                     }
                 });
                 jQuery.each(colHeaderLable, function (index, value) {
                     chartSeries[pointsCount] = { dataSource: tempArray[index], xName: "xValues", yName: ["yValues"], name: colHeaderLable[pointsCount] };
                     pointsCount++;
                 });
                 chart.model.series = chartSeries;
                 chart.model.commonSeriesOptions.enableAnimation = true;
                 chart.redraw();
                 chartSeries = [];
                 colHeaderLable = [];
                 chartLables = [];
                 seriesName = [];
                 seriesPoints = [];
                 tempArray = [];
                 }
             }
         });
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
        }
    </style>
</asp:Content>

