<%@ Page Title="Grid-List Binding-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to bind local data as dataSource to the DataSource property of Syncfusion ASP.NET Web Forms DataGrid." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="LocalBinding.aspx.cs" Inherits="WebSampleBrowser.Grid.Localbinding" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <link href="../Content/ejthemes/responsive-css/ejgrid.responsive.css" rel="stylesheet" />
    <span class="sampleName">Grid / Data Binding / List Binding</span>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" IsResponsive="true">
           <Columns>
                <ej:Column Field="OrderID" HeaderText="OrderID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="CustomerID" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="EmployeeID" TextAlign="Right" Width="75" Priority="2" />
                <ej:Column Field="Freight" HeaderText="Freight" Format="{0:C}" TextAlign="Right" Width="75" Priority="3"/>
                <ej:Column Field="OrderDate" HeaderText="Order Date" Format="{0:MM/dd/yyyy}" TextAlign="Right" Width="80" Priority="4"/>
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" Priority="4"/>
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

