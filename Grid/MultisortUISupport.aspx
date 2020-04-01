<%@ Page Title="" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MultisortUISupport.aspx.cs" Inherits="WebSampleBrowser.Grid.MultisortUISupport" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Sorting / MultiSort UI Support </span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
<div>
        <ej:Grid ID="FlatGrid" runat="server" AllowSorting="True" AllowPaging="True" AllowGrouping="true" AllowMultiSorting="true">
           <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True"></EditSettings>
           <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="80" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="90" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="80" />
                <ej:Column Field="Freight" HeaderText="Freight" Width="80" Format="{0:C}" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="80" TextAlign="Right" />
            </Columns>
        </ej:Grid>
    </div>
 </asp:Content>