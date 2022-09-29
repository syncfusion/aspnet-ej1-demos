<%@ Page Title="Grid-Load At Once-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to perform actions such as filtering, paging, sorting, etc. in the client side when remote data is used in Syncfusion ASP.NET Web Forms DataGrid." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="LoadAtOnce.aspx.cs" Inherits="WebSampleBrowser.Grid.LoadAtOnce" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Data Binding / Load At Data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True">
            <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/Orders/?$top=450" Offline="True" CrossDomain="true"></DataManager>
            <PageSettings PageSize="9" />
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" IsIdentity="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="80" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="100" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="100" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

