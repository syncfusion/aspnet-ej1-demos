<%@ Page Title="Chart-Range Column-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render range column series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true"  MasterPageFile="~/Samplebrowser.Master" CodeBehind="RangeColumn.aspx.cs" Inherits="WebSampleBrowser.Chart.RangeColumn" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis Title-Text="Month" AxisLine-Visible="false" MajorGridLines-Visible="false" MajorTickLines-Visible="false" />
            <PrimaryYAxis Title-Text="Temperature(Celsius)" AxisLine-Visible="false" />
            <CommonSeriesOptions EnableAnimation="True" Type="RangeColumn" PieCoefficient="0.5" />
            <Series>
             <ej:Series Name="India" XName="Xvalue" Low="YValue1" High="YValue2"></ej:Series>
             <ej:Series Name="Germany" XName="Xvalue" Low="YValue3" High="YValue4"></ej:Series>
            </Series>
            <Title Text="Maximum and Minimum Temperature - 2012"></Title>
        </ej:Chart>
    </div>
</asp:Content>


