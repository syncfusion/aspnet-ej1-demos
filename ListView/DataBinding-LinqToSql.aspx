<%@ Page Title="ListView-LinqToSQL Data-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to bind a LINQ to SQL database key value mapping in the Syncfusion ASP.NET Web Forms ListView component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-LinqToSql.aspx.cs" Inherits="WebSampleBrowser.ListView.DataBinding_LinqToSql" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">

    <ej:ListView ID="List" runat="server" EnableCheckMark="true" DataSourceID="LinqDataSource1" DataTextField="Text" Height="820" Width="400" ClientSideOnLoadComplete="Load"></ej:ListView>

    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebSampleBrowser.database.Linq_Common_DataDataContext" EntityTypeName="" TableName="Databindings"></asp:LinqDataSource>
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

