<%@ Page Title="ListBox-Virtual Scrolling-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to load large amounts of data on demand in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="VirtualScrolling.aspx.cs" Inherits="WebSampleBrowser.ListBox.VirtualScrolling" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select a customer</div>

            <ej:ListBox ID="selectlang" runat="server" AllowVirtualScrolling="true" ItemRequestCount="10" ClientSideOnCreate="OnCreate" DataTextField="CustomerID"></ej:ListBox>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .e-ddl-popup {
            margin: 0 auto;
        }

        .ctrllabel {
            font-weight: 600;
            padding-bottom: 12px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">Select Dropdown</div>
                <div class="col-md-3">
                    <ej:DropDownList ID="dropdwn" Width="120" SelectedItemIndex="0" ClientSideOnChange="onValueChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Normal Mode" Value="disablevirtual"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Continuous Mode" Value="enablevirtual"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        function onValueChange(args) {
            var target = $('#<%=selectlang.ClientID%>').data("ejListBox");
            //target.destroy();
            var dataManger = ej.DataManager({
                url: "//js.syncfusion.com/ejServices/wcf/NorthWind.svc/"
            });
            // Query creation
            var query = ej.Query()
                   .from("Customers");
            if (args.value == "enablevirtual") {
                $("#<%=selectlang.ClientID%>").ejListBox({
                    dataSource: dataManger,
                    fields: { text: "CustomerID" }, itemRequestCount: 10,
                    query: query, allowVirtualScrolling: true, virtualScrollMode: ej.VirtualScrollMode.Continuous

                });
            }
            if (args.value == "disablevirtual") {
                $("#<%=selectlang.ClientID%>").ejListBox({
                     dataSource: dataManger,
                     fields: { text: "CustomerID" },
                     query: query, allowVirtualScrolling: true, virtualScrollMode: ej.VirtualScrollMode.Normal
                 });
             }
         }
         function OnCreate(args) {
             var dataManger = ej.DataManager({
                 url: "//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/", crossDomain: true
             });
             $('#<%=selectlang.ClientID%>').ejListBox({
                 dataSource: dataManger
             });
             setTimeout(function () {
                 $(".listbox").css("display", "block");
             }, 300);
         }
         $(function () {
             $("#sampleProperties").ejPropertiesPanel();
         });
    </script>

</asp:Content>

