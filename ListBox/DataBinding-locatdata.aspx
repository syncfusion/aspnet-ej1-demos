<%@ Page Title="ListBox-Local Data-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to bind the local data source key value mapping in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DataBinding-locatdata.aspx.cs" Inherits="WebSampleBrowser.ListBox.DataBinding_locatdata" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select a transport</div>
            <ej:ListBox ID="Auto" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Text" DataValueField="ID" ItemsCount="8" ClientSideOnCreate="OnCreated"></ej:ListBox>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TabData" SelectMethod="GetTabItems"></asp:ObjectDataSource>
        </div>
    </div>
    <script type="text/javascript">
function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=Auto.ClientID%>").ejListBox("instance");
                    obj._refreshScroller();
                }, 800);
            }
    setTimeout(function () {
        $(".listbox").css("display", "block");
    }, 300);
        }
</script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-ddl-popup {
            margin: 0 auto;
        }

        .ctrllabel {
            font-weight: 600;
            padding-bottom: 12px;
        }
    </style>
</asp:Content>

