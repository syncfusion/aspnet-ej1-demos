<%@ Page Title="Grid-Cell Alignment-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to align the content inside the cells of datagrid columns and headers in Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="CellAlignment.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.CellAlignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <link href="../Content/ejthemes/responsive-css/ejgrid.responsive.css" rel="stylesheet" />
    <span class="sampleName">Grid / Columns / Cell Alignment</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowTextWrap="true" AllowPaging="True" IsResponsive="true">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="90" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" Priority="2"/>
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" Priority="3"/>
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Width="80" Format="{0:MM/dd/yyyy}" Priority="3"/>
		        <ej:Column Field="ShipAddress" HeaderText="Ship Address" TextAlign="Justify" Width="80" Priority="4"/>
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
                    <ej:DropDownList ID="columnName" runat="server" ClientSideOnSelect="onAlignmentChange"
                        SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Order ID" Value="0" />
                            <ej:DropDownListItem Text="Customer ID" Value="1" />
                            <ej:DropDownListItem Text="Employee ID" Value="2" />
                            <ej:DropDownListItem Text="Freight" Value="3" />
                            <ej:DropDownListItem Text="Order Date" Value="4" />
                            <ej:DropDownListItem Text="Ship Address" Value="5" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Cell Alignment
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="columnAlignment" runat="server" ClientSideOnSelect="onAlignmentChange" SelectedItemIndex="0"
                        Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Right" Value="0" />
                            <ej:DropDownListItem Text="Left" Value="1" />
                            <ej:DropDownListItem Text="Center" Value="2" />
                            <ej:DropDownListItem Text="Justify" Value="3" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript" class="jsScript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        var columnName = 0;
        function onAlignmentChange(args) {
            if (this._id.indexOf("columnName")!=-1) {
                columnName = args.itemId;               
                var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
                var dropObj = $('#<%= columnAlignment.ClientID %>').ejDropDownList("instance");
                var textAlign = gridObj.model.columns[columnName].textAlign;
                if (textAlign != null)
                    dropObj.setSelectedText(textAlign.charAt(0).toUpperCase() + textAlign.substring(1));
                else
                    dropObj.setSelectedText("Left");
            }
            else {
                var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
                var dropObj = $('#<%= columnAlignment.ClientID %>').data("ejDropDownList");
                if (gridObj != undefined) {
                    gridObj.model.columns[columnName].textAlign = dropObj.selectedTextValue;
                    gridObj.refreshContent(true);
                }
            }
        }
    </script>
</asp:Content>

