<%@ Page Title="Chart-ATR-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render ATR indicator using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ATR.aspx.cs" Inherits="WebSampleBrowser.Chart.ATR" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/onlinedata.js"></script>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="700" OnClientTrackToolTip="track" Height="600"
             CanResize="true" OnClientLoad="chartLoad">
           <Axes>
               <ej:Axis Name="yaxis" OpposedPosition="true">
                   <MajorGridLines Visible="false" />
               </ej:Axis>
           </Axes>
            <PrimaryXAxis Title-Text="Date" ValueType="Datetime" LabelFormat="dd,MMM" />
            <PrimaryYAxis LabelFormat="${value}" />
            <Series>
                <ej:Series Name="Hilo" EnableAnimation="true" Type="HiloOpenClose" DrawMode="Both">
                    <Tooltip Visible="false" 
                         Format="#point.x#<br/>Open : $#point.open#<br/>High : $#point.high#<br/>Low : $#point.low#<br/>Close : $#point.close#<br/>">
                    </Tooltip>
                </ej:Series>
            </Series>
            <Indicators>
                <ej:ChartIndicator Type="ATR" EnableAnimation="true" Period="14" Fill="blue" Width="2" 
                    SeriesName="Hilo" YAxisName="yaxis">                   
                    <Tooltip Visible="false" Format="" Fill="transparent">
                        <Border Color="transparent" />
                    </Tooltip>       
                </ej:ChartIndicator>
            </Indicators>
            <Crosshair Visible="true" Type="Trackball">
            </Crosshair>
            <Title Text="ATR Indicator"></Title>
            <Legend Visible="false"></Legend>
            <Zooming Enable="true" />
        </ej:Chart>
    </div>
     <script type="text/javascript">
         
         function chartLoad(sender) {
             onChartLoad(sender);
             loadTheme(sender);
             sender.model.series[0].dataSource = window.chartData;
             sender.model.series[0].xName = "xDate";
             sender.model.series[0].high = "High";
             sender.model.series[0].low = "Low";
             sender.model.series[0].open = "Open";
             sender.model.series[0].close = "Close";

         }
     </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
<div id="sampleProperties">
             <div class="prop-grid">
                <div class="row">
			 <div class="col-md-3">
                Period:
             </div>
            <div class="col-md-3 aligntop">
				   <ej:NumericTextBox ID="period"  Value="14" MinValue="1" MaxValue="50" Width="80px" Name="numeric" runat="server" ClientSideOnChange="atrPeriod" />
            </div>
		       </div>
               <div class="row">
                        <div class="col-md-3">
                            Signal Line Stroke:
                        </div>
                        <div class="col-md-3 aligntop">
                            <select name="signalLine" autocomplete="off" id="signalLine">
                                <option value="0">Blue</option>
                                <option value="1">Yellow</option>
                                <option value="2">Green</option>
								<option value="3">Red</option>
                            </select>
                        </div>
						 
              </div>
             </div>
</div>
    <script type="text/javascript">

        function atrPeriod(sender) {
            var chartObj = $("#Chart1").ejChart("instance");
            chartObj.model.indicators[0].period = parseInt(sender.value);
            $("#Chart1").ejChart("redraw");
        }


        function getColorValue(name) {
            var val;
            switch (name) {
                case "Red":
                    val = "#FF0000";
                    break;
                case "Green":
                    val = "#009900";
                    break;
                case "Yellow":
                    val = "#D8B213";
                    break;
                case "Blue":
                    val = "#0000FF";
                    break;
            }
            return val;
        }

        $('#signalLine').change(function () {

            var option = $("#signalLine option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            var value = getColorValue(option);
            chart.model.indicators[0].fill = value;
            $("#Chart1").ejChart("redraw");
        });
        function track(sender) {
            sender.data.Location.X = sender.data.Location.X + 1;
            if (sender.data.Series.name == "Hilo") {
                if (this.model.indicators[0].segment.length > 0) {
                    if (this.model.indicators[0].segment[0].points[sender.data.pointIndex].y != null)
                        sender.data.currentText = sender.data.currentText + "Signal Line " + " :" + "  $" +
                        this.model.indicators[0].segment[0].points[sender.data.pointIndex].y.toFixed(2) + "<br/>" + "<br/>";
                    else
                        sender.data.currentText = sender.data.currentText + "Signal Line " + " :" + "  $" +
                        this.model.indicators[0].segment[0].points[sender.data.pointIndex].y + "<br/>" + "<br/>";
                }
            }
        }
        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:content>

