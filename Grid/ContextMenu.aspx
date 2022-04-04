<%@ Page Title="Grid-Context Menu-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to open a context menu when right clicking the content, pager, or header in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ContextMenu.aspx.cs" Inherits="WebSampleBrowser.Grid.ContextMenu" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Context Menu</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="FlatGrid" runat="server" AllowSorting="True" AllowPaging="True" AllowGrouping="true">            
            <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True"></EditSettings>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
            <ContextMenuSettings EnableContextMenu="true"></ContextMenuSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75">
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
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
            </Columns>
        </ej:Grid>
    </div>    
</asp:Content>

