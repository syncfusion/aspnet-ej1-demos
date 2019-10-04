<%@ Page Title="Chart-Object Binding-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to bind data from object datasource for series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ObjectBinding.aspx.cs" Inherits="WebSampleBrowser.Chart.DataBinding" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Chart / Data Binding / Object Data</span>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
   
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" DataSourceID="ObjectData" Width="900" Height="600" OnClientLoad="onChartLoad"> 
            <Title Text="World Populations"></Title>
            <PrimaryXAxis LabelRotation="45"></PrimaryXAxis>
            <PrimaryYAxis Title-Text="In Billion"></PrimaryYAxis>
            <CommonSeriesOptions Tooltip-Visible="true" />
            <Series>
                <ej:Series XName="Country" YName="Population" Name="Country" Fill="#69D2E7" Type="Column" >
                </ej:Series>
            </Series>
            <Legend Visible="true"></Legend>
        </ej:Chart>
        <asp:ObjectDataSource ID="ObjectData" runat="server" TypeName="ChartObjectData" SelectMethod="GetRecords">
        </asp:ObjectDataSource>
        <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
            SelectCommand="SELECT * FROM [Orders]">
        </asp:SqlDataSource>
    </div>
   
</asp:Content>


