<%@ Page Title="ListView-CheckList-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to select multiple items at a time and display the check list with the Syncfusion ASP.NET Web Forms ListView component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CheckList.aspx.cs"
    Inherits="WebSampleBrowser.ListView.CheckList" %>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:ListView ID="List" runat="server" ShowHeader="false" Height="355" Width="400" EnableCheckMark="true" AllowScrolling="true" ClientSideOnLoadComplete="Load">
        <Items>
            <ej:ListViewItems Text="Artwork"></ej:ListViewItems>
            <ej:ListViewItems Text="Abstract"></ej:ListViewItems>
            <ej:ListViewItems Text="2 Acrylic Mediums"></ej:ListViewItems>
            <ej:ListViewItems Text="Creative Acrylic"></ej:ListViewItems>
            <ej:ListViewItems Text="Modern Painting"></ej:ListViewItems>
            <ej:ListViewItems Text="Canvas Art"></ej:ListViewItems>
            <ej:ListViewItems Text="Black white"></ej:ListViewItems>
            <ej:ListViewItems Text="Children"></ej:ListViewItems>
        </Items>
    </ej:ListView>
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

