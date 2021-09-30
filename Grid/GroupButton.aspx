<%@ Page Title="Grid-Group Button-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to show a group button in the column header that is used to group columns in Syncfusion ASP.NET Web Forms DataGrid control" AutoEventWireup="true" CodeBehind="GroupButton.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.gridGroupbutton" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Grouping / Group Button</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowGrouping="True" AllowPaging="True">
            <GroupSettings EnableDropAreaAutoSizing="False" ShowToggleButton="True" ShowUngroupButton="True"></GroupSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="90" />
                <ej:Column Field="Freight" HeaderText="Freight" Width="75" TextAlign="Right" Format="{0:C}" />
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="110" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

