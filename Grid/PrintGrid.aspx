<%@ Page Title="Grid-Print Grid-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to print the records of the datagrid using the Print feature of Syncfusion ASP.NET DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PrintGrid.aspx.cs" Inherits="WebSampleBrowser.Grid.PrintGrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Print Grid</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="FlatGrid" runat="server" AllowSorting="True" AllowPaging="True">
            <ToolbarSettings ShowToolbar="true" ToolbarItems="printGrid"></ToolbarSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Width="80" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>


