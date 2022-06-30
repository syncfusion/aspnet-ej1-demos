<%@ Page Title="Chart-Spline Area-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render spline area series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SplineArea.aspx.cs" Inherits="WebSampleBrowser.Chart.SplineArea" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
 <script type="text/javascript" src="../Scripts/ChartData.js"></script> 
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" OnClientLoad="onChartLoad"  IsResponsive="true">
            <PrimaryXAxis AxisLine-Visible="false" MajorGridLines-Visible="false" MinorGridLines-Visible="false" Title-Text="Year" />
            <PrimaryYAxis Title-Text="Rate in %" MajorTickLines-Visible="false" AxisLine-Visible="false" LabelFormat="{value}%" />
            <CommonSeriesOptions EnableAnimation="True" Type="SplineArea" Border-Color="transparent" Opacity="0.5"/>
            <Series>
                 <ej:Series Name="US" XName="Xvalue" YName="YValue1" Fill="#C4C24A" Opacity="0.5"></ej:Series>
                 <ej:Series Name="France" XName="Xvalue" YName="YValue2" Fill="#69D2E7" Opacity="0.5"></ej:Series>
                 <ej:Series Name="Germany" XName="Xvalue" YName="YValue3" Fill="#6A4B82" Opacity="0.5"></ej:Series>
            </Series>
            <Title Text="Inflation Rate"></Title>
            <Legend Visible="true"></Legend>

        </ej:Chart>
    </div>
</asp:Content>




