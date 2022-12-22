<%@ Page Title="Chart-Live-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render live Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Live.aspx.cs" Inherits="WebSampleBrowser.Chart.Live" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style= "height:600px;">
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" 
             OnClientLoad="chartload" Background="transparent" EnableCanvasRendering="true">
            <PrimaryXAxis MajorGridLines-Visible="false"/>
            <Series>
                <ej:Series Opacity="0.8" Type="Line" EnableAnimation="False"/>
                <ej:Series Opacity="0.8" Type="Line" EnableAnimation="False"/>
            </Series>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
    <script>
          var chartobj,
		count = 0,
        liveIntial=0,
		chartData = null,
		chartData1 = null,
		value = 10,
        value1 = 15;
    generateData();


    function chartload(sender) {
            onChartLoad(sender);
        	chartobj = this;
        	sender.model.series[0].points = chartData;
        	sender.model.series[1].points = chartData1;
        	window.setInterval(update, 40);
    	}

        function generateData() {
        var num = 100, data = [], data1 = [];;
        for (liveIntial; liveIntial < num; liveIntial++) {
            if (Math.random() > .5) {
                if (value < 45)
                    value += Math.random() * 2.0;
                else
                    value -= 2.0;


                if (value1 < 40)
                    value1 += Math.random() * 1.8;
                else
                    value1 -= 2.0;
            }
            else {
                if (value > 5)
                    value -= Math.random() * 2.0;
                else
                    value += 2.0;

                if (value1 > 5)
                    value1 -= Math.random() * 1.8;
                else
                    value1 += 2.0;
            }
            data[liveIntial] = {
                x: liveIntial.toString(), y: value
            };
            data1[liveIntial] = {
                x: liveIntial.toString(), y: value1 + 10
            };
        }
        chartData = data;
        chartData1 = data1;
    };


        function update() {
                if (Math.random() > .5) {
                    if (value < 45)
                        value += Math.random() * 2.0;
                    else
                        value -= 2.0;


                    if (value1 < 40)
                        value1 += Math.random() * 1.8;
                    else
                        value1 -= 2.0;
                }
                else {
                    if (value > 5)
                        value -= Math.random() * 2.0;
                    else
                        value += 2.0;

                    if (value1 > 5)
                        value1 -= Math.random() * 1.8;
                    else
                        value1 += 2.0;
                }
                chartData.push({ x: liveIntial.toString(), y: value });
                chartData1.push({ x: liveIntial.toString(), y: value1 + 10 });
                liveIntial++;
                chartData.shift();
                chartData1.shift();
                chartobj.model.series[0].points = chartData;
                chartobj.model.series[1].points = chartData1;
                $("#Chart1").ejChart("redraw");
        }

     </script>
</asp:Content>


