<%@ Page Title="Grid-Resize-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to resize the width of the datagrid columns in Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="Resizing.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.Resizing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Columns / Resize</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" AllowScrolling="True" AllowResizing="True">
            <ScrollSettings Width="650" Height="400"></ScrollSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="90" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="100" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="100" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="170" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Width="100" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="110" />
                <ej:Column Field="ShipPostalCode" HeaderText="Ship Postal Code" TextAlign="Right" Width="140" />
                <ej:Column Field="Verified" HeaderText="Verified" Width="100" />
            </Columns>
            <PageSettings PageSize="15" />
        </ej:Grid>
    </div>
</asp:Content>

