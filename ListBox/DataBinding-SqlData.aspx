<%@ Page Title="ListBox-SQL Data-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to bind a SQL database key value mapping in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-SqlData.aspx.cs" Inherits="WebSampleBrowser.ListBox.DataBinding_SqlData" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">
                Select a transport
            </div>
            <ej:ListBox ID="DrpDwnsql" runat="server"
                DataTextField="text" DataValueField="id"
                DataSourceID="SqlDataSource1" ClientSideOnCreate="OnCreated">
            </ej:ListBox>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM [Vehicle]"
        ConnectionString='<%$ ConnectionStrings:Linq_To_SQLConnectionString %>'
        ProviderName='<%$ ConnectionStrings:Linq_To_SQLConnectionString.ProviderName %>'></asp:SqlDataSource>
    <script type="text/javascript">
function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=DrpDwnsql.ClientID%>").ejListBox("instance");
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

