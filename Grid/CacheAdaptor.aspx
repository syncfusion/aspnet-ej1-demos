<%@ Page Title="" Language="C#" MetaDescription="This demo explains how to prevent a request sent to the server for the already visited pages and caching the required pages for certain duration using Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CacheAdaptor.aspx.cs" Inherits="WebSampleBrowser.Grid.CachingAdaptor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid /Cache Adaptor</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True">
            <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/Orders/" EnableCaching="true" CachingPageSize="10" TimeTillExpiration="120000"></DataManager>
            <Columns>
                <ej:Column Field="OrderID" HeaderText=" OrderID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="CustomerID" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="EmployeeID" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="80" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" Format="{0:MM/dd/yyyy}" TextAlign="Right" Width="80" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="80" />
            </Columns>
            <PageSettings PageSize="9" />
        </ej:Grid>
    </div>
</asp:Content>


