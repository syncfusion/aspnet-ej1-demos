<%@ Page Title="Grid-Remote Data-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to bind remote data as datasource to the Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="Urlbinding.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.Urlbinding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Data Binding / Remote Data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True">
            <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/Orders/" CrossDomain="true"></DataManager>
            <Columns>
                <ej:Column Field="OrderID" HeaderText=" OrderID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="CustomerID" Width="90" />
                <ej:Column Field="EmployeeID" HeaderText="EmployeeID" TextAlign="Right" Width="90" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="80" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" Format="{0:MM/dd/yyyy}" TextAlign="Right" Width="80" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="100" />
            </Columns>
            <PageSettings PageSize="9" />
        </ej:Grid>
    </div>
</asp:Content>



