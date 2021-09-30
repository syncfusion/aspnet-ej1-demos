<%@ Page Title="Chart-SQL Binding-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to bind data from sql datasource for series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SQLBinding.aspx.cs" Inherits="WebSampleBrowser.Chart.SQLBinding" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart / DataBinding / SQLData</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
<script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" DataSourceID="SqlData" Width="900" Height="600" OnClientLoad="onChartLoad" >
            <PrimaryXAxis  LabelIntersectAction="Trim"></PrimaryXAxis>
            <CommonSeriesOptions Tooltip-Visible="true" />
            <Series>
                <ej:Series Name="UnitPrice" XName="ProductName" YName="UnitPrice" Type="Bar"></ej:Series>
                <ej:Series Name="UnitsInStock" XName="ProductName" YName="UnitsInStock"  Type="Bar"></ej:Series>
            </Series>
            <Title Text="Product Details"></Title>
        </ej:Chart>
        <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
            SelectCommand="SELECT * FROM [Products] WHERE UnitPrice < 10"></asp:SqlDataSource>
    </div>
 </asp:Content>


