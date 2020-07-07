<%@ Page Title="ListView-Object Data-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to bind an object database key value mapping in the Syncfusion ASP.NET Web Forms ListView component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-ObjectData.aspx.cs" Inherits="WebSampleBrowser.ListView.DataBinding_ObjectData" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:ListView ID="List" runat="server" EnableCheckMark="true" DataSourceID="ObjectDataSource1" DataTextField="Text" Width="400" Height="530" ClientSideOnLoadComplete="Load"></ej:ListView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TabData"
        SelectMethod="GetTabItems"></asp:ObjectDataSource>
     <script type="text/javascript">
        function Load() {
            setTimeout(function () {
                if (document.body.firstElementChild.className == "htmljssamplebrowser material") {
                    var obj = $("#<%=List.ClientID%>").ejListView("instance");
                    obj.option("_refreshScroller", true);
                }
            }, 500);
        }
    </script>
    <style type="text/css">
        div#LayoutSection_ControlsSection_List {
            height:100% !important;
        }
    </style>
</asp:Content>

