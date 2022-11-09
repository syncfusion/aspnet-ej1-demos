<%@ Page Title="Grid-Reorder-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to reorder the columns of datagrid by simple drag and drop of columns using Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="Reorder.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.Reorder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Columns / Reorder</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" AllowReordering="True" EnableHeaderHover="True">
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
                    <ej:DropDownList ID="columnName" runat="server" ClientSideOnSelect="onValueChange" SelectedItemIndex="0" 
                        Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Order ID" Value="0" />
                            <ej:DropDownListItem Text="Customer ID" Value="1" />
                            <ej:DropDownListItem Text="Employee ID" Value="2" />
                            <ej:DropDownListItem Text="Freight" Value="3" />
                            <ej:DropDownListItem Text="Order Date" Value="4" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Column Index
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="columnAlignment" runat="server" ClientSideOnSelect="onValueChange"
                        SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="1" Value="0" />
                            <ej:DropDownListItem Text="2" Value="1" />
                            <ej:DropDownListItem Text="3" Value="2" />
                            <ej:DropDownListItem Text="4" Value="3" />
                            <ej:DropDownListItem Text="5" Value="4" />
                        </Items>
                    </ej:DropDownList>
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
        var columnName = "OrderID";
        function onValueChange(args) {
            var dropObj = $("#" + args.model.targetID.split("_list")[0]).data("ejDropDownList");
            if (this._id.indexOf("columnName")!=-1) {
                $('#columnAlignment').val("");
                columnName = dropObj.selectedTextValue.replace(/\s*/g, "");
                var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
                var dropObj = $('#<%= columnAlignment.ClientID %>').ejDropDownList("instance");
                var columnIndex = gridObj.getColumnIndexByField(columnName);
                dropObj.setSelectedValue(columnIndex);
            }
            else {
                var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
                if (gridObj != undefined) {
                    var index = parseInt(dropObj.selectedTextValue) - 1;
                    var headerText = gridObj.getHeaderTable().find("div.e-headercelldiv:eq(" + index + ")").html();
                    gridObj.reorderColumns(columnName, gridObj.getFieldNameByHeaderText(headerText));
                }
            }
        }
    </script>
</asp:Content>

