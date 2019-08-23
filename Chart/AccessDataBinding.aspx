<%@ Page Title="Chart-Access Binding-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to bind data from access datasource for series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true" CodeBehind="AccessDataBinding.aspx.cs" Inherits="WebSampleBrowser.Chart.AccessDataBinding" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Chart / Data Binding / Access DataBase</span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" DataSourceID="AccessDataSource11" Width="900" Height="600" OnClientLoad="onChartLoad" OnClientDisplayTextRendering="ondataLabel" >
            <CommonSeriesOptions Tooltip-Visible="true" />
            <PrimaryYAxis Title-Text="In Billion"></PrimaryYAxis>
            <PrimaryXAxis LabelIntersectAction="Rotate45"></PrimaryXAxis>
            <Series>
                <ej:Series Name="Vehicles" XName="MenuText" YName="ID"  Fill="#69D2E7" Type="Column">
                  
                </ej:Series>
            </Series>
            <Title Text="Transport Vehicles Growth"></Title>
        </ej:Chart>
        <script type="text/javascript">
            function ondataLabel(sender) {
                sender.data.text = sender.data.text + "%";
                sender.data.location.x = sender.data.location.x + 8;
            }
        </script>
         <asp:AccessDataSource ID="AccessDataSource11" runat="server" DataFile="~/App_Data/sfaspnet_db.mdb" 
        SelectCommand="SELECT * FROM [Transport] WHERE ID>5">
        </asp:AccessDataSource>
    </div>
</asp:Content>


