<%@ Page Title="Grid-Sorting API-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to sort columns dynamically using methods of Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SortingAPI.aspx.cs" Inherits="WebSampleBrowser.Grid.SortingAPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Sorting / Sorting API</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowSorting="true" AllowPaging="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="90" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="100" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="110" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="90" Format="{0:C}" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" Width="100" TextAlign="Right" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="100" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Column name
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="columnName" runat="server" SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Order ID" Value="0" />
                            <ej:DropDownListItem Text="Customer ID" Value="1" />
                            <ej:DropDownListItem Text="Employee ID" Value="2" />
                            <ej:DropDownListItem Text="Freight" Value="3" />
                            <ej:DropDownListItem Text="Order Date" Value="4" />
                            <ej:DropDownListItem Text="Ship City" Value="5" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Sort Direction
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="directions" runat="server" SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Ascending" Value="0" />
                            <ej:DropDownListItem Text="Descending" Value="1" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <ej:Button ID="doSorting" runat="server" Type="Button" Text="Sort" ClientSideOnClick="onClick" Width="100px"></ej:Button>
                </div>
                <div class="col-md-3">
                    <ej:Button ID="clearSorting" runat="server" Type="Button" Text="Clear" ClientSideOnClick="onClick" Width="100px"></ej:Button>
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
        function onClick(args) {
            var gridobj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            if (gridobj != undefined) {
                gridobj.clearSorting();
                if (this.element.attr('id').indexOf("doSorting")!=-1) {
                    var name = $('#<%= columnName.ClientID %>').data("ejDropDownList");
                    var direction = $('#<%= directions.ClientID %>').data("ejDropDownList");
                    var columnName = name.getValue().replace(/\s*/g, "");
                    var sortDirection = direction.getValue().toLowerCase();
                    gridobj.sortColumn(columnName, sortDirection);
                }
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-btn {
            width: 90px;
        }
    </style>
</asp:Content>


