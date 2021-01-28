<%@ Page Title="Chart-Stacked Bar-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render stacking bar series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="StackingBar.aspx.cs" Inherits="WebSampleBrowser.Chart.StackingBar" %>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
 <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" OnClientLoad="onChartLoad"  IsResponsive="true">
            <PrimaryXAxis Title-Text="Month" LabelRotation="45" />
            <PrimaryYAxis Title-Text="Percentage" LabelFormat="{value}%" />
            <CommonSeriesOptions EnableAnimation="True" Type="StackingBar" Tooltip-Visible="true" 
                Tooltip-Format="#series.name# <br/> #point.x# : #point.y#" />
            <Series>
             <ej:Series Name="Apple" XName="Xvalue" YName="YValue1" Fill="#1ABC9C"></ej:Series>
             <ej:Series Name="Orange" XName="Xvalue" YName="YValue2" Fill="#3498DB"></ej:Series>
             <ej:Series Name="Wastage" XName="Xvalue" YName="YValue3" Fill="#34495E" Opacity="0.7"></ej:Series>
            </Series>
            <Title Text="Sales Comparsion"></Title>
            <Legend Position="Right" Alignment="Near"></Legend>
        </ej:Chart>
    </div>
</asp:Content>

 

