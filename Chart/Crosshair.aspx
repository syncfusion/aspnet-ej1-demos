<%@ Page Title="Chart-Crosshair-ASP.NET-SYNCFUSION"   Language="C#"  MetaDescription="This sample demonstrates how to render crosshair for series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Crosshair.aspx.cs" Inherits="WebSampleBrowser.Chart.Crosshair" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart/ User Interaction / Crosshair</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
    <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="chartload">
        <PrimaryXAxis ColumnIndex="0" CrosshairLabel-Visible="true" MajorGridLines-Visible="false" ValueType="Datetime" 
            Title-Text="Month" LabelFormat="MMM/dd" />
        <Axes>
            <ej:Axis MajorGridLines-Visible="false" Orientation="Horizontal" HidePartialLabels="false" RowIndex="0" 
                ValueType="Datetime" LabelRotation="90" CrosshairLabel-Visible="true" Name="xAxis1" />
            <ej:Axis MajorGridLines-Visible="false" Orientation="Vertical" OpposedPosition="true" RowIndex="0" 
                LabelFormat="{value}mm" Title-Text="Rainfall" CrosshairLabel-Visible="true" Name="yAxis" />
        </Axes>
        <PrimaryYAxis RowIndex="0" CrosshairLabel-Visible="true" Title-Text="Temperature(Fahrenheit)" LabelFormat="{value}F" />
        <Crosshair Visible="true" Type="Crosshair" />
        <Series>
                <ej:Series Name="Temperature" EnableAnimation="true" Type="Line"></ej:Series>
                <ej:Series Name="Rainfall" Type="Line" YAxisName = "yAxis" XAxisName = "xAxis1" EnableAnimation="true"></ej:Series>
          </Series>
        <Title Text="Weather Condition"></Title>
        <Legend Visible="true"></Legend>
    </ej:Chart>
    <script>
        function chartload(sender) {
            onChartLoad(sender);
            var data = GetData();
            sender.model.series[1].dataSource = data.Open;
            sender.model.series[1].xName = "XValue";
            sender.model.series[1].yName = "YValue";
            sender.model.series[0].dataSource = data.Close;
            sender.model.series[0].xName = "XValue";
            sender.model.series[0].yName = "YValue";
            loadTheme(sender);

        }
        function GetData() {
            var series1 = [];
            var series2 = [];
            var value = 100;
            var value1 = 50;
            for (var i = 1; i < 2000; i++) {

                if (Math.random() > .5) {
                    value += Math.random();
                } else {
                    value -= Math.random();
                }
                var point = { XValue: new Date(1900, i, 1), YValue: value };
                series1.push(point);
            }
            for (var j = 1; j < 2000; j++) {

                if (Math.random() > .5) {
                    value1 += Math.random();
                } else {
                    value1 -= Math.random();
                }
                var point1 = { XValue: new Date(2000, 1, j), YValue: value1 };
                series2.push(point1);
            }
            var data = { Open: series1, Close: series2 };
            return data;
        }
    </script>
</asp:Content>

