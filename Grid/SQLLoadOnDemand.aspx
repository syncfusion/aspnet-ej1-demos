<%@ Page Title="Grid-SQL LoadOnDemand-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to load the data on demand from SQL DataSource control which is bound to the Syncfusion ASP.NET Web Forms DataGrid" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="SQLLoadOnDemand.aspx.cs" Inherits="WebSampleBrowser.Grid.SQL_LoadOnDemand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <span class="sampleName">Grid / Data Binding / SQL LoadOnDemand</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
      <div>
        <ej:Grid ID="FlatGrid" runat="server" DataSourceID="SqlData" EnableLoadOnDemand="true" AllowSorting="True" AllowPaging="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" />
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="110" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="110" />
            </Columns>           
        </ej:Grid>
        <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
            SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
    </div>
</asp:Content>

