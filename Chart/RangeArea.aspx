<%@ Page Title="Chart-Range Area-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render range area series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="RangeArea.aspx.cs" Inherits="WebSampleBrowser.Chart.RangeArea" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
   <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
    <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="chartload">
        <PrimaryXAxis Title-Text="Year" MajorGridLines-Visible="false"/>
        <PrimaryYAxis Title-Text="Gold Price in Billion U.S Dollars" />
        <Title Text="World Gold Price"></Title>
        <Zooming EnableMouseWheel="true" Enable="true"/>
        <Legend Visible="true"></Legend>
        <Series>
            <ej:Series Name="Gold value" EnableAnimation="True" Type="RangeArea" Border-Width="1" Border-Color="Indigo"
                       Fill="Indigo" Opacity="0.5"/>
        </Series>
    </ej:Chart>
    <script>
        function chartload(sender) {
            onChartLoad(sender);
            loadTheme(sender);
            var data = GetData();
            sender.model.series[0].dataSource = data.Open;
            sender.model.series[0].xName = "XValue";
            sender.model.series[0].high = "High";
            sender.model.series[0].low = "Low";
        }
        function GetData() {
            var series1 = [];
            var value = 70;
            for (var i = 1; i < 1000; i++) {
                if (Math.random() > .5) {
                    value += Math.random();
                } else {
                    value -= Math.random();
                }
                var point1 = { XValue: new Date(1930, i + 2, i), High: value, Low: value + 20 };
                series1.push(point1);
            }
            var data = { Open: series1 };
            return data;
        }

    </script>
</asp:Content>


