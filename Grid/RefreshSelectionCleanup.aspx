<%@ Page Title="Grid-Refresh Selection Cleanup-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to select and clear multiple rows using methods of Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RefreshSelectionCleanup.aspx.cs" Inherits="WebSampleBrowser.Grid.RefreshSelectionCleanup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Selection / Refresh Selection Cleanup</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" AllowSelection="True" Selectiontype="Multiple">
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
                    <b>Select Row</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Start
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="fromIndex" runat="server" Value="0" MinValue="0" MaxValue="11" Width="70px" />
                </div>
                <div class="col-md-3">
                    To
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="toIndex" runat="server" Value="0" MinValue="0" MaxValue="11" Width="70px" />
                </div>
            </div>
        <div class="row">
            <div class="col-md-3">
                <ej:Button ID="SelectRow" runat="server" ClientSideOnClick="selectRow" Type="Button" Text="Select Row" Size="Medium" Width="100px">
                </ej:Button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3" style="margin-top: 10px">
                <b>Clear Selection</b>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                Row Index
            </div>
            <div class="col-md-3">
                <ej:NumericTextBox ID="clearRowIndex" runat="server" Value="0" MinValue="0" MaxValue="11" Width="70px" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <ej:Button ID="clearSelectionByIndex" ClientSideOnClick="clearSelection" runat="server" Type="Button" Size="Medium" Text="Clear Selection">
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
            var $grid = $('#<%= OrdersGrid.ClientID %>')
            $grid.ejGrid({ selectionType: "multiple" });
        });
        function selectRow() {
            var fromIndex = $('#<%= fromIndex.ClientID %>').ejNumericTextbox('option', 'value');
            var toIndex = $('#<%= toIndex.ClientID %>').ejNumericTextbox('option', 'value');
            var gridObj = $('#<%= OrdersGrid.ClientID %>').ejGrid("instance");
            gridObj.selectRows(parseInt(fromIndex), parseInt(toIndex));
        }
        function clearSelection() {
            var rowIndex = $('#<%= clearRowIndex.ClientID %>').ejNumericTextbox('option', 'value');
            var gridObj = $('#<%= OrdersGrid.ClientID %>').ejGrid("instance");
            gridObj.clearSelection(parseInt(rowIndex));
        }
    </script>
</asp:Content>

