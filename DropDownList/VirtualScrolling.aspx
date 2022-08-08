<%@ Page Title="DropDownList-Virtual Scrolling-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="VirtualScrolling.aspx.cs" MetaDescription="This example demonstrates how to achieve the virtual scrolling(loads dropdown items dynamically) in ASP.NET Web Forms DropDownList control." Inherits="WebSampleBrowser.DropDownList.VirtualScrolling" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="CompanyNames" runat="server" DataTextField="CompanyName" DataValueField="ContactName" ItemsCount="10" AllowVirtualScrolling="true" VirtualScrollMode="Normal" Width="100%" WatermarkText="Select a company name">
                <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/Customers" CrossDomain="true"  />
            </ej:DropDownList>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .frame{
            width: 250px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">VirtualScroll Mode</div>
                <div class="col-md-3">
                    <ej:DropDownList ID="dropdwn" Width="120" SelectedItemIndex="0" ClientSideOnChange="onValueChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Normal" Value="1"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Continuous" Value="2"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
           
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onValueChange(args) {

            var dataManager = ej.DataManager({ url: "//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/Customers", crossDomain: true });

            var controlProperty =
			{
			    dataSource: dataManager,
			    fields: { text: "CompanyName", value: 'ContactName' },
			    width: 260,
			    itemsCount: 10,
			    allowVirtualScrolling: true
			};

            var target = $('#<%=CompanyNames.ClientID%>').data("ejDropDownList");
            target.destroy();

            controlProperty.virtualScrollMode = args.itemId == 1 ? "continuous" : "normal";

            $('#<%=CompanyNames.ClientID%>').ejDropDownList(controlProperty);

         }
    </script>
</asp:Content>


