<%@ Page Title="Chart-Spline-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render spline series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Spline.aspx.cs" Inherits="WebSampleBrowser.Chart.Spline" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="970" IsResponsive="true" Height="600" OnClientLoad="onChartLoad">
            <PrimaryXAxis Title-Text="Year" LabelFormat="yyyy" RangePadding="Additional" />
            <PrimaryYAxis Title-Text="Temperature in Celsius" LabelFormat="{value}C" />
            <CommonSeriesOptions EnableAnimation="True" Type="Spline" SplineType="Natural" DoughnutSize="0.2" Tooltip-Visible="true"
                 Tooltip-Format="#point.x# <br/> #series.name# : #point.y# "
                 Marker-Visible="true" Marker-Border-Width="2" />
           <Series>
             <ej:Series Name="London" XName="Xvalue" YName="YValue1"></ej:Series>
             <ej:Series Name="Germany" XName="Xvalue" YName="YValue2"></ej:Series>
             <ej:Series Name="France" XName="Xvalue" YName="YValue3"></ej:Series>
           </Series>
             <Title Text="Climate Graph-2012"></Title>
        </ej:Chart>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
<div id="sampleProperties">
    <div class="prop-grid">
        <div class="row" style="margin: 10px 0;">
		    <div class="col-md-3">
			    Spline Type
		    </div>
            <div class="col-md-3">
                 <div id="dropdown">
                      <select id="optSplinetype">
                           <option value="Natural">Natural</option>
                           <option value="Monotonic">Monotonic</option>
                          <option value="Cardinal">Cardinal</option>
                          <option value="Clamped">Clamped</option>
                      </select>
                 </div>
            </div>
          </div>
            <div class="row" style="margin: 10px 0;">
		    <div class="col-md-3">
			    Cardinal Spline
                Tension
		    </div>
            <div class="col-md-3">                
				<input type="text" id="tension" style="width:100px; height:22px;" value="0.5" />                        
            </div>
          </div>
        </div>
    </div>

     <script type="text/javascript" >
         $("#tension").ejNumericTextbox({
             value: 0.5, width: "100px", minValue: 0, maxValue: 1, incrementStep: 0.1, decimalPlaces: 1, enabled: false, change: "changeSplineTension",
         });
         $('#optSplinetype').change(function () {
             var chart = $("#Chart1").ejChart("instance");
             var count = chart.model.series.length;
             var type = $("#optSplinetype option:selected").text();
             for (var i = 0; i < count; i++) {
                 chart.model.series[i].splineType = type.toLowerCase();
                 if (type == "Cardinal")
                     $("#tension").ejNumericTextbox("option", "enabled", true);
                 else
                     $("#tension").ejNumericTextbox("option", "enabled", false);
             }
             chart.redraw();
         });
         function changeSplineTension(e) {
             var chart = $("#Chart1").ejChart("instance");
             var count = chart.model.series.length;
             for (var i = 0; i < count; i++) {
                 chart.model.series[i].cardinalSplineTension = parseFloat(tension.value);
             }
             chart.redraw();
         }        
         $("#sampleProperties").ejPropertiesPanel();
     </script>
    </asp:Content>

