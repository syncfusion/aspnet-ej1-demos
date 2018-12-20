<%@ Page Title="Chart-Stacked Column-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render stacked column series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="StackingColumn.aspx.cs" Inherits="WebSampleBrowser.Chart.StackingColumn" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" OnClientLoad="onChartLoad" IsResponsive="true">
            <PrimaryXAxis Title-Text="Month" MajorGridLines-Visible="false" />
            <PrimaryYAxis Title-Text="Number of visitors in Millions" />
            <CommonSeriesOptions EnableAnimation="True" Tooltip-Visible="true" 
                Tooltip-Format="#series.name#  <br/> #point.x# : #point.y# Million Visitors" Type="StackingColumn" />
            <Series>
             <ej:Series Name="Google" XName="Xvalue" YName="YValue1"></ej:Series>
             <ej:Series Name="Bing" XName="Xvalue" YName="YValue2"></ej:Series>
             <ej:Series Name="Yahoo" XName="Xvalue" YName="YValue3"></ej:Series>
             <ej:Series Name="Ask" XName="Xvalue" YName="YValue4"></ej:Series>
            </Series>
             <Title Text="Most Popular Search Engines"></Title>
        </ej:Chart>
    </div>
</asp:Content>


