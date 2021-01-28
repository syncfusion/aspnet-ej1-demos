<%@ Page Title="Grid-AutoWrap Column Cells-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to wrap the content of datagrid cells within the specified width of columns in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Scrolling.aspx.cs" Inherits="WebSampleBrowser.Grid.Scrolling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / TextWrap</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowScrolling="True" AllowPaging="True" AllowTextWrap="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="90" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="100" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="100" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="90" Format="{0:C}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="90" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Width="100" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="110" />
                <ej:Column Field="ShipPostalCode" HeaderText="Ship Postal Code" TextAlign="Right" Width="110" />
                <ej:Column Field="Verified" HeaderText="Verified" Width="100" />
            </Columns>
            <ScrollSettings Height="300" Width="980" ></ScrollSettings>
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
        
    </script>
</asp:Content>

