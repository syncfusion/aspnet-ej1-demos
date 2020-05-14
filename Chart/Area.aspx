<%@ Page Title="Chart-Area-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure area series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Area.aspx.cs" Inherits="WebSampleBrowser.Chart.Area" %>

 
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" IsResponsive="true" Height="600" OnClientLoad="onChartLoad">
            <PrimaryXAxis MajorGridLines-Visible="false" MinorGridLines-Visible="false" AxisLine-Visible="true" Title-Text="Year" />
            <PrimaryYAxis AxisLine-Visible="false" MajorTickLines-Visible="false" Title-Text="Sales Amount in Millions" />
            <CommonSeriesOptions Type="Area" Marker-Border-Width="2" Marker-Border-Color="transparent" Opacity="0.5" 
                EnableAnimation="True" />
            <Series>
                <ej:Series Name="Product A" XName="Xvalue" YName="YValue1" Fill="#69D2E7"></ej:Series>
             <ej:Series Name="Product B" XName="Xvalue" YName="YValue2" Fill="#C4C24A"></ej:Series>
             <ej:Series Name="Product C" XName="Xvalue" YName="YValue3" Fill="#6A4B82"></ej:Series>
                </Series>
            <Title Text="Average Sales Comparison"></Title>
            <Legend Visible="true"></Legend>
        </ej:Chart>
    </div>
</asp:Content>

 


