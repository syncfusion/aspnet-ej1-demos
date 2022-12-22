<%@ Page Title="Grid-Multi Sorting-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to export the content of multiple datagrids to a single file using Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MultiSorting.aspx.cs" Inherits="WebSampleBrowser.Grid.MultiSorting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Sortings / Multi Sortings</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowSorting="true" AllowMultiSorting="True" AllowPaging="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="90" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="120" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="115" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="90" Format="{0:C}" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" Width="110" TextAlign="Right" Format="{0:MM/dd/yyyy}" />
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
                    MultiSorting
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="multisorting" name="multisorting" runat="server" Checked="True" ClientSideOnChange="MultiSorting"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Order ID
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="OrderID" name="OrderID" CssClass="ejCheckbox"  runat="server" ClientSideOnChange="MultiSorting"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Customer ID
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="CustomerID" name="CustomerID" CssClass="ejCheckbox"  runat="server" ClientSideOnChange="MultiSorting"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Employee ID
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="EmployeeID" name="EmployeeID" CssClass="ejCheckbox"  runat="server" ClientSideOnChange="MultiSorting"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Freight
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="Freight" name="Freight" CssClass="ejCheckbox" runat="server" ClientSideOnChange="MultiSorting"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Order Date
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="OrderDate" name="OrderDate" CssClass="ejCheckbox" runat="server" ClientSideOnChange="MultiSorting"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ship City
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="ShipCity" name="ShipCity" CssClass="ejCheckbox" runat="server" ClientSideOnChange="MultiSorting"></ej:CheckBox>
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
        function MultiSorting(args) {
            var gridobj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            if (gridobj != undefined) {
                
                var clkVal = this.element[0].name;
                if (clkVal.indexOf("multisorting")!=-1) {
                    if (args.isChecked) {
                        $(".ejCheckbox").find('.e-checkbox').ejCheckBox("enable");
                        gridobj.model.allowMultiSorting = true;
                    } else {
                        gridobj.model.allowMultiSorting = false;
                        $(".ejCheckbox").find('.e-checkbox').ejCheckBox({ checked: false });
                        $(".ejCheckbox").find('.e-checkbox').ejCheckBox("disable");
                        $('#<%= OrdersGrid.ClientID %>').ejGrid("clearSorting");
                    }
                } else {
                    if (args.isChecked) {
                        gridobj.multiSortRequest = gridobj.model.allowMultiSorting;
                        $('#<%= OrdersGrid.ClientID %>').ejGrid("sortColumn", this.element[0].name);
                    } else {
                        gridobj.multiSortRequest = false;
                        gridobj.model.sortSettings.sortedColumns = gridobj.model.sortSettings.sortedColumns.filter(function (index) {
                            return index.field != clkVal;
                        });
                        $('#<%= OrdersGrid.ClientID %>').ejGrid("refreshContent");
                    }
                }
            }
        }
    </script>
</asp:Content>


