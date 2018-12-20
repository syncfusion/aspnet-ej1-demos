<%@ Page Title="Chart-Stochastic-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render stochastic indicator using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Stochastic.aspx.cs" Inherits="WebSampleBrowser.Chart.Stochastic" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <script src="../Scripts/onlinedata.js"></script>
		<script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="700" Height="600" OnClientTrackToolTip="track" 
            IsResponsive="true" OnClientLoad="chartLoad">
            <PrimaryXAxis Title-Text="Date" ValueType="Datetime" LabelFormat="dd,MMM" />
            <Axes>
                <ej:Axis Name="yaxis" OpposedPosition="true" RangePadding="Normal">
                    <MajorGridLines Visible="false" />
                </ej:Axis>
            </Axes>
            <PrimaryYAxis LabelFormat="${value}" RangePadding="Normal"/>
            <Legend Visible="false"></Legend>
            <Title Text="Stochastic Indicator"></Title>
            <Series>
                <ej:Series EnableAnimation="True" Name="Hilo" Type="HiloOpenClose" DrawMode="Both"  XName="Xvalue"
                        High="YValue1" Low="YValue2" Open="YValue3" Close="YValue4" Volume="YValue5">
                    <Tooltip Visible="false"  
                        Format="#point.x#<br/>Open : $#point.open#<br/>High : $#point.high#<br/>Low : $#point.low#<br/>Close : $#point.close#<br/>">
                    </Tooltip>
                </ej:Series>
            </Series>
            <Indicators>
                <ej:ChartIndicator Type="Stochastic" EnableAnimation="true" Period="14" KPeriod="3" DPeriod="3"
                     YAxisName="yaxis" Fill="yellow" Width="2" SeriesName="Hilo">
                    <UpperLine Width="2" />
                    <LowerLine Width="2" />
                    <PeriodLine Fill="blue" Width="2" />
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
                          KPeriod:
                        </div>
						<div class="col-md-3 aligntop">
								 <ej:NumericTextBox ID="KPeriod"  Value="14" MinValue="1" MaxValue="50" Width="80px" Name="numeric" runat="server" ClientSideOnChange="kperiod" />
                        </div>
                        <div class="col-md-3">
                          DPeriod:
                        </div>
						<div class="col-md-3 aligntop">
								 <ej:NumericTextBox ID="DPeriod"  Value="14" MinValue="1" MaxValue="50" Width="80px" Name="numeric" runat="server" ClientSideOnChange="dperiod" />
                        </div>
                   </div>	
                    <div class="row">
                        <div class="col-md-3">
                           Upper Line Stroke:
                        </div>
                        <div class="col-md-3 aligntop">
                            <select name="upperLine" autocomplete="off"  id="upLine">
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
                                <option value="0">Yellow</option>
                                <option value="1">Blue</option>
                                <option value="2">Green</option>
								<option value="3">Red</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            Periodl Line Stroke:
                        </div>
                        <div class="col-md-3 aligntop">
                            <select name="periodLine" autocomplete="off"  id="periodLine">
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
                            <select name="lowLine" autocomplete="off"  id="lowLine">
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
                    val = "#FFFF00";
                    break;
                case "Blue":
                    val = "#0000FF";
                    break;
            }
            return val;
        }

        function period(sender) {
            var chartObj = $("#Chart1").ejChart("instance");
            chartObj.model.indicators[0].period = parseInt(sender.value);
            $("#Chart1").ejChart("redraw");
        }

        function kperiod(sender) {
            var chartObj = $("#Chart1").ejChart("instance");
            chartObj.model.indicators[0].kPeriod = parseInt(sender.value);
            $("#Chart1").ejChart("redraw");
        }

        function dperiod(sender) {
            var chartObj = $("#Chart1").ejChart("instance");
            chartObj.model.indicators[0].dPeriod = parseInt(sender.value);
            $("#Chart1").ejChart("redraw");
        }

     
        $('#upLine').change(function () {
            var option = $("#upLine option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            var value = getColorValue(option);
            chart.model.indicators[0].upperLine.fill = option.toLowerCase();
            $("#Chart1").ejChart("redraw");
        });
        $('#signalLine').change(function () {
            var option = $("#signalLine option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            var value = getColorValue(option);
            chart.model.indicators[0].fill = option.toLowerCase();
            $("#Chart1").ejChart("redraw");
        });
        $('#periodLine').change(function () {
            var option = $("#periodLine option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            var value = getColorValue(option);
            chart.model.indicators[0].periodLine.fill = option.toLowerCase();
            $("#Chart1").ejChart("redraw");
        });
        $('#lowLine').change(function () {
            var option = $("#lowLine option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            var value = getColorValue(option);
             chart.model.indicators[0].lowerLine.fill = option.toLowerCase();
            $("#Chart1").ejChart("redraw");
        });
        function track(sender) {
            sender.data.Location.X = sender.data.Location.X + 1;
            if (sender.data.Series.name == "Hilo") {
                if (this.model.indicators[0].segment.length > 0) {
                    if (this.model.indicators[0].segment[3].points[sender.data.pointIndex].y != null)
                        sender.data.currentText = sender.data.currentText + "Stochastic : " + "$" +
                        this.model.indicators[0].segment[2].points[sender.data.pointIndex].y.toFixed(2) + "<br/>Signal : " + "$" +
                        this.model.indicators[0].segment[3].points[sender.data.pointIndex].y.toFixed(2) + "<br/>" + "<br/>";
                    else
                        sender.data.currentText = sender.data.currentText + "Stochastic : " + "$" +
                        this.model.indicators[0].segment[2].points[sender.data.pointIndex].y + "<br/>Signal : " + "$" +
                        this.model.indicators[0].segment[3].points[sender.data.pointIndex].y + "<br/>" + "<br/>";
                }
            }
        }
        $("#sampleProperties").ejPropertiesPanel();
    </script>
   </asp:content>



