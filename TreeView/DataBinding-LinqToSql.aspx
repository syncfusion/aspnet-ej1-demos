<%@ Page Title="TreeView-LinqToSQL-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" 
CodeBehind="DataBinding-LinqToSql.aspx.cs" MetaDescription="This example demonstrates how to bind a LINQ to SQL database key value mapping in the Syncfusion ASP.NET Web Forms Treeview control." Inherits="WebSampleBrowser.TreeView.DataBinding_Linq_To_SqlData" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width:250px">
    <ej:TreeView ID="TreeLinqToSql" runat="server" DataSourceID="LinqDataSource1" DataTextField="Text" DataIdField="Id"
        DataParentIdField="ParentId" DataHasChildField="HasChild" DataExpandedField="Expanded">
    </ej:TreeView>
        </div>
    <div>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="WebSampleBrowser.database.Linq_Common_DataDataContext" EntityTypeName="" TableName="Databindings">
        </asp:LinqDataSource>
    </div>
</asp:Content>


