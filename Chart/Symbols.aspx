<%@ Page Title="Chart-Symbols-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to customize symbols shapes for marker using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Symbols.aspx.cs" Inherits="WebSampleBrowser.Chart.Symbols" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ControlsSection">
      <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" OnClientLoad="onChartLoad" Width="970" Height="600" IsResponsive="true">
            <PrimaryXAxis Title-Text="Year" RangePadding="Additional" />
            <PrimaryYAxis Title-Text="Inflation Rate(%)" RangePadding="None" LabelFormat="{value}%"/>
            <CommonSeriesOptions EnableAnimation="True" Type="Line"></CommonSeriesOptions>
             <Series>
             <ej:Series Name="India" XName="Xvalue" YName="YValue1" Tooltip-Visible="true" Tooltip-Format="#series.name# : #point.y# in #point.x#" 
                     Marker-Shape="Diamond" Marker-Visible="true" Marker-Size-Width="15" Marker-Size-Height="15"></ej:Series>
             <ej:Series Name="China" XName="Xvalue" YName="YValue2" Tooltip-Visible="true" Tooltip-Format="#series.name# : #point.y# in #point.x#" 
                     Marker-Shape="Triangle" Marker-Visible="true" Marker-Size-Width="15" Marker-Size-Height="15"></ej:Series>
             <ej:Series Name="Japan" XName="Xvalue" YName="YValue3"  Tooltip-Visible="true" Tooltip-Format="#series.name# : #point.y# in #point.x#" 
                     Marker-Shape="Hexagon" Marker-Visible="true" Marker-Size-Width="15" Marker-Size-Height="15"></ej:Series>
           </Series>
            <Title Text="Inflation Analysis"></Title>
            <Legend Visible="true"></Legend>
        </ej:Chart>
    </div>
</asp:Content>





