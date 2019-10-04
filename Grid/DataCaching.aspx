<%@ Page Title="Grid-Data Caching-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to prevent a request sent to the server for already visited pages and caching the required pages for certain duration in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataCaching.aspx.cs" Inherits="WebSampleBrowser.Grid.DataCaching" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Data Caching</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:DataManager ID="FlatData" runat="server" URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/Orders/" EnableCaching="true" CachingPageSize="10" TimeTillExpiration="120000"/>
    </div>
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" DataManagerID="FlatData">
            
            <Columns>
                <ej:Column Field="OrderID" HeaderText=" OrderID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="CustomerID" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="EmployeeID" TextAlign="Right" Width="80" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="80" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" Format="{0:MM/dd/yyyy}" TextAlign="Right" Width="80" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="100" />
            </Columns>
            <PageSettings PageSize="9" />
        </ej:Grid>
    </div>
</asp:Content>




