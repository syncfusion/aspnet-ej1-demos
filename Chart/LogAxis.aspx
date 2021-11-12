<%@ Page Title="Chart-Log Axis-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render logarithmic axis using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="LogAxis.aspx.cs" Inherits="WebSampleBrowser.Chart.LogAxis" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis Title-Text="Years" />
            <PrimaryYAxis ValueType="Logarithmic" MinorTicksPerInterval="5" MinorGridLines-Visible="true" MinorTickLines-Visible="true" 
                MinorTickLines-Width="1" MinorTickLines-Size="5" Title-Text="Profits" LabelFormat="${value}" />
            <Series>
              <ej:Series EnableAnimation="True" Type="Line" Name="Gold" XName="Xvalue" YName="YValue1" 
                Tooltip-Visible="true" ></ej:Series>
            </Series>
            <Title Text="Business Growth from 1990 to 2000"></Title>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>

