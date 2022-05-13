<%@ Page Title="Chart-Bar-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render bar series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true"  MasterPageFile="~/Samplebrowser.Master" CodeBehind="Bar.aspx.cs" Inherits="WebSampleBrowser.Chart.Bar" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad" OnClientDisplayTextRendering="ondataLabel">
            <PrimaryXAxis Title-Text="Year"/>
            <PrimaryYAxis Title-Text="Percentage" LabelFormat="{value}%" />
            <CommonSeriesOptions EnableAnimation="True" Type="Bar" Tooltip-Visible="true" 
                Tooltip-Format="#series.name# <br/> #point.x# : #point.y#" PieCoefficient="0.5"  >
                <Marker>
                   <Border Width="2"></Border>
                   <DataLabel Visible="True" TextPosition="top" HorizontalTextAlignment="Near" EnableContrastColor="true">
                   <Font FontSize="13px" FontFamily="Segoe UI" FontStyle="Normal" FontWeight="Regular"></Font>
                </DataLabel>
                </Marker>
            </CommonSeriesOptions>
            <Series>
                <ej:Series Name="India" XName="Xvalue" YName="YValue1"></ej:Series>
                <ej:Series Name="US" XName="Xvalue" YName="YValue2"></ej:Series>
            </Series>
            <Legend Position="Right" Alignment="Near"></Legend>
            <Title Text="Unemployment rate (%)"></Title>
        </ej:Chart>
         <script>
             function ondataLabel(sender) {
                 sender.data.location.x = sender.data.location.x + 20;
             }
        </script>
    </div>
</asp:Content>


