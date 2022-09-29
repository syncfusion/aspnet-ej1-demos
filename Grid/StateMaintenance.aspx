<%@ Page Title="Grid-State Maintenance-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to persist the state of the datagrid actions even when the page is refreshed in Syncfusion ASP.NET Web Forms DataGrid." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="StateMaintenance.aspx.cs" Inherits="WebSampleBrowser.Grid.StateMaintenance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / State Maintenance</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowSorting="true" AllowPaging="True" AllowGrouping="True"
            EnablePersistence="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="90" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="100" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="110" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="90" Format="{0:C}" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" Width="100" TextAlign="Right" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="100" />
            </Columns>
            <PageSettings PageSize="9" />
        </ej:Grid>
    </div>
</asp:Content>

