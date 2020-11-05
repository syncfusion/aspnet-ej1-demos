<%@ Page Title="Chart-Remote Binding-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to bind remoted data for Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RemoteBinding.aspx.cs" Inherits="WebSampleBrowser.Chart.RemoteBinding" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart / DataBinding / LocalData</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
    <ej:Chart ID="Chart1" OnClientLoad="chartload" IsResponsive="true" Height="600" runat="server" Width="900">
        <ChartArea Background="transparent" Border-Width="1" />
        <PrimaryXAxis RangePadding="Additional" LabelRotation="45" Title-Text="City" />
        <PrimaryYAxis Visible="true" Title-Text="Population in Millions" />
        <Title Text="Population Growth" />
        <Legend Visible="false" />
        <Series>
            <ej:Series Name="Country" Type="Column" EnableAnimation="True" Fill="#69D2E7" Tooltip-Visible="True" 
                       Tooltip-Format="#point.x# : #point.y# Millions <br/>"/>
        </Series>
    </ej:Chart>
    <script type="text/javascript" language="javascript">

            var dataManger = new ej.DataManager({
                 url: "//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/", crossDomain: true 

            });
            $("#Chart1").ejWaitingPopup()
            $("#Chart1").ejWaitingPopup("show");
            // Query creation
            var query = ej.Query().from("Orders").take(10);


            dataManger.executeQuery(query) // executing query
                     .done(function (e) {
                         $("#Chart1").ejWaitingPopup("hide");
                     });

            function chartload(sender) {
                onChartLoad(sender);
                loadTheme(sender);
                sender.model.series[0].dataSource = dataManger;
                sender.model.series[0].xName = "ShipCity";
                sender.model.series[0].yName = "Freight";
                sender.model.series[0].query = query;
            }
 </script>

</asp:Content>


