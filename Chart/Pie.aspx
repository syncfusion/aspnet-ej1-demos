<%@ Page Title="Chart-Pie-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure pie series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Pie.aspx.cs" Inherits="WebSampleBrowser.Chart.Pie" %>

 
 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad" OnClientSeriesRendering="seriesRender">
            <Title Text="Expenditures"></Title>
            <Series>
                <ej:Series EnableAnimation="True" 
                    Marker-DataLabel-Visible="True" Marker-DataLabel-Shape="None" Marker-DataLabel-ConnectorLine-Type="Bezier"
                    Marker-DataLabel-ConnectorLine-Color="Black" Name="Expenses" XName="Xvalue" YName="YValue1" Type="Pie"
                    LabelPosition="OutsideExtended" EnableSmartLabels="True" StartAngle="145" Marker-DataLabel-EnableContrastColor="true"
                    Border-Color="white" Border-Width="2">
                    <Points>
                        <ej:points Text="Other Personal, 88.47%" X="Other Personnal" Y="94658" />
                        <ej:points Text="Medical care, 8.49%" X="Medical care" Y="9090"/>
                        <ej:points Text="Housing, 2.40%" X="Housing" Y="2577"/>
                        <ej:points Text="Transportation, 0.44%" X="Transportation" Y="473"/>
                        <ej:points Text="Education, 0.11%" X="Education" Y="120"/>
                        <ej:points Text="Electronics, 0.06%" X="Electronics" Y="70"/>
                    </Points>
                </ej:Series>
            </Series>
            <Legend Visible="False"></Legend>
        </ej:Chart>
    </div>
     <script>
         function seriesRender(sender) {
             if (sender.model.theme == "flatdark" || sender.model.theme == "gradientdark" || sender.model.theme == "high-contrast-01")
                 sender.data.series.marker.dataLabel.connectorLine.color = "white";
         }
     </script>
</asp:Content>


