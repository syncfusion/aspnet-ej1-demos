<%@ Page Title="Grid-Stacked Header-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to provide a common header for the group of columns using Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="StackedHeader.aspx.cs" Inherits="WebSampleBrowser.Grid.StackedHeader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / StackedHeader</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="FlatGrid" runat="server" DataSourceID="SqlData" AllowReordering="true" AllowResizing="true" ShowStackedHeader="true" AllowSorting="True" AllowPaging="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" />
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="110" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="110" />
            </Columns>
            <StackedHeaderRows>
                <ej:StackedHeaderRow>
                    <StackedHeaderColumns>
                        <ej:StackedHeaderColumn Column="OrderID,OrderDate,Freight" HeaderText="Order Details" />
                        <ej:StackedHeaderColumn Column="ShipName,ShipCity,ShipCountry" HeaderText="Ship Details" />
                    </StackedHeaderColumns>
                </ej:StackedHeaderRow>
            </StackedHeaderRows>
        </ej:Grid>
        <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
            SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
    </div>
</asp:Content>

