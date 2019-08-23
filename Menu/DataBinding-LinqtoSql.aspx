<%@ Page Language="C#" Title="Menu-Linq-to-Sql Data-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DataBinding-LinqtoSql.aspx.cs" Inherits="WebSampleBrowser.Menu.DataBinding_LinqtoSql" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 454px;">
    <ej:Menu ID="TreeSQL" DataTextField="Text" DataSourceID="linq" DataIdField="Id"
        DataParentIdField="ParentId" runat="server">
    </ej:Menu>
        </div>
    <asp:LinqDataSource ID="linq" runat="server" ContextTypeName="WebSampleBrowser.database.Linq_Common_DataDataContext" EntityTypeName="" TableName="Databindings"></asp:LinqDataSource>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">

    <style type="text/css">
        .office-365 .controlframe{
            width: 478px !important;
        }
    </style>
</asp:Content>

