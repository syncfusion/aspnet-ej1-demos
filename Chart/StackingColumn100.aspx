<%@ Page Title="Chart-100% Stacked Column-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates how to render 100% stacked column series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="StackingColumn100.aspx.cs" Inherits="WebSampleBrowser.Chart.StackingColumn100" %>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
<script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" OnClientLoad="onChartLoad"  IsResponsive="true">
            <PrimaryXAxis Title-Text="Year" MajorGridLines-Visible="false" />
            <PrimaryYAxis Title-Text="GDP(%) Per Annum" />
            <CommonSeriesOptions EnableAnimation="True" Tooltip-Visible="true" 
                Tooltip-Format=" #series.name#  <br/>X : #point.x# <br/> Y : #point.y# <br/>Growth Percentage : #point.percentage# %" Type="StackingColumn100" />
           <Series>
             <ej:Series Name="USA" XName="Xvalue" YName="YValue1"></ej:Series>
             <ej:Series Name="India" XName="Xvalue" YName="YValue2"></ej:Series>
             <ej:Series Name="China" XName="Xvalue" YName="YValue3"></ej:Series>
             <ej:Series Name="Canada" XName="Xvalue" YName="YValue4"></ej:Series>
           </Series>
             <Title Text="Gross Domestic Product Growth"></Title>
        </ej:Chart>
    </div>
</asp:Content>


