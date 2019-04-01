<%@ Page Title="Chart-Vertical Chart-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render vertical series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="VerticalChart.aspx.cs" Inherits="WebSampleBrowser.Chart.VerticalChart" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
      <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div style= "height:600px;">
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart  ID="Chart1" runat="server" Width="970" ClientIDMode="Static" OnClientLoad="chartload" Height="600" EnableCanvasRendering="true" Background="transparent"  IsResponsive="true">
           <ColumnDefinitions>
               <ej:ColumnDefinitions Unit="percentage" ColumnWidth="48"  />
                <ej:ColumnDefinitions Unit="percentage" ColumnWidth="48" />
           </ColumnDefinitions>
           <RowDefinitions>
                <ej:RowDefinitions Unit="percentage" RowHeight="100" LineWidth="0" LineColor="gray" />
                
           </RowDefinitions>
           <PrimaryXAxis MajorGridLines-Visible="false" ValueType="Datetime" LabelFormat="mm:ss" Title-Text="Time(sec)" />
           <PrimaryYAxis MajorGridLines-Visible="false" PlotOffset="80" Title-Text="Velocity(m/s)" />
           <Axes>
                <ej:Axis MajorGridLines-Visible="false" ColumnIndex="1" PlotOffset="80" 
                    AxisLine-Visible="false" Name="yAxis"  Title-Text="Velocity(m/s)" />                
           </Axes>
           <Series>
                <ej:Series Fill="#E46455" IsTransposed="true" Name="Indonesia" Opacity="0.8" Type="Line" EnableAnimation="False"/>
                <ej:Series Opacity="0.8" IsTransposed="true" Name="Japan" YAxisName="yAxis" Type="Line" EnableAnimation="False"/>
           </Series>
           <Title Text="Seismograph comparison of two countries"></Title>
           <Legend Visible="true" Position="Top"></Legend>
        </ej:Chart>
           
    </div>
    <script>
        var chartobj;
        var intervalId;
        var count = 0;

        function OnRefresh() {

            count += 2;
            AddPoint(chartobj.model.series[0], count);
            AddPoint(chartobj.model.series[1], count);
            $("#Chart1").ejChart("redraw");
        }

        function chartload(sender) {
            onChartLoad(sender);
            for (var i = 11; i < 50; i = i + 1) {
                AddPoint(sender.model.series[0], count);
                AddPoint(sender.model.series[1], count);
                count++;
            }
            chartobj = this;

            intervalId = window.setInterval(OnRefresh, 10);
        }

        function AddPoint(series, count) {
            if (series.points == undefined)
                series.points = [];
            series.points[series.points.length] = { x: new Date(2015, 8, 26, 08, 39, count), y: getRandomNum(series) };
        }

        function getRandomNum(series) {
            var value;
            if (count <= 50) {
                if (series.name == "Indonesia")
                    value = Math.floor((Math.random() * (3 - (-3) + 1)) - 3);
                else
                    value = Math.floor((Math.random() * (2 - (-2) + 1)) - 2);
            }
            else if (count <= 100) {
                if (series.name == "Indonesia")
                    value = Math.floor((Math.random() * (9 - (-9) + 1)) - 9);
                else
                    value = Math.floor((Math.random() * (9 - (-9) + 1)) - 9);

            }
            else if (count <= 150) {
                if (series.name == "Indonesia")
                    value = Math.floor((Math.random() * (6 - (-7) + 1)) - 7);
                else
                    value = Math.floor((Math.random() * (7 - (-6) + 1)) - 6);
            }
            else if (count <= 220) {
                if (series.name == "Indonesia")
                    value = Math.floor((Math.random() * (2 - (-3) + 1)) - 3);
                else
                    value = Math.floor((Math.random() * (3 - (-2) + 1)) - 2);
            }
            else if (count <= 270) {
                if (series.name == "Indonesia")
                    value = Math.floor((Math.random() * (1 - (-2) + 1)) - 2);
                else
                    value = Math.floor((Math.random() * (2 - (-2) + 1)) - 2);
            }
            else if (count <= 320) {
                if (series.name == "Indonesia")
                    value = Math.floor((Math.random() * (0 - (0) + 1)) - 0);
                else
                    value = Math.floor((Math.random() * (0 - (0) + 1)) - 0);
            }
            else {

                clearInterval(intervalId);

            }

            return value;
        }

     </script>
</asp:Content>

