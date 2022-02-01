<%@ Page Title="Grid-Grouping API-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to group or ungroup columns using methods in Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="GroupingAPI.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.gridGroupingAPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Grouping / Grouping API</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowGrouping="True" AllowPaging="True" AllowScrolling="True" EnableHeaderHover="True">
            <ScrollSettings Height="380" Width="700"></ScrollSettings>
            <ClientSideEvents ActionBegin="begin" />
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="150" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="200" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="150" Format="{0:C}" />
                <ej:Column Field="Verified" HeaderText="Verified" Width="150" />
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="200" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Column Name
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="columnName" runat="server" ClientSideOnChange="Onchange" SelectedItemIndex="0" Width="115px">
                        <Items>
                            <ej:DropDownListItem Text="Order ID" Value="0" />
                            <ej:DropDownListItem Text="Customer ID" Value="1" />
                            <ej:DropDownListItem Text="Freight" Value="2" />
                            <ej:DropDownListItem Text="Verified" Value="3" />
                            <ej:DropDownListItem Text="Ship Name" Value="4" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <ej:Button ID="groupColumn" runat="server" Text="GroupColumn" Width="100px" Size="Medium"
                        Type="Button" ClientSideOnClick="clicktoGroup">
                    </ej:Button>
                </div>
                <div class="col-md-3">
                    <ej:Button ID="ungroupColumn" runat="server" Text="UnGroupColumn" Width="115px" Size="Medium"
                        Type="Button" ClientSideOnClick="clicktoGroup">
                    </ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var group = true;
        $(function () {
            var gridObj = $("#<%= OrdersGrid.ClientID %>").ejGrid("instance");
            scrolWidth = gridObj.model.scrollSettings.width / $(".cols-sample-area").width();
            if (gridObj.element.width() > $(".cols-sample-area").width()) {
                var scrollerwidth = Math.floor($(".cols-sample-area").width())
                gridObj.option("model.scrollSettings", { width: scrollerwidth })
                scrolWidth = 1;
            }
            $("#sampleProperties").ejPropertiesPanel();
            $("#<%= ungroupColumn.ClientID%> ").ejButton("disable");
        });
        function begin(args) {
            if (args.requestType == "grouping") {
                if (this.model.groupSettings.groupedColumns.length == this.model.columns.length) {
                    args.cancel = true;
                    alert("Atleast one column must be in grid");
                    group = false;
                }
            }
        }    
        function clicktoGroup(args) {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            var dropdownobj = $('#<%= columnName.ClientID %>').data("ejDropDownList");
            var columnName = dropdownobj.getValue().replace(/\s*/g, "");
            if (this.element.attr('id').indexOf("ungroupColumn") == -1) {
                gridObj.groupColumn(columnName);
                if (group) {
                    $("#<%= groupColumn.ClientID %>").ejButton("disable");
                    $("#<%= ungroupColumn.ClientID %>").ejButton("enable");
                }
            }
            else {
                gridObj.ungroupColumn(columnName);
                group = true;
                $("#<%= ungroupColumn.ClientID %>").ejButton("disable");
                $("#<%= groupColumn.ClientID %>").ejButton("enable");
            }
        }
        function Onchange() {

            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            var dropdownobj = $('#<%= columnName.ClientID %>').data("ejDropDownList");

            var columnName = dropdownobj.getValue().replace(/\s*/g, '');


            if ($.inArray(columnName, gridObj.model.groupSettings.groupedColumns) != -1) {
                $("#<%= ungroupColumn.ClientID %>").ejButton("enable");
                $("#<%= groupColumn.ClientID %>").ejButton("disable");
            }
            else {
                $("#<%= groupColumn.ClientID %>").ejButton("enable");
                $("#<%= ungroupColumn.ClientID %>").ejButton("disable");
            }
        }
    </script>
</asp:Content>




