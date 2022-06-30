<%@ Page Title="Grid-Live Update-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to update the values of the cells in datagrid continuously in regular intervals of time with Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="LiveUpdate.aspx.cs" Inherits="WebSampleBrowser.Grid.LiveUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Live Update</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="ProductsGrid" runat="server" AllowSelection="False" EnableRowHover="False">
            <ClientSideEvents QueryCellInfo="update" />
            <Columns>
                <ej:Column Field="ProductID" HeaderText="Product ID" IsPrimaryKey="true" TextAlign="Right" Width="55" />
                <ej:Column Field="ProductName" HeaderText="Product Name" Width="175" />
                <ej:Column Field="UnitPrice" HeaderText="Unit Price" TextAlign="Right" Width="65" Format="{0:C}" />
                <ej:Column Field="UnitInStock" HeaderText="Unit In Stock" TextAlign="Right" Width="75" />
                <ej:Column Field="UnitOnOrder" HeaderText="Unit On Order" Width="75" TextAlign="Right" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Start Update
                </div>
                <div class="col-md-3">
                    <ej:Button ID="Start" runat="server" Type="Button" Text="Start" ClientSideOnClick="start" Width="100px">
                    </ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Stop Update
                </div>
                <div class="col-md-3">
                    <ej:Button ID="Stop" runat="server" Type="Button" Text="Stop" Enabled="False" ClientSideOnClick="stop" Width="100px">
                    </ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function update(args) {
            if (args.column !== undefined && args.column.field === "UnitPrice") {
                var $element = $(args.cell);
                if (ej.parseFloat(ej.format(args.text, "c")) < 30)
                    $element.css("background-color", "#5ec026").css("color", "black");
                else
                    $element.css("background-color", "#86dd55").css("color", "black");
            }
        }
        function start() {
            timerID = setInterval(refreshGrid, 2000);
            $('#<%= Start.ClientID %>').ejButton("instance").disable();
            $('#<%= Stop.ClientID %>').ejButton("instance").enable();
        }
        function stop() {
            clearInterval(timerID);
            $('#<%= Stop.ClientID %>').ejButton("instance").disable();
            $('#<%= Start.ClientID %>').ejButton("instance").enable();
        }
        function refreshGrid() {
            var model = $('#<%= ProductsGrid.ClientID %>').ejGrid("model");
            for (var i = 0; i < model.dataSource.length; i++) {
                model.dataSource[i].UnitPrice = Math.floor(Math.random() * 50 + 1);
                model.dataSource[i].UnitInStock = Math.floor(Math.random() * 100);
                model.dataSource[i].UnitOnOrder = Math.floor(Math.random() * 5) * 10;
            }
            $('#<%= ProductsGrid.ClientID %>').ejGrid("refreshContent");
        }
    </script>
</asp:Content>


