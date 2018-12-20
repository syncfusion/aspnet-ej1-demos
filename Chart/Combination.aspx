<%@ Page Title="Chart-Combination-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render combination series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Combination.aspx.cs" Inherits="WebSampleBrowser.Chart.Combination" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis Title-Text="Month" />
            <PrimaryYAxis Title-Text="Unit Sold" />
            <CommonSeriesOptions Tooltip-Visible="true" EnableAnimation="True"/>
            <Axes>
                <ej:Axis MajorGridLines-Visible="false" OpposedPosition="true" AxisLine-Visible="false" 
                    RangePadding="Normal" Name="yAxis" LabelFormat="${value}" Title-Text="Total Transactions" />
            </Axes>
            <Legend Visible="true" Font-FontSize="15px" Shape="seriesType" Position="Top" 
                   ItemStyle-Width="15" ItemStyle-Height="15"></Legend>
            <Title Text="Sales Report"></Title>
            <Series>
                <ej:Series Name="Unit Sold" XName="Xvalue" YName="YValue1"  Type="Column" EnableAnimation="True" 
                    Tooltip-Visible="True" Tooltip-Format="#point.x# <br/> Unit Sold : #point.y# <br/>" Fill="#69D2E7"></ej:Series>
                <ej:Series Name="Total Transaction" XName="Xvalue" YName="YValue2" Type="Line" EnableAnimation="True" 
                    Tooltip-Visible="True" Tooltip-Format="#point.x# <br/> Profit : #point.y# <br/>" 
                    YAxisName="yAxis" Marker-Shape="Circle" Marker-Visible="True" Marker-Size-Height="8" Marker-Size-Width="8">
                </ej:Series>
            </Series>
        </ej:Chart>
    </div>
</asp:Content>


