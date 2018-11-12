<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="Icons.aspx.cs" Inherits="WebSampleBrowser.TreeView.Icons" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width:250px">
    <ej:TreeView ID="Treeview" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Text" DataIdField="ID"
                 DataParentIdField="ParentID" DataHasChildField="HasChild" DataExpandedField="Expanded" 
                 DataSpriteCssField="SpriteCssClass" Width="400px">
    </ej:TreeView>
</div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TreeIconsDataSource"
        SelectMethod="GetTreeIconItems"></asp:ObjectDataSource>

</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/TreeView/Icons.css" rel="stylesheet" />
</asp:Content>
