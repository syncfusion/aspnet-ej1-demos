<%@ Page Title="Grid-Basic-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to customize the selection mode and toggle selection of Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="BasicSelection.aspx.cs" Inherits="WebSampleBrowser.Grid.BasicSelection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <link href="../Content/ejthemes/responsive-css/ejgrid.responsive.css" rel="stylesheet" />
    <span class="sampleName">Grid / Selection / Basic Selection</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" AllowSelection="True" Selectiontype="Multiple" EnableRowHover = "False" Isresponsive="true">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="90" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="100" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="110" Priority="2" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="90" Format="{0:C}" Priority="1" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" Width="100" TextAlign="Right" Format="{0:MM/dd/yyyy}" Priority="3" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="100" Priority="4" />
            </Columns>
            <SelectionSettings EnableToggle="true" />
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Selection Type
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="selection" runat="server" ClientSideOnChange="OnSelectionTypeChange"
                        SelectedItemIndex="1" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Single" Value="0" />
                            <ej:DropDownListItem Text="Multiple" Value="1" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Selection Mode
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="selectionMode" runat="server" ClientSideOnChange="OnSelectionModeChange"
                        SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Row" Value="row" />
                            <ej:DropDownListItem Text="Cell" Value="cell" />
                            <ej:DropDownListItem Text="Column" Value="column" />
                        </Items>
                    </ej:DropDownList>
                </div>
                <div class="row">
                    <div class="col-md-3">
                       Enable Toggle
                    </div>
                    <div class="col-md-3">
                        <ej:CheckBox ID="enableToggle" runat="server" ClientSideOnChange="onClick" Checked="True"></ej:CheckBox>
                    </div>
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
        function OnSelectionTypeChange(args) {
            var gridobj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            var dropObj = $('#<%= selection.ClientID %>').data("ejDropDownList");
            if (gridobj != undefined) {
                var selectType = dropObj.selectedTextValue.toLowerCase();
                var $grid = $('#<%= OrdersGrid.ClientID %>');
                clearAllSelection($grid);
                $grid.ejGrid({ selectionType: selectType });
            }
        }
        function OnSelectionModeChange(args) {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            var dropObj = $('#<%= selectionMode.ClientID %>').data("ejDropDownList");
            if (gridObj != undefined) {
                var mode = dropObj.selectedTextValue.toLowerCase();
                var $grid = $('#<%= OrdersGrid.ClientID %>');
                clearAllSelection($grid);
                $grid.ejGrid({ selectionSettings: { selectionMode: [mode] } });
            }
        }
        function onClick(args) {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            if (gridObj != undefined) {
                var $grid = $('#<%= OrdersGrid.ClientID %>');
                clearAllSelection($grid);
                $grid.ejGrid({ selectionSettings: { enableToggle: args.isChecked } });
            }
        }
        function clearAllSelection(gridObj) {
            gridObj.ejGrid("clearSelection");
            gridObj.ejGrid("clearCellSelection");
            gridObj.ejGrid("clearColumnSelection");
        }
    </script>
</asp:Content>

