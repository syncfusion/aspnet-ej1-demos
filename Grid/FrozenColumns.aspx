<%@ Page Title="" Language="C#" MetaDescription="This demo explains how to freeze the required number of rows and columns when the content is scrolled using Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Scrolling.aspx.cs" Inherits="WebSampleBrowser.Grid.Scrolling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / FrozenColumns</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowScrolling="True" >
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="90" IsFrozen="true" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="100" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="100" IsFrozen="true" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="90" Format="{0:C}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="170" IsFrozen="true" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Width="100" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="110" />
                <ej:Column Field="ShipPostalCode" HeaderText="Ship Postal Code" TextAlign="Right" Width="140" />
                <ej:Column Field="Verified" HeaderText="Verified" Width="100" />
            </Columns>
            <ScrollSettings Height="300" Width="760" ></ScrollSettings>
        </ej:Grid>
    </div>
</asp:Content>
