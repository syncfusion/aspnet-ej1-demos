<%@ Page Title="Chart-Step Area-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render step area series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="StepArea.aspx.cs" Inherits="WebSampleBrowser.Chart.StepArea" %>

<%@ Register assembly="Syncfusion.EJ" namespace="Syncfusion.JavaScript.DataVisualization.Models" tagprefix="ej" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" OnClientLoad="onChartLoad" IsResponsive="true">
            <PrimaryXAxis Title-Text="Year" />
            <PrimaryYAxis Title-Text="Production(billion kWh)" LabelFormat="{value}B" />
            <CommonSeriesOptions EnableAnimation="True" Type="StepArea" 
                Marker-Shape="Circle" Marker-Visible="true" Marker-Size-Height="12" Marker-Size-Width="12" />
            <Series>
                <ej:Series Name="Brazil" XName="Xvalue" YName="YValue1" Fill="#69D2E7" Opacity="0.5"></ej:Series>
            </Series>
            <Legend Visible="true"></Legend>
            <Title Text="Electricity- Production"></Title>
        </ej:Chart>
    </div>
</asp:Content>


