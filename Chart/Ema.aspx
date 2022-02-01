<%@ Page Title="Chart-EMA-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render EMA indicator using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Ema.aspx.cs" Inherits="WebSampleBrowser.Chart.Ema" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/onlinedata.js"></script>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="690" Height="550" OnClientTrackToolTip="track"
             IsResponsive="true" OnClientLoad="chartLoad">
            <Axes>
                <ej:Axis OpposedPosition="true" Orientation="Vertical" Name="yaxis" >
                   <MajorGridLines Visible="false" />
                </ej:Axis>
            </Axes>   
            <PrimaryXAxis Title-Text="Date" LabelFormat="dd,MMM"/>
            <PrimaryYAxis LabelFormat="${value}" />
            <Legend Visible="false"></Legend>
            <Title Text="EMA Indicator"></Title>
            <Series>
                <ej:Series EnableAnimation="True" Name="Hilo" Type="HiloOpenClose" DrawMode="Both" XName="Xvalue" 
                    High="YValue1" Low="YValue2" Open="YValue3" Close="YValue4">
                    <Tooltip Visible="false"  
                     Format="#point.x#<br/>Open : $#point.open#<br/>High : $#point.high#<br/>Low : $#point.low#<br/>Close : $#point.close#<br/>">
                    </Tooltip>
                </ej:Series>
            </Series>
            <Indicators>
                <ej:ChartIndicator Type="EMA" Fill="blue" EnableAnimation="true" Period ="14" SeriesName="Hilo" 
                    YAxisName="yaxis" High="YValue1" Low="YValue2" Open="YValue3" Close="YValue4">
                    <Tooltip Visible="false" Format="" Fill="transparent">
                        <Border Color="transparent" />
                    </Tooltip>       
                </ej:ChartIndicator>
            </Indicators>
            <Crosshair Visible="true" Type="Trackball">
            </Crosshair>
            <Zooming Enable="true" Type="x,y" EnableDeferredZoom="false" EnableMouseWheel="true"/>
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
    
   <div id="sampleProperties" >
    <div class="row">
        <div class="row" >
            <div class="col-md-3">
                Period:
            </div>
            <div class="col-md-3 aligntop" >
					<ej:NumericTextBox ID="textBox_id"  Value="14" MinValue="1" MaxValue="50" Width="80px" Name="numeric" runat="server" ClientSideOnChange="changeIndex" />
            </div>
        </div>

        <div class="row" >
            <div class="col-md-3">
                Signal Line Stroke:
            </div>
            <div class="col-md-3 aligntop">
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
     <script type="text/javascript">
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
         function changeIndex(period) {
           
             var obj = $("#Chart1").ejChart("instance");
             obj.model.indicators[0].period =parseInt(period.value);
             $("#Chart1").ejChart("redraw");
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

<asp:Content ID="Content1" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" >
          .e-waitpopup-pane{
            background-color: transparent;
            margin-top: 300px;
         }
        .cols-sample-area {
            margin-top: 16px;
        }
         
    </style>
</asp:Content>

