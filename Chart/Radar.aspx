<%@ Page Title="Chart-Radar-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render radar series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Radar.aspx.cs" Inherits="WebSampleBrowser.Chart.Radar" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart / DataBinding / LocalData</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
    <ej:Chart ID="Chart1" runat="server" Height="600" Width="970" IsResponsive="true" OnClientLoad="onChartLoad">
        <CommonSeriesOptions Type="Radar" EnableAnimation="true" Tooltip-Visible="true" />
        <Series>
            <ej:Series Name="Line" XName="Xvalue" YName="YValue3" ZOrder="2">
                <Marker Visible="True"></Marker>
            </ej:Series>
            <ej:Series Name="Column" DrawType="Column" Marker-Visible="False" XName="Xvalue" YName="YValue2" ZOrder="1">
                <Border Color="white" Width="1"></Border>
                <Tooltip Visible="True" Fill="white">
                    <Border Width="1" Color="black"></Border>
                    <Font Color="black"></Font>
                </Tooltip>
            </ej:Series>
            <ej:Series Name="Area" DrawType="Area" Marker-Visible="True" XName="Xvalue" YName="YValue1" ZOrder="0"></ej:Series>
        </Series>
        <Legend Visible="true"></Legend>
    </ej:Chart>

</asp:Content>


