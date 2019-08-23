<%@ Page Title="Chart-Step Line-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates how to render and configure stepline series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="StepLine.aspx.cs" Inherits="WebSampleBrowser.Chart.StepLine" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" OnClientLoad="onChartLoad" IsResponsive="true">
            <PrimaryXAxis Title-Text="Year" />
            <PrimaryYAxis Title-Text="Intensity (g/kWh)"/>
            <CommonSeriesOptions EnableAnimation="True" Type="StepLine" Tooltip-Visible="true" 
                Tooltip-Format="#series.name# <br/> #point.x# : #point.y#  (g/kWh)"
                Marker-Shape="Circle" Marker-Visible="true"  Marker-Size-Width="12" Marker-Size-Height="12" Marker-Border-Width="2" />
            <Series>
             <ej:Series Name="USA" XName="Xvalue" YName="YValue1"></ej:Series>
             <ej:Series Name="UK" XName="Xvalue" YName="YValue2"></ej:Series>
             <ej:Series Name="Korea" XName="Xvalue" YName="YValue3"></ej:Series>
             <ej:Series Name="Japan" XName="Xvalue" YName="YValue4"></ej:Series>
            </Series>
            <Title Text="CO2 - Intensity Analysis"></Title>
            <Legend Visible="true"></Legend>
        </ej:Chart>
    </div>
</asp:Content>



