<%@ Page Title="Grid-Virtual Scrolling-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to load data on-demand basis without buffering huge database initially in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="VirtualPaging.aspx.cs" Inherits="WebSampleBrowser.Grid.VirtualPaging" %>

<asp:Content ID="StyleContent" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .e-gridcontent .e-table {
            width: 100% !important;
        }
        .e-gridheader .e-table {
            width: 100% !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Paging /Virtual Paging</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowScrolling="True" AllowSorting="True" >
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="80" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="250" />
            </Columns>
            <ScrollSettings Height="300" Width="auto" VirtualScrollMode="Normal" EnableVirtualization="true"></ScrollSettings>
        </ej:Grid>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Virtual Scroll Mode
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="scrollMode" runat="server" ClientSideOnChange="selectChange"
                        SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Normal" Value="0" />
                            <ej:DropDownListItem Text="Continuous" Value="1" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
         </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        window.onresize = function () {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
             if (gridObj.getContent().data("ejScroller"))
                 gridObj.getContent().ejScroller("refresh");
         };
         $(function () {
             $("#sampleProperties").ejPropertiesPanel();
         });
         function selectChange(args) {
             var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
             if (args.itemId == 0)
                 $('#<%= OrdersGrid.ClientID %>').ejGrid("option", { scrollSettings: { "enableVirtualization": true, virtualScrollMode: "normal" } });
            else
                $('#<%= OrdersGrid.ClientID %>').ejGrid("option", { scrollSettings: { "enableVirtualization": false, "allowVirtualScrolling": true, virtualScrollMode: "continuous" } });
        }
    </script>
</asp:Content>


