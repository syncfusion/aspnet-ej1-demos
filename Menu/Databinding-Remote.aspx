<%@ Page Language="C#" Title="Menu-Remote Data-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Databinding-Remote.aspx.cs" MetaDescription="This example demonstrates how to bind a remote data as database in the Syncfusion ASP.NET Web Forms Menu control." Inherits="WebSampleBrowser.Menu.Databinding_Remote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 300px;">
    <ul id="shipDetails"></ul>
        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            // DataManager creation
            var dataManger = ej.DataManager({
                url: "//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/", crossDomain: true
            });
            var query = null, query1 = null;
            var query = ej.Query().from("Categories").select("CategoryID,CategoryName").take(3);

            $("#shipDetails").ejMenu({
                fields: {
                    dataSource: dataManger, query: query, id: "CategoryID", text: "CategoryName",
                    child: { dataSource: dataManger, tableName: "Products", id: "ProductID", parentId: "CategoryID", text: "ProductName" }
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="StyleSection" runat="server">

    <style type="text/css">
        .e-menu-res-wrap {
            height: 32px;
            overflow: hidden;
        }
		.office-365 .controlframe{
            width: 315px !important;
        }
    </style>
</asp:Content>

