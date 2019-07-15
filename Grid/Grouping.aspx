<%@ Page Title="Grid-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains the basic functionalities of grouping and how to group a column in the initial rendering of Syncfusion ASP.NET Web Forms DataGrid control" AutoEventWireup="true" CodeBehind="Grouping.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.gridGrouping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Grouping / Default Functionalities</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowGrouping="True" AllowSorting="True" AllowPaging="True">
            <GroupSettings EnableDropAreaAutoSizing="False" GroupedColumns="ShipCountry"></GroupSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="65" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="90" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="90" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="90" />
                <ej:Column Field="Verified" HeaderText="Verified" Width="70" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Format="{0:MM/dd/yy}" Width="90" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

