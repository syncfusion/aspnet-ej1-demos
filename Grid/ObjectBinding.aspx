<%@ Page Title="Grid-Object Data-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to bind Object dataSource control as dataSource to the datagrid using Syncfusion ASP.NET Web Forms DataGrid control" AutoEventWireup="true" CodeBehind="ObjectBinding.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.ObjectBinding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Data Binding / Object Data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="EmployeesGrid" runat="server" DataSourceID="ObjectData" AllowSorting="True">
            <Columns>
                <ej:Column Field="Country" HeaderText=" Country" IsPrimaryKey="True" Width="100"/>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="100" />
                <ej:Column Field="FirstName" HeaderText="First Name" Width="100" />
                <ej:Column Field="LastName" HeaderText="Last Name" Width="100" />
                <ej:Column Field="Title" HeaderText="Title" Width="100" />
            </Columns>
        </ej:Grid>
    </div>
    <asp:ObjectDataSource ID="ObjectData" runat="server" TypeName="EmployeeDetails" SelectMethod="GetRecords">
    </asp:ObjectDataSource>
</asp:Content>

