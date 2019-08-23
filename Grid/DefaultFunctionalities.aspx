<%@ Page Title="Grid-Default-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to render grid view for tabular data using the Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.DefaultFunctionalities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <link href="../Content/ejthemes/responsive-css/ejgrid.responsive.css" rel="stylesheet" />
    <span class="sampleName">Grid / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="FlatGrid" runat="server" AllowSorting="True" AllowPaging="True" IsResponsive="true">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" Priority="4" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" Priority="3" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Width="80" Format="{0:MM/dd/yyyy}" Priority="2" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" Priority="2" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>



