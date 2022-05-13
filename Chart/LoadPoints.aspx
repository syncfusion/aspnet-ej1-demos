<%@ Page Title="Chart-Performance-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates performance of Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="LoadPoints.aspx.cs" Inherits="WebSampleBrowser.Chart.LoadPoints" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
  <div id="container">
      <script type="text/javascript" src="../Scripts/ChartData.js"></script>
      <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
      <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Height="600" IsResponsive="true" EnableCanvasRendering="true" OnClientLoad="onChartLoad" >
         <PrimaryXAxis >
             <MajorGridLines Visible="false" />
         </PrimaryXAxis>
         <CommonSeriesOptions Type="Line" EnableAnimation="false"/>
         <Series>
             <ej:Series Name="Series1" Fill="#369EAD"></ej:Series>
         </Series>
         <Legend Visible="false"></Legend>
      </ej:Chart>
  </div>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
     <div class="row">
          <div class="col-md-3" style="width:100%">
               <ej:Button ID="loadPoints" ClientIDMode="Static" runat="server" Width="125" Type="Button" Text="Load 100K Points"></ej:Button>
          </div>
	           <br/>
               <br/>
          <div class="col-md-3">
                Time taken
          </div>
          <div class="col-md-3">
               <span id="timeTaken">0 ms</span>
          </div>
      </div>
     </div>
    <script type="text/javascript">

        $("#loadPoints").click(function () {           
            var chart = $("#Chart1").ejChart("instance");
            var data = GetData(100000);
            chart.model.series[0].dataSource = data.Open;
            chart.model.series[0].xName = "XValue";
            chart.model.series[0].yName = "YValue";

            var dt1 = new Date();                      // render start time

            $("#Chart1").ejChart("redraw");

            var dt2 = new Date();                     //render end time
            var elapsed = dt2.getTime() - dt1.getTime();
            $("#timeTaken").text(elapsed + " ms");
        });
       
        function GetData(option) {
            var series1 = [];
            var value = 0;
            for (var i = 0; i < option; i++) {
                value += (Math.random() * 10 - 5);
                var point1 = { XValue: i, YValue: value };
                series1.push(point1);
            }

            var data = { Open: series1 };
            return data;
        }

        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:Content>


