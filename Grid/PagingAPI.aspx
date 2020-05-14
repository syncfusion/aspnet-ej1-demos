<%@ Page Title="Grid-Paging API-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to customize a pager using the APIs that are relevant to paging of Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PagingAPI.aspx.cs" Inherits="WebSampleBrowser.Grid.PagingAPI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Paging /Paging API</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True">
			<ClientSideEvents ActionBegin="beginHandler" />
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
                    Allow Paging
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="allowCheck" runat="server" ClientSideOnChange="onClick" Checked="True"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Page Size
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="pagesize" ClientIDMode="Static" runat="server" Value="12" MinValue="1" MaxValue="20"
                        ClientSideOnChange="sizeValChange" Width="100px" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Page Count
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="pagecount" ClientIDMode="Static" runat="server" Value="4" MinValue="1" MaxValue="4"
                        ClientSideOnChange="countValChange" Width="100px" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Current Page
                </div>
                <div class="col-md-3">
                      <ej:NumericTextBox ID="currentpage" ClientIDMode="Static" runat="server" Value="1" MinValue="1" MaxValue="4" ClientSideOnChange="pageValChange"
                        Width="100px" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
	var flag = flag1 = false;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
		function beginHandler(args) {
            if (args.requestType == "paging") {
                var val = $("#pagecount").ejNumericTextbox().val();
                var model = $('#<%= OrdersGrid.ClientID %>').ejGrid("getPager").ejPager("model");
                if (val != model.pageCount && val != "")
                    model.pageCount = val;
                if (flag1 == false) {
                    flag = true;
                    $("#currentpage").ejNumericTextbox({ value: args.currentPage });
                }
				else
					flag1 = false;
            }
        }
        function onClick(args) {
            var model = $('#<%= OrdersGrid.ClientID %>').ejGrid("model");
            model.pageSettings.currentPage = 1;
			$("#currentpage").ejNumericTextbox("model.value", model.pageSettings.currentPage);            
            $('#<%= OrdersGrid.ClientID %>').ejGrid({ allowPaging: args.isChecked });
            if (!args.isChecked)
                $("#currentpage, #pagecount, #pagesize").ejNumericTextbox("disable");
            else
                $("#currentpage, #pagecount, #pagesize").ejNumericTextbox("enable");
        }
        function sizeValChange(args) {
            if (checkNumericValue(args.value))
                return;
            var model = $('#<%= OrdersGrid.ClientID %>').ejGrid("model");
            var model1 = $('#<%= OrdersGrid.ClientID %>').ejGrid("getPager").ejPager("model");
            var newLastPage = Math.ceil(model.pageSettings.totalRecordsCount / args.value);
            if (model1.currentPage > newLastPage)
                $('#<%= OrdersGrid.ClientID %>').ejGrid("getPager").ejPager("goToPage", newLastPage);
            $('#<%= OrdersGrid.ClientID %>').ejGrid({ "pageSettings": { pageSize: parseInt(args.value) } });
            setPageValue(model1.totalPages);
        }
        function pageValChange(args) {
			if (flag == false) {
                flag1 = true;
            var checkObj = $('#<%= allowCheck.ClientID %>').data("ejCheckBox");
            var ischecked = checkObj.option("checked");
            if (checkNumericValue(args.value))
                return;
            var model = $('#<%= OrdersGrid.ClientID %>').ejGrid("getPager").ejPager("model");
            if (ischecked && (parseInt(args.value) <= model.totalPages))
                $('#<%= OrdersGrid.ClientID %>').ejGrid("getPager").ejPager("goToPage", args.value);
				}
            else
                flag = false;
        }
        function countValChange(args) {
            var checkObj = $('#<%= allowCheck.ClientID %>').data("ejCheckBox");
            var ischecked = checkObj.option("checked");
            if (checkNumericValue(args.value))
                return;
            var model = $('#<%= OrdersGrid.ClientID %>').ejGrid("model");
            var pagermodel = $('#<%= OrdersGrid.ClientID %>').ejGrid("getPager").ejPager("model");
            if (ischecked && Math.ceil(model.pageSettings.totalRecordsCount / model.pageSettings.pageSize) >= parseInt(args.value))
                $('#<%= OrdersGrid.ClientID %>').ejGrid({ "pageSettings": { pageCount: parseInt(args.value) } });
            setPageValue(pagermodel.totalPages);
        }
        function setPageValue(val) {
            $("#currentpage").ejNumericTextbox("model").maxValue = val;
            $("#pagecount").ejNumericTextbox("model").maxValue = val;
        }
        function checkNumericValue(value) {
            return (value == "" || value == 0);
        }
    </script>
</asp:Content>

