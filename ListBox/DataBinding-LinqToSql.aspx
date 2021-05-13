<%@ Page Title="ListBox-LinqToSQL Data-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to bind a LINQ to SQL database key value mapping in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DataBinding-LinqToSql.aspx.cs" Inherits="WebSampleBrowser.ListBox.DataBinding_LinqToSql" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select an item</div>
            <ej:ListBox ID="DrpDwnsql" runat="server" DataTextField="Text" DataValueField="Id" DataSourceID="LinqDataSource1" ClientSideOnCreate="OnCreated">
            </ej:ListBox>
        </div>
    </div>

    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebSampleBrowser.database.Linq_Common_DataDataContext" EntityTypeName="" TableName="Databindings"></asp:LinqDataSource>
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

