<%@ Page Title="Chart-XML Binding-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to bind xml data for series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="XmlBinding.aspx.cs" Inherits="WebSampleBrowser.Chart.XmlBinding" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart / DataBinding / LocalData</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
      <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="ChartXml" OnClientLoad="onChartLoad" runat="server" Width="900" Height="600">
            <PrimaryYAxis Title-Text="In Centimetres"></PrimaryYAxis>
            <CommonSeriesOptions Tooltip-Visible="true" />
            <Series>
                <ej:Series Name="USA"   XName="Year" YName="USA" Type="Bar" ></ej:Series>
                <ej:Series Name="India" XName="Year" YName="India" Type="Bar" ></ej:Series>
                <ej:Series Name="China" XName="Year" YName="China" Type="Bar" ></ej:Series>
            </Series>
            <Title Text="Average Rainfall"></Title>
        </ej:Chart>
       
    </div>
</asp:Content>


