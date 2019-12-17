<%@ Page Title="TreeView-SQL Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" 
CodeBehind="DataBinding-SqlData.aspx.cs" Inherits="WebSampleBrowser.TreeView.DataBinding.DataBinding_SqlData" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
   <div style="width:250px">
    <ej:TreeView ID="TreeSQLDS" runat="server" DataSourceID="SqlDataSource1" DataTextField="Text" DataIdField="Id"
        DataParentIdField="ParentId" DataHasChildField="HasChild" DataExpandedField="Expanded">
    </ej:TreeView>
       </div>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Linq_To_SQLConnectionString  %>" 
                           ProviderName="<%$ ConnectionStrings:Linq_To_SQLConnectionString.ProviderName %>"
                           SelectCommand="SELECT * FROM [Databinding]"></asp:SqlDataSource>
    </div>
</asp:Content>

