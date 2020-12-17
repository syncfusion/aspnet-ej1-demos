<%@ Page Title="ListView-SQL Data-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to bind a SQL database key value mapping in the Syncfusion ASP.NET Web Forms ListView component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-SqlData.aspx.cs" Inherits="WebSampleBrowser.ListView.DataBinding_SqlData" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:ListView ID="List" runat="server" EnableCheckMark="true" DataSourceID="SqlDataSource1" DataTextField="text" Width="400" Height="530" ClientSideOnLoadComplete="Load"></ej:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM [Vehicle]"
        ConnectionString='<%$ ConnectionStrings:Linq_To_SQLConnectionString %>'
        ProviderName='<%$ ConnectionStrings:Linq_To_SQLConnectionString.ProviderName %>'></asp:SqlDataSource>
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

