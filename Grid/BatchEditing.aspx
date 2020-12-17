<%@ Page Title="Grid-Batch Editing-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to update bulk data changes to data source using Batch Edit mode in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="BatchEditing.aspx.cs" Inherits="WebSampleBrowser.Grid.BatchEditing" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Editing / Batch Editing</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="75">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                        <ej:KeyValue Key="number" Value="true" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                        <ej:KeyValue Key="minlength" Value="3" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="80" EditType="DropdownEdit" />
                <ej:Column Field="Employee.Address" HeaderText="Address" Width="130" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}" EditType="NumericEdit">
                    <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                </ej:Column>
                <ej:Column Field="ShipName" HeaderText="ShipName" Width="150" />
                <ej:Column Field="ShipCountry" HeaderText="ShipCountry" Width="90" EditType="DropdownEdit" />
            </Columns>
            <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True" EditMode="Batch"></EditSettings>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
        </ej:Grid>
    </div>
</asp:Content>

