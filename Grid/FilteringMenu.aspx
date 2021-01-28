<%@ Page Title="Grid-Filtering Menu-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to filter the content using menu and excel filter types of Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="FilteringMenu.aspx.cs" Inherits="WebSampleBrowser.Grid.FilteringMenu" %>

<asp:Content ID="contentHead" ContentPlaceHolderID="HeadSection" runat="server">
    <style type="text/css">
        ::-ms-clear {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Filtering /Filtering Menu</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="position:relative">
        <ej:Grid ID="OrdersGrid" runat="server" AllowFiltering="True" AllowPaging="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="90" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="120" />                
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="130" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="90" Format="{0:C2}" />              
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="100" />
                <ej:Column Field="Verified" HeaderText="Verified" Width="100" />
            </Columns>
            <FilterSettings FilterType="Excel"></FilterSettings>
        </ej:Grid>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Filter Menu Type
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="filterType" runat="server" ClientSideOnChange="selectChange"
                        SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Excel" Value="0" />
                            <ej:DropDownListItem Text="Menu" Value="1" />
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
         function selectChange(args) {
             var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
             if (args.itemId == 0)
                 $('#<%= OrdersGrid.ClientID %>').ejGrid("option", { filterSettings: { filterType: "excel" } });
             else
                 $('#<%= OrdersGrid.ClientID %>').ejGrid("option", { filterSettings: { filterType: "menu"} });
         }
     </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
		.e-grid .e-excelfilter .e-btncontainer input{
			padding: .2em .4em .3em;
		}
	</style>
</asp:Content>


