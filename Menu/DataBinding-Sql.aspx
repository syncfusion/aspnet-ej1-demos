<%@ Page Language="C#" Title="Menu-Sql Data-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DataBinding-Sql.aspx.cs" MetaDescription="This example demonstrates how to bind a SQL data as database in the Syncfusion ASP.NET Web Forms Menu control." Inherits="WebSampleBrowser.Menu.DataBinding_Sql" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 454px;">
    <ej:Menu ID="TreeSQL" DataTextField="Text" DataSourceID="SqlDataSource1" DataIdField="Id"
        DataParentIdField="ParentId" runat="server">
    </ej:Menu>
        </div>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Linq_To_SQLConnectionString %>"
            SelectCommand="SELECT * FROM [Databinding]"></asp:SqlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">

    <style type="text/css">
        .office-365 .controlframe{
            width: 480px !important;
        }
    </style>
</asp:Content>

