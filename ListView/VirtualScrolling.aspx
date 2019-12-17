<%@ Page Title="ListView-Virtual Scrolling-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to load a large amount of data on demand in the Syncfusion ASP.NET Web Forms ListView component." Language="C#" MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true" CodeBehind="VirtualScrolling.aspx.cs" Inherits="WebSampleBrowser.ListView.VirtualScrolling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="control listview">
        <div class="frame">
            <div class="ctrllabel">Select a customer</div>

            <ej:ListView ID="List1" runat="server" Height="250" Width="250" DataTextField="CustomerID" AllowVirtualScrolling="true" VirtualScrollMode="Normal" ItemRequestCount="8" TotalItemsCount="10"></ej:ListView> 
           
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .e-ddl-popup {
            margin: 0 auto;
        }

        .ctrllabel {
            font-weight: 600;
            padding-bottom: 12px;
        }
        .frame{
            padding-right:98px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">Select Mode</div>
                <div class="col-md-3">
                    <ej:DropDownList ID="dropdwn" Width="120" SelectedItemIndex="0" ClientSideOnChange="onValueChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Normal Mode" Value="Normal"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Continuous Mode" Value="Continuous"></ej:DropDownListItem>
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
            var target = $('#<%=List1.ClientID%>').data("ejListView");
            //target.destroy();
            var dataManger = ej.DataManager({
                url: "//js.syncfusion.com/ejServices/wcf/NorthWind.svc/"
            });
            // Query creation
            var query = ej.Query()
                   .from("Customers");
            if (args.value == "Continuous") {
                $("#<%=List1.ClientID%>").ejListView({
                    height:200,
                    dataSource: dataManger,
                    fieldSettings: { text: "CustomerID" }, itemRequestCount: 8,
                    query: query, allowVirtualScrolling: true, virtualScrollMode: ej.VirtualScrollMode.Continuous

                });
            }
            if (args.value == "Normal") {
                     $("#<%=List1.ClientID%>").ejListView({
                     height: 200,
                     dataSource: dataManger,
                     fieldSettings: { text: "CustomerID" }, itemRequestCount: 8,
                     query: query, allowVirtualScrolling: true, virtualScrollMode: ej.VirtualScrollMode.Normal
                 });
             }
         }
         $(function () {
             $("#sampleProperties").ejPropertiesPanel();
         });
    </script>

</asp:Content>

