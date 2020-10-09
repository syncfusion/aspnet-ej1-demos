<%@ Page Title="Chart-MACD-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render MACD indicator using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Macd.aspx.cs" Inherits="WebSampleBrowser.Chart.Macd" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <script src="../Scripts/onlinedata.js"></script>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="700" Height="600" OnClientTrackToolTip="track" 
            CanResize="true" OnClientLoad="chartLoad">
            <PrimaryXAxis Title-Text="Date" ValueType="Datetime" LabelFormat="dd,MMM" />
            <Axes>
                <ej:Axis Name="yAxis1" OpposedPosition="true">
                    <MajorGridLines Visible="false" />
                </ej:Axis>
            </Axes>
            <PrimaryYAxis LabelFormat="${value}" />
            <Legend Visible="false"></Legend>
            <Title Text="MACD Indicator"></Title>
            <Series>
                <ej:Series EnableAnimation="True" Name="Hilo" Type="HiloOpenClose" DrawMode="Both" 
                    XName="Xvalue" High="YValue1" Low="YValue2" Open="YValue3" Close="YValue4">
                    <Tooltip Visible="false"  
                        Format="#point.x#<br/>Open : $#point.open#<br/>High : $#point.high#<br/>Low : $#point.low#<br/>Close : $#point.close#<br/>">
                    </Tooltip>
                </ej:Series>
            </Series>
            <Indicators>
                <ej:ChartIndicator Type="MACD" YAxisName="yAxis1" MacdType="Both" ShortPeriod="12"
                     LongPeriod="26" Trigger="9" SeriesName="Hilo" Fill="blue" EnableAnimation="true">
                    <Histogram Fill="red" Opacity="1">
                        <Border Color="red" Width="1" />
                    </Histogram>
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
                           Short Period:
                     </div>
                     <div class="col-md-3 aligntop">
                          <ej:NumericTextBox ID="shortPeriod"  Value="14" MinValue="1" MaxValue="50" Width="80px" Name="numeric" runat="server" ClientSideOnChange="shortperiod" />
                     </div>
				     <div class="col-md-3">
                           Long Period:
                     </div>
				     <div class="col-md-3 aligntop">
                            <ej:NumericTextBox ID="longPeriod"  Value="14" MinValue="1" MaxValue="50" Width="80px" Name="numeric1" runat="server" ClientSideOnChange="longperiod" />
                     </div>
				     <div class="col-md-3">
                           Trigger:
                     </div>
                     <div class="col-md-3 aligntop">
                            <ej:NumericTextBox ID="trigger"  Value="14" MinValue="1" MaxValue="50" Width="80px" Name="numeric2" runat="server" ClientSideOnChange="trigger1" />
                     </div>
                 </div>
			     <div class="row">
                        <div class="col-md-3">
                            MACD Type:
                        </div>
                        <div class="col-md-3 aligntop">
                             <select name="macdType" autocomplete="off" id="macdType">
                                <option value="0">Both</option>
								<option value="2">Line</option>
                                <option value="1">Histogram</option>
                             </select>
                        </div>
                 </div>
                     
           </div>
</div>
    <script type="text/javascript">
        function trigger1(sender) {
            var chartObj = $("#Chart1").ejChart("instance");
            chartObj.model.indicators[0].trigger = parseInt(sender.value);
            $("#Chart1").ejChart("redraw");
        }
        function shortperiod(sender) {
            var chartObj = $("#Chart1").ejChart("instance");
            chartObj.model.indicators[0].shortPeriod = parseInt(sender.value);
            $("#Chart1").ejChart("redraw");
        }

        function longperiod(sender) {
            var chartObj = $("#Chart1").ejChart("instance");
            chartObj.model.indicators[0].longPeriod = parseInt(sender.value);
            $("#Chart1").ejChart("redraw");
        }
      
        $('#macdType').change(function () {
            var option = $("#macdType option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            chart.model.indicators[0].macdType = option.toLowerCase();
            $("#Chart1").ejChart("redraw");
        });
        function macdTypeChange(args) {
            if (args.itemId != 0) {
                var chartObj = $("#Chart1").ejChart("instance");
                chartObj.model.indicators[0].macdType = args.text;
                $("#Chart1").ejChart("redraw");
            }
        }
        function track(sender) {
            sender.data.Location.X = sender.data.Location.X + 1;
            if (sender.data.Series.name == "Hilo") {
                if (this.model.indicators[0].segment.length > 0) {
                    if ((this.model.indicators[0].macdType == "both")) {
                        if (this.model.indicators[0].segment[0].points[sender.data.pointIndex].y != null) {
                            sender.data.currentText = sender.data.currentText + "Histogram : " + "$" +
                            this.model.indicators[0].segment[0].points[sender.data.pointIndex].y.toFixed(2) + "<br/>" + "MACD " + " :" +
                            "$" + this.model.indicators[0].segment[2].points[sender.data.pointIndex].y.toFixed(2) + "<br/>" + "Signal:"
                            + "$" + this.model.indicators[0].segment[1].points[sender.data.pointIndex].y.toFixed(2) +
                            "<br/>" + "<br/>";
                        }
                        else {
                           sender.data.currentText = sender.data.currentText +
                           "Histogram : " + "$" + this.model.indicators[0].segment[0].points[sender.data.pointIndex].y +
                           "<br/>" + "MACD " + " :" + "  $" + this.model.indicators[0].segment[2].points[sender.data.pointIndex].y +
                           "<br/>" + "Signal : " + "$" + this.model.indicators[0].segment[1].points[sender.data.pointIndex].y + "<br/>"
                           +"<br/>";
                        }

                    }
                    if ((this.model.indicators[0].macdType == "line")) {
                        if (this.model.indicators[0].segment[1].points[sender.data.pointIndex].y != null) {
                            sender.data.currentText = sender.data.currentText +
                           "MACD " + " :" + "  $" + this.model.indicators[0].segment[0].points[sender.data.pointIndex].y.toFixed(2) +
                           "<br/>" + "Signal : " + "$" + this.model.indicators[0].segment[1].points[sender.data.pointIndex].y.toFixed(2)
                           +"<br/>" + "<br/>";
                        }
                        else {
                            sender.data.currentText = sender.data.currentText +
                           "MACD " + " :" + "  $" + this.model.indicators[0].segment[0].points[sender.data.pointIndex].y +
                           "<br/>" + "Signal:"+ "$" + this.model.indicators[0].segment[1].points[sender.data.pointIndex].y +
                           "<br/>" + "<br/>";
                        }
                    }
                    if ((this.model.indicators[0].macdType == "histogram")) {
                        if (this.model.indicators[0].segment[0].points[sender.data.pointIndex].y != null) {
                            sender.data.currentText = sender.data.currentText +
                             "Histogram : " + "$" + this.model.indicators[0].segment[0].points[sender.data.pointIndex].y.toFixed(2) +
                             "<br/>" + "<br/>";
                        }
                        else {
                          sender.data.currentText = sender.data.currentText +
                         "Histogram :" + "$" + this.model.indicators[0].segment[0].points[sender.data.pointIndex].y + "<br/>" + "<br/>";
                        }
                    }
                }
            }
        }
        $("#sampleProperties").ejPropertiesPanel();
    </script>
   </asp:content>

