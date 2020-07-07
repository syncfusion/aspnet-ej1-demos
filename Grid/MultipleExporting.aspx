<%@ Page Title="Grid-Multiple Exporting-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to export the content of multiple datagrids to a single file using Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MultipleExporting.aspx.cs" Inherits="WebSampleBrowser.Grid.MultipleExporting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Events</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        Employee Grid
    </div>
    <div>
        <ej:Grid ID="EmployeesGrid" runat="server" OnServerExcelExporting="EmployeesGrid_ServerExcelExporting" OnServerWordExporting="EmployeesGrid_ServerWordExporting" OnServerPdfExporting="EmployeesGrid_ServerPdfExporting" AllowSelection="True">
            <ToolbarSettings ShowToolbar="true" ToolbarItems="excelExport,wordExport,pdfExport"></ToolbarSettings>
            <Columns>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" IsPrimaryKey="true" TextAlign="Right" Width="100" />
                <ej:Column Field="FirstName" HeaderText="First Name" Width="100" />
                <ej:Column Field="LastName" HeaderText="Last Name" Width="100" />
                <ej:Column Field="Title" HeaderText="Title" Width="90" />
                <ej:Column Field="BirthDate" HeaderText="Birth Date" Width="100" TextAlign="Right" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="Country" HeaderText="Country" Width="120" />
            </Columns>
        </ej:Grid>
    </div>
    <div>
        Orders Grid
    </div>
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="False">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" Width="80" TextAlign="Right" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>


