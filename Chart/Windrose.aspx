<%@ Page Title="Chart-Wind Rose-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render windrose series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Windrose.aspx.cs" Inherits="WebSampleBrowser.Chart.Windrose" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart / DataBinding / LocalData</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
      <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
    <ej:Chart ID="Chart1" runat="server" Height="600" Width="970" IsResponsive="true" OnClientLoad="onChartLoad">
        <ChartBorder Color="black" Width="1" />
        <PrimaryXAxis LabelPlacement="onticks" Title-Text="Year"/>
        <PrimaryYAxis LabelFormat="{value}%" Title-Text="Efficiency" />
        <CommonSeriesOptions Tooltip-Visible="true" Type="Polar" EnableAnimation="true" IsStacking="true" 
            DrawType="Column" Marker-Visible="false" Marker-Size-Width="10" Marker-Size-Height="10" Border-Color="white" Border-Width="0.5" />
       <Series>
           <ej:Series Name="0-3" Fill="#F37021" XName="Xvalue" YName="YValue1"></ej:Series>
           <ej:Series Name="3-6"  Fill="#FD9D6F" XName="Xvalue" YName="YValue2"></ej:Series>
           <ej:Series Name="6-9"  Fill="#FEE378" XName="Xvalue" YName="YValue3"></ej:Series>
           <ej:Series Name="9-11"  Fill="#97D6E8" XName="Xvalue" YName="YValue4"></ej:Series>
           <ej:Series Name="11-14"   Fill="#4DB797" XName="Xvalue" YName="YValue5"></ej:Series>
           <ej:Series Name="14-17"    Fill="#6666FF" XName="Xvalue" YName="YValue6"></ej:Series>
           <ej:Series Name="17-20"    Fill="#6251B5" XName="Xvalue" YName="YValue7"></ej:Series>
           <ej:Series Name="23 Above"    Fill="#2326AF" XName="Xvalue" YName="YValue8"></ej:Series>
       </Series>
         <Title Text="Wind Rose Chart"></Title>
        <Legend Visible="true" Alignment="Near" Position="Right" >
		  <Title Text="WindRose Knots" TextAlignment="center"></Title></Legend>
    </ej:Chart>
</asp:Content>


