<%@ Page Title="Chart-100% Stacked Area-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates how to render 100% stacked area series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="StackingArea100.aspx.cs" Inherits="WebSampleBrowser.Chart.StackingArea100" %>
 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
  <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" OnClientLoad="onChartLoad" IsResponsive="true">
            <PrimaryXAxis Title-Text="Year" AxisLine-Visible="false" MajorGridLines-Visible="false" MajorTickLines-Visible="false" />
            <PrimaryYAxis Title-Text="Temperature(%)" />
            <CommonSeriesOptions EnableAnimation="True" Type="StackingArea100" Opacity="0.5" Border-Color="transparent" />
            <Series>
             <ej:Series Name="USA" XName="Xvalue" YName="YValue1" Fill="#C4C24A"></ej:Series>
             <ej:Series Name="India" XName="Xvalue" YName="YValue2" Fill="#69D2E7"></ej:Series>
             <ej:Series Name="Canada" XName="Xvalue" YName="YValue3" Fill="#6A4B82"></ej:Series>
             <ej:Series Name="China" XName="Xvalue" YName="YValue4" Fill="#E7B0B2"></ej:Series>
            </Series>
            <Title Text="Annual Temperature Comparison"></Title>
            <Legend Visible="true"></Legend>
        </ej:Chart>
    </div>
</asp:Content>


