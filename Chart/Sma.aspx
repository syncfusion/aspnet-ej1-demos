<%@ Page Title="Chart-SMA-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render SMA indicator using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Sma.aspx.cs" Inherits="WebSampleBrowser.Chart.sma" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <section class="featured">

        <div class="content-wrapper">
              <script type="text/javascript" src="../Scripts/onlinedata.js"></script>
              <script type="text/javascript" src="../Scripts/ChartData.js"></script>
            <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
            <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="690" Height="600" IsResponsive="true" OnClientTrackToolTip="track"  OnClientLoad="chartload">
            <Axes>
               <ej:Axis Name="yAxis" OpposedPosition="true" LabelFormat="{value}" Orientation="vertical">
                  <MajorGridLines Visible="false" />
               </ej:Axis>
            </Axes>
            <PrimaryXAxis Title-Text="Date"  LabelFormat="dd,MMM"  >
            </PrimaryXAxis>
            <PrimaryYAxis LabelFormat="${value}">
            </PrimaryYAxis>
            <Legend Visible="false"></Legend>
            <Title Text="Simple Moving Average Indicator"></Title>
            <Series>
                <ej:Series EnableAnimation="true" Name="Candle" Type="HiloOpenClose" DrawMode="Both">
                <Tooltip Visible="false"  
                    Format="#point.x#<br/>Open : $#point.open#<br/>High : $#point.high#<br/>Low : $#point.low#<br/>Close : $#point.close#<br/>">
                </Tooltip>
                </ej:Series>
            </Series>
            <Crosshair Visible="true" Type="Trackball"></Crosshair>
            <Zooming Enable="true" EnableMouseWheel="true" Type="x,y" ></Zooming>
            <Indicators>
                <ej:ChartIndicator Type="SMA" EnableAnimation="true" YAxisName="yAxis"
                     SeriesName="Candle" Period="14" Fill="blue" Width="2">
                    <Tooltip Visible="false" Format="" Fill="transparent">
                        <Border Color="transparent" />
                    </Tooltip>       
                </ej:ChartIndicator>
            </Indicators>
        </ej:Chart>          
     </div>
  </section>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    
    <div id="sampleProperties">
    <div class="prop-grid">
    <div class="row">

            <div class="col-md-3">
                Period:
            </div>

            <div class="col-md-3">
			  <ej:NumericTextBox ID="Period"  Value="14" MinValue="1" MaxValue="50" Width="80px" Name="numeric" runat="server" ClientSideOnChange="period" />
            </div>

            <div class="col-md-3">
                Signal Line Stroke:
            </div>

            <div class="col-md-3">
                <select name="List" autocomplete="off" id="signalLine">
                     <option value="blue">Blue</option>                
                     <option value="green">Green</option>
                     <option value="yellow">Yellow</option>
                     <option value="red">Red</option>
                </select>
            </div>

        </div>
        
    </div>
</div>
        <script type="text/javascript" >

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

            function period(sender) {
                var chartObj = $("#Chart1").ejChart("instance");
                chartObj.model.indicators[0].period = parseInt(sender.value);
                $("#Chart1").ejChart("redraw");
            }


            function chartload(sender) {
                onChartLoad(sender);
                loadTheme(sender);
                sender.model.series[0].dataSource = window.chartData;

                sender.model.series[0].xName = "xDate";
                sender.model.series[0].open = "Open";
                sender.model.series[0].high = "High";
                sender.model.series[0].low = "Low";
                sender.model.series[0].close = "Close";

            }
            function track(sender) {
                sender.data.Location.X = sender.data.Location.X + 1;
                if (sender.data.Series.name == "Candle") {
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
    </asp:Content>





