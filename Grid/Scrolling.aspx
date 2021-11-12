<%@ Page Title="Grid-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to render horizontal and vertical scrollbars based on content height and width in Syncfusion ASP.NET Web Forms DataGrid." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Scrolling.aspx.cs" Inherits="WebSampleBrowser.Grid.Scrolling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Scrolling</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowScrolling="True" AllowSorting="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="90" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="100" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="100" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="90" Format="{0:C}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="170" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Width="100" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="110" />
                <ej:Column Field="ShipPostalCode" HeaderText="Ship Postal Code" TextAlign="Right" Width="140" />
                <ej:Column Field="Verified" HeaderText="Verified" Width="100" />
            </Columns>
            <ScrollSettings Height="300" Width="880" ></ScrollSettings>
        </ej:Grid>
    </div>
</asp:Content>
 <asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    
    <script type="text/javascript">
        $(function () {
            var gridObj = $("#<%= OrdersGrid.ClientID %>").ejGrid("instance");
            scrolWidth = gridObj.model.scrollSettings.width / $(".cols-sample-area").width();
            if (gridObj.element.width() > $(".cols-sample-area").width()) {
                var scrollerwidth = Math.floor($(".cols-sample-area").width())
                gridObj.option("model.scrollSettings", { width: scrollerwidth })
                scrolWidth = 1;
            }
        });
        $(window).resize(function () {
            var gridObj = $("#<%= OrdersGrid.ClientID %>").ejGrid("instance")
            var scrollerwidth = Math.floor($(".cols-sample-area").width() * scrolWidth)
            gridObj.option("model.scrollSettings", { width: scrollerwidth })
        });
        </script>
</asp:Content>

