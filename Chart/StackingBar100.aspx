<%@ Page Title="Chart-100% Stacked Bar-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates how to render 100% stacked bar series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="StackingBar100.aspx.cs" Inherits="WebSampleBrowser.Chart.StackingBar100" %>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600"  OnClientLoad="onChartLoad" IsResponsive="true">
            <PrimaryXAxis Title-Text="Year" LabelRotation="45" />
            <PrimaryYAxis Title-Text="Sales Percentage(%)" />
            <CommonSeriesOptions EnableAnimation="True" Type="StackingBar100" Tooltip-Visible="true" 
                Tooltip-Format=" #series.name# <br/> X :  #point.x# <br/> Y :  #point.y#  <br/>Percentage :  #point.percentage# %" />
            <Series>
             <ej:Series Name="John" XName="Xvalue" YName="YValue1" Fill="#1ABC9C"></ej:Series>
             <ej:Series Name="Andrew" XName="Xvalue" YName="YValue2" Fill="#3498DB"></ej:Series>
             <ej:Series Name="Thomas" XName="Xvalue" YName="YValue3" Fill="#34495E" Opacity="0.7"></ej:Series>
             <ej:Series Name="Hendry" XName="Xvalue" YName="YValue3" Fill="#00FFFF"></ej:Series>
            </Series>
            <Title Text="Sales by year"></Title>
            <Legend Position="Right" Alignment="Near"></Legend>
        </ej:Chart>
    </div>
</asp:Content>


