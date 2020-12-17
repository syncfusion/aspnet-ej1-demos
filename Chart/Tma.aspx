<%@ Page Title="Chart-TMA-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render TMA indicator using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Tma.aspx.cs" Inherits="WebSampleBrowser.Chart.Tma" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <section class="featured">
         <div class="content-wrapper">
            <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
            <script src="../Scripts/onlinedata.js"></script>
            <ej:Chart ClientIDMode="Static" ID="container" runat="server" Width="690" Height="550" OnClientTrackToolTip="track" 
                IsResponsive="true" Text="Financial Analy" OnClientLoad="chartLoad">
            <Axes>
               <ej:Axis Name="yAxis" OpposedPosition="true" LabelFormat="${value}" Orientation="vertical">
                  <MajorGridLines Visible="false" />
               </ej:Axis>
            </Axes>
            <PrimaryXAxis Title-Text="Date"  LabelFormat="dd,MMM" />
            <PrimaryYAxis Title-Text="Price in Dollars" LabelFormat="${value}">
                <Title Text="Price in Dollars"></Title>
            </PrimaryYAxis>
            <Legend Visible="false"></Legend>
            <Title Text="Triangular Moving Average Indicator"></Title>
            <Series>
               <ej:Series EnableAnimation="true" Name="Hilo" Type="HiloOpenClose" DrawMode="Both" >
               <Tooltip Visible="false"  
                   Format="#point.x#<br/>Open : $#point.open#<br/>High : $#point.high#<br/>Low : $#point.low#<br/>Close : $#point.close#<br/>">
               </Tooltip>
               </ej:Series>
            </Series>
            <Crosshair Visible="true" Type="Trackball"></Crosshair>
            <Zooming Enable="true" EnableMouseWheel="true" Type="x,y" ></Zooming>
            <Indicators>
                <ej:ChartIndicator Type="TMA" EnableAnimation="true" YAxisName="yAxis" 
                    SeriesName="Hilo" Period="14" Fill="blue" Width="1.5" XName="Xvalue" Open="YValue1" High="YValue2" Low="YValue3"  Close="YValue4">       
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
                Period
            </div>

            <div class="col-md-3">
			  <ej:NumericTextBox ID="Period"  Value="14" MinValue="1" MaxValue="50" Width="80px" Name="numeric" runat="server" ClientSideOnChange="period" />
            </div>

            <div class="col-md-3">
                Color
            </div>

            <div class="col-md-3">
                <select name="selectIndex" autocomplete="off"  id="Type">
                    <option value="0">Blue</option>
                    <option value="1">Green</option>
                    <option value="2">Red</option>
                    <option value="3">Yellow</option>
                   

                </select>
            </div>
        </div>
    </div>
</div>
        <script >

                $("#Type").change(function () {
                var option1 = $("#Type option:selected").text();
                option1 = option1.toLowerCase();
                var chart = $("#container").ejChart("instance");
                switch (option1) {

                    case 'blue':
                        chart.model.indicators[0].fill = 'blue';
                        chart.redraw();
                        break;

                    case 'green':
                        chart.model.indicators[0].fill = 'green';
                        chart.redraw();
                        break;

                    case 'red':
                        chart.model.indicators[0].fill = 'red';
                        chart.redraw();
                        break;

                    case 'yellow':
                        chart.model.indicators[0].fill = 'yellow';
                        chart.redraw();
                        break;
                    default:

                }
            });

           
            function period(sender) {
                var chartObj = $("#container").ejChart("instance");
                chartObj.model.indicators[0].period = parseInt(sender.value);
                $("#container").ejChart("redraw");
            }


            function chartLoad(sender) {
			    onChartLoad(sender);
                loadTheme(sender);
                sender.model.series[0].dataSource = window.chartData;
                sender.model.series[0].xName = "xDate";
                sender.model.series[0].open = "Open";
                sender.model.series[0].high ="High";
                sender.model.series[0].low = "Low";
                sender.model.series[0].close = "Close";

            }
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
    </asp:Content>





