<%@ Page Title="Chart-BollingerBand-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render bollinger band indicator using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Bollingerband.aspx.cs" Inherits="WebSampleBrowser.Chart.Bollingerband" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <script src="../Scripts/onlinedata.js"></script>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="700" Height="600" OnClientTrackToolTip="track" 
            IsResponsive="true" OnClientLoad="chartLoad">
            <PrimaryXAxis Title-Text="Date" ValueType="Datetime" LabelFormat="dd,MMM" />
            <Axes>
                <ej:Axis Name="yaxis" OpposedPosition="true">
                    <MajorGridLines Visible="false" />
                </ej:Axis>
            </Axes>
            <PrimaryYAxis LabelFormat="${value}" RangePadding="Normal"  />
            <Legend Visible="false"></Legend>
            <Title Text="BollingerBand Indicator"></Title>
            <Series>
                <ej:Series EnableAnimation="True" Name="Hilo" Type="HiloOpenClose" DrawMode="Both"  XName="Xvalue" High="YValue1" 
                    Low="YValue2" Open="YValue3" Close="YValue4" Volume="YValue5">
                    <Tooltip Visible="false"  
                        Format="#point.x#<br/>Open : $#point.open#<br/>High : $#point.high#<br/>Low : $#point.low#<br/>Close : $#point.close#<br/>">
                    </Tooltip>
                </ej:Series>
            </Series>
            <Indicators>
                <ej:ChartIndicator Type="BollingerBand" YAxisName="yaxis" Fill="blue" Width="2" 
                    SeriesName="Hilo" EnableAnimation="true">
                    <UpperLine Width="2" />
                    <LowerLine Width="2" />
                   <Tooltip Visible="false" Format="" Fill="transparent">
                       <Border Color="transparent" />
                   </Tooltip>       
                </ej:ChartIndicator>
            </Indicators>
            <Crosshair Visible="true" Type="Trackball">
            </Crosshair>
            <Zooming Enable="true" />
        </ej:Chart>
    </div>
    <script type="text/javascript">

        function chartLoad(sender) {
            onChartLoad(sender);
            loadTheme(sender);
            sender.model.axes[0].range = {};
            sender.model.axes[0].range.min = 55;
            sender.model.axes[0].range.max = 75;
            sender.model.axes[0].range.interval = 5;
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
								 <ej:NumericTextBox ID="Period"  Value="14" MinValue="1" MaxValue="50" Width="80px" Name="numeric" runat="server" ClientSideOnChange="period" />
                        </div>
						<div class="col-md-3">
                           Standard
                           Deviations:
                        </div>
						<div class="col-md-3 aligntop">
								<ej:NumericTextBox ID="standardDeviations"  Value="2" MinValue="1" MaxValue="10" Width="80px" Name="numeric1" runat="server" ClientSideOnChange="standarddeviations" />
                        </div>
                        <div class="col-md-3">
                         
                        </div>
                     </div>	
                     <div class="row">
                        <div class="col-md-3">
                           Upper Line Stroke:
                        </div>
                        <div class="col-md-3 aligntop">
                            <select name="upperLine" autocomplete="off" id="upLine">
                                <option value="0">Red</option>
                                <option value="1">Yellow</option>
                                <option value="2">Green</option>
								<option value="3">Blue</option>
                            </select>
                        </div>
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
						 <div class="col-md-3">
                            Lower Line Stroke:
                         </div>
                        <div class="col-md-3 aligntop">
                            <select name="lowLine" autocomplete="off" id="lowLine">
                                <option value="0">Green</option>
                                <option value="1">Yellow</option>
                                <option value="2">Red</option>
								<option value="3">Blue</option>
                            </select>
                        </div>
                      </div>
                 </div>
</div>
    <script>

        function period(sender) {
            var chartObj = $("#Chart1").ejChart("instance");
            chartObj.model.indicators[0].period = parseInt(sender.value);
            $("#Chart1").ejChart("redraw");
        }

        function standarddeviations(sender) {
            var chartObj = $("#Chart1").ejChart("instance");
            chartObj.model.indicators[0].standardDeviations = parseInt(sender.value);
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
        $('#upLine').change(function () {
            var option = $("#upLine option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            var value = getColorValue(option);
            chart.model.indicators[0].upperLine.fill = value;
            $("#Chart1").ejChart("redraw");
        });
        $('#signalLine').change(function () {
            var option = $("#signalLine option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            var value = getColorValue(option);
            chart.model.indicators[0].fill = value;
            $("#Chart1").ejChart("redraw");
        });
        $('#lowLine').change(function () {
            var option = $("#lowLine option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            var value = getColorValue(option);
            chart.model.indicators[0].lowerLine.fill = value;
            $("#Chart1").ejChart("redraw");
        });
         function track(sender) 
	  {
        sender.data.Location.X = sender.data.Location.X + 1;
            if (sender.data.Series.name == "Hilo") 
			{
                if (this.model.indicators[0].segment.length > 0) 
				{
                    if (this.model.indicators[0].segment[0].points[sender.data.pointIndex].y != null){
					  if(this.model.indicators[0].standardDeviations > 0)
                        sender.data.currentText = sender.data.currentText + "Upper Band : " + "$" 
						+ this.model.indicators[0].segment[0].points[sender.data.pointIndex].y.toFixed(2) 
						+ "<br/>Signal Line " + " :" + "  $" 
						+ this.model.indicators[0].segment[2].points[sender.data.pointIndex].y.toFixed(2) 
						+ "<br/>" + "Lower Band : " + "$" 
						+ this.model.indicators[0].segment[1].points[sender.data.pointIndex].y.toFixed(2) + "<br/>" + "<br/>";
					  else
					     sender.data.currentText = sender.data.currentText + "Signal Line " + " :" + "  $" 
						+ this.model.indicators[0].segment[2].points[sender.data.pointIndex].y.toFixed(2) +
						"<br/>" + "<br/>";
					}
                    else{
					  if(this.model.indicators[0].standardDeviations > 0)
                        sender.data.currentText = sender.data.currentText + "Upper Band : " + "$" 
						+ this.model.indicators[0].segment[0].points[sender.data.pointIndex].y 
						+ "<br/>Signal Line " + " :" + "  $" 
						+ this.model.indicators[0].segment[2].points[sender.data.pointIndex].y 
						+ "<br/>" + "Lower Band : " + "$" 
						+ this.model.indicators[0].segment[1].points[sender.data.pointIndex].y + "<br/>" + "<br/>";
					 else
						 sender.data.currentText = sender.data.currentText + "Signal Line " + " :" + "  $" 
						+ this.model.indicators[0].segment[2].points[sender.data.pointIndex].y +
						"<br/>" + "<br/>";
					}
					
                }
            }
       }
        $("#sampleProperties").ejPropertiesPanel();
    </script>
   </asp:content>


