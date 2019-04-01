<%@ Page Title="Chart-Scatter-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render scatter series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Scatter.aspx.cs" Inherits="WebSampleBrowser.Chart.Scatter" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div>
         <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="chartload">
            <PrimaryXAxis Title-Text="Length" />
            <PrimaryYAxis Title-Text="Weight" RangePadding="Normal" />
            <Title Text="Length Vs Weight"></Title>
            <Legend Visible="false"></Legend>
            <CommonSeriesOptions EnableAnimation="True" Opacity="0.5"></CommonSeriesOptions>
            <Series>
                <ej:Series Name="Weight" Type="Scatter" Opacity="0.5">
                    <Marker Size-Width="10" Size-Height="10" Border-Width="2" Opacity="0.5">
                        <Border Width="2" Color="#E94649"></Border>
                    </Marker>
                </ej:Series>
                    
                <ej:Series Name="Height" Type="Scatter" Opacity="0.5">
                     <Marker Opacity="0.5">
                         <Size Width="10" Height="10"></Size>
                         <Border Width="2" Color="#F6B53F"></Border>
                     </Marker>
                </ej:Series>
            </Series>
        </ej:Chart>
    </div>
     <script>
         function chartload(sender) {
             onChartLoad(sender);
             var data = GetData();
             sender.model.series[1].dataSource = data.Series1;
             sender.model.series[1].xName = "XValue";
             sender.model.series[1].yName = ["YValue"];
             sender.model.series[0].dataSource = data.Series2;
             sender.model.series[0].xName = "XValue";
             sender.model.series[0].yName = ["YValue"];
             
         }
         function GetData() {
             var series1 = [];
             var series2 = [];
             var value = 100;
             var value1 = 100;
             for (var i = 1; i < 100; i++) {

                 if (Math.random() > .5) {
                     value += Math.random();
                 } else {
                     value -= Math.random();
                 }
                 var point = { XValue: i, YValue: value };
                 series1.push(point);
             }
             for (var j = 1; j < 100; j = j + 2) {

                 if (Math.random() > .5) {
                     value1 += Math.random();
                 } else {
                     value1 -= Math.random();
                 }
                 var point1 = { XValue: j, YValue: value1 };
                 series2.push(point1);
             }

             var data = { Series1: series1, Series2: series2 };
             return data;
         }
    </script>
</asp:Content>


