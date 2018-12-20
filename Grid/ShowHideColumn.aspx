<%@ Page Title="Grid-Show or Hide Column-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to hide or show the columns of datagrid dynamically using Syncfusion ASP.NET Web Forms DataGrid methods." AutoEventWireup="true" CodeBehind="ShowHideColumn.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.ShowHideColumn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Columns / Show or Hide Column</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True">
            <PageSettings PageCount="7"></PageSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="90" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Width="80" Format="{0:MM/dd/yyyy}" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Column
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="columnName" runat="server" SelectedItemIndex="0" ClientSideOnChange="Onchange" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Order ID" Value="Order ID" />
                            <ej:DropDownListItem Text="Customer ID" Value="Customer ID" />
                            <ej:DropDownListItem Text="Employee ID" Value="Employee ID" />
                            <ej:DropDownListItem Text="Freight" Value="Freight" />
                            <ej:DropDownListItem Text="Order Date" Value="Order Date" />
                        </Items>
                    </ej:DropDownList>
                </div>
                <div class="col-md-3">
                    <ej:Button ID="btnHide" runat="server" Type="Button" Size="Small" Text="Hide" ClientSideOnClick="showhide">
                    </ej:Button>
                </div>
                <div class="col-md-3">
                    <ej:Button ID="btnShow" runat="server" Type="Button" Size="Small" Text="Show" ClientSideOnClick="showhide">
                    </ej:Button>
                </div>
            </div>
            <div class="row" style="margin-top: 5px">
                <div class="col-md-3">
                    Hidden Columns
                </div>
                <div class="col-md-3">
                    <textarea id="hideColumns" class="ejinputtext" style="width: 104px; height: 40px" readonly="readonly"></textarea>
                </div>
                <div class="col-md-3">
                </div>
                <div class="col-md-3">
                </div>
            </div>
        </div>
    </div>
</asp:Content>


<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#<%=btnShow.ClientID %>").ejButton({ enabled: false });
        });
        function Onchange() {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            var dropDownObj = $('#<%= columnName.ClientID %>').data("ejDropDownList");
            var selectedItem = dropDownObj.getValue();
            if ($("#hideColumns").val().indexOf(selectedItem) != -1) {
                $("#<%=btnHide.ClientID %>").ejButton({ enabled: false });
                $("#<%=btnShow.ClientID %>").ejButton({ enabled: true });
            }
            else {
                $("#<%=btnHide.ClientID %>").ejButton({ enabled: true });
                $("#<%=btnShow.ClientID %>").ejButton({ enabled: false });
            }
        }
        function showhide(args) {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            var dropDownObj = $('#<%= columnName.ClientID %>').data("ejDropDownList");
            var selectedItem = dropDownObj.getValue();
            if (this.element[0].id.indexOf("btnHide") != -1) {
                if (gridObj.getVisibleColumnNames().length > 1) {
                    gridObj.hideColumns(selectedItem);
                    $("#hideColumns").val().indexOf(selectedItem) == -1 && $("#hideColumns").val($("#hideColumns").val() + (selectedItem + "\n"));
                    $("#<%=btnHide.ClientID %>").ejButton({ enabled: false });
                    $("#<%=btnShow.ClientID %>").ejButton({ enabled: true });
                }
                else {
                    alert("Atleast one column must be displayed in grid");
                }
            }
            else {
                $("#hideColumns").val($("#hideColumns").val().replace(selectedItem + "\n", ""));
                gridObj.showColumns(selectedItem);
                $("#<%=btnHide.ClientID %>").ejButton({ enabled: true });
                $("#<%=btnShow.ClientID %>").ejButton({ enabled: false });
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-btn {
            width: 75px;
            height: 25px;
        }
    </style>
</asp:Content>

