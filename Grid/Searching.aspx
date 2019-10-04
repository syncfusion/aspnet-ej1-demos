<%@ Page Title="Grid-Searching-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to search the text entered in the search bar in Syncfusion ASP.NET Web Forms DataGrid content." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Searching.aspx.cs" Inherits="WebSampleBrowser.Grid.Searching" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Filtering /Searching</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="90" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="100" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="110" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="90" Format="{0:C}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="100" />
                <ej:Column Field="Verified" HeaderText="Verified" Width="100"></ej:Column>
            </Columns>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="search"></ToolbarSettings>
        </ej:Grid>
    </div>
</asp:Content>

