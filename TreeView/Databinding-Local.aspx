<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Databinding-Local.aspx.cs" 
MasterPageFile="~/Samplebrowser.Master" MetaDescription="This demo explains how to bind the local data as a datasource to the Syncfusion ASP.NET Web Forms Treeview control." Inherits="WebSampleBrowser.TreeView.Databind_Local" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width:250px">
    <ej:TreeView ID="Treeview" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Text" DataIdField="ID"
        DataParentIdField="ParentID" DataHasChildField="HasChild" DataExpandedField="Expanded">
    </ej:TreeView>
</div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TreeLocalDataSource"
        SelectMethod="GetTreeDataItems"></asp:ObjectDataSource>

</asp:Content>
