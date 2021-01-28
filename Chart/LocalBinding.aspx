<%@ Page Title="Chart-Local Binding-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to bind data for series locally using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="LocalBinding.aspx.cs" Inherits="WebSampleBrowser.Chart.LocalData" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart / DataBinding / LocalData</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
    <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="chartload">
        <PrimaryXAxis Title-Text="Date" MajorGridLines-Visible="false" ValueType="Datetime" />
        <PrimaryYAxis Title-Text="Price ($)" LabelFormat="${value}" />
        <CrossHair Visible="true" Type="Trackball" Marker-Visible="true" Marker-Shape="Circle" Marker-Border-Width="1" 
            Marker-Size-Width="9" Marker-Size-Height="9" Line-Color="transparent" />
        <Title Text="Stock Price Analysis"></Title>
        <Legend Visible="true"></Legend>
        <Series>
            <ej:Series Name="Product X" EnableAnimation="True" Type="Line" Tooltip-Visible="True" 
                Tooltip-Format="#point.x#  : ej.format(#point.y#,n2)" Border-Width="1"/>
            <ej:Series Name="Product X" EnableAnimation="True" Type="Line" Tooltip-Visible="True" 
                Tooltip-Format="#point.x#  : ej.format(#point.y#,n2)" Border-Width="1"/>
        </Series>
    </ej:Chart>
    <script>
        function chartload(sender) {
            onChartLoad(sender);
            //loadTheme(sender);
            var data = GetData();
            sender.model.series[1].dataSource = data.Open;
            sender.model.series[1].xName = "XValue";
            sender.model.series[1].yName = "YValue";
            sender.model.series[0].dataSource = data.Close;
            sender.model.series[0].xName = "XValue";
            sender.model.series[0].yName = "YValue";
        }
        function GetData() {
            var series1 = [];
            var series2 = [];
            var value = 100;
            var value1 = 120;
            for (var i = 1; i < 1000; i++) {

                if (Math.random() > .5) {
                    value += Math.random();
                    value1 += Math.random();
                } else {
                    value -= Math.random();
                    value1 -= Math.random();
                }
                var point1 = { XValue: new Date(1930, i + 2, i), YValue: value };
                var point2 = { XValue: new Date(1930, i + 2, i), YValue: value1 };
                series1.push(point1);
                series2.push(point2);
            }

            var data = { Open: series1, Close: series2 };
            return data;
        }

    </script>
</asp:Content>


