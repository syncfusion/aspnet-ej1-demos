<%@ Page Title="Chart-Spline Range Area-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates how to render spline range area series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="SplineRangeArea.aspx.cs" Inherits="WebSampleBrowser.Chart.SplineRangeArea" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
           <ChartArea><Border Color="transparent"/></ChartArea>
            <PrimaryXAxis AxisLine-Visible="false" MajorTickLines-Visible="false" MajorGridLines-Visible="false" MinorGridLines-Visible="false" Title-Text="Month" />
            <PrimaryYAxis Title-Text="Temperate(Farenheit)" MajorTickLines-Visible="false" AxisLine-Visible="false" />
            <CommonSeriesOptions EnableAnimation="True" Type="SplineRangeArea">
            </CommonSeriesOptions>
            <Series>
                <ej:Series Name="India" XName="Xvalue" High="YValue1" Low="YValue2" Opacity="0.5"></ej:Series>
                <ej:Series Name="Russia" XName="Xvalue" High="YValue3" Low="YValue4" Opacity="0.5"></ej:Series>
            </Series>
            <Title Text="Monthly Temperature Range"></Title>
            <Legend Visible="true"></Legend>
        </ej:Chart>
    </div>
</asp:Content>
