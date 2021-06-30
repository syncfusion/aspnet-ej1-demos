<%@ Page Title="Chart-Multicolor Line-ASP.NET-SYNCFUSION"   Language="C#"MetaDescription="This sample demonstrates how to configure line series with multiple colors using Syncfusion ASP.NET Web Forms Chart control"  AutoEventWireup="true"  MasterPageFile="~/Samplebrowser.Master" CodeBehind="Multicolor.aspx.cs" Inherits="WebSampleBrowser.Chart.Multicolor" %>

 

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
    <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="chartload">
        <PrimaryXAxis Title-Text="Year"   ValueType="Datetime" />
        <PrimaryYAxis Title-Text="Particulate Matter(PM)"  />
        <CrossHair Visible="true" Type="Trackball" Marker-Visible="true" Marker-Shape="Circle" Marker-Border-Width="1" 
            Marker-Size-Width="9" Marker-Size-Height="9" Line-Color="transparent" />
        <Title Text="Particulate levels in Rainfall"></Title>
        <Legend Visible="false"></Legend>
        <Series>
            <ej:Series Name="Rainfall" EnableAnimation="True" Type="Line" Tooltip-Visible="True" 
                Tooltip-Format="#point.x#  : ej.format(#point.y#,n2)" Border-Width="1"/>
            
        </Series>
    </ej:Chart>
    <script>
        function chartload(sender) {
            onChartLoad(sender);
            loadTheme(sender);
            var data = GetData();
            sender.model.series[0].dataSource = data.Open;
            sender.model.series[0].xName = "XValue";
            sender.model.series[0].yName = "YValue";
            sender.model.series[0].pointColorMappingName = "color";
        }
        function GetData() {
            var series1 = [];
            var value = 0;
            var color = ["red", "green", "fuchsia", "crimson", "blue", "darkorange", "deepskyblue", "mediumvioletred", "violet", "peru", "gray", "deeppink", "navy"];
            for (var i = 0	; i < 201; i++) {
                if (Math.random() > .5) {
                    value += Math.random();
                } else {
                    value -= Math.random();
                }
                var point = { XValue: new Date(1998, i + 10, i), YValue: value, color: color[Math.floor(i / 16)] };
                series1.push(point);
            }
            var data = { Open: series1 };
            return data;
        }
    </script>
</asp:Content>


