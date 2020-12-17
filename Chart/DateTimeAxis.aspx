<%@ Page Title="Chart-DateTime Axis-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure date time axis using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DateTimeAxis.aspx.cs" Inherits="WebSampleBrowser.Chart.DateTimeAxis" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis ValueType="Datetime" LabelFormat="MMM-yyyy" IntervalType="Years" Title-Text="Sales Across Years" /> 
            <PrimaryYAxis LabelFormat="${value}" Title-text="Sales Amount in millions(USD)" />
             <Series>
               <ej:Series EnableAnimation="True" Type="Line" Name="Sales" XName="Xvalue" YName="YValue1" 
                   Border-Width="3" Marker-Visible="true" Marker-Size-Height="10"  Marker-Size-Width="10" Tooltip-Visible="true" 
                   Tooltip-Format="Date : #point.x#  <br/> Profit : #point.y#"></ej:Series>
              </Series>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>

