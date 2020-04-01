<%@ Page Title="TreeView-Multi-Select-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" CodeBehind="MultiSelection.aspx.cs" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This sample demonstrates multiple nodes selection in ASP.NET Web Forms TreeView." Inherits="WebSampleBrowser.TreeView.MultiSelection" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width: 250px">
        <ej:TreeView ID="Treeview" runat="server" DataSourceID="ObjectData" DataTextField="Text"
            DataIdField="ID" DataParentIdField="ParentID" DataHasChildField="HasChild"
            DataExpandedField="Expanded" DataSelectedField="Selected" EnableAnimation="false"
            AllowMultiSelection="true" AllowDragAndDrop="true">
        </ej:TreeView>
    </div>
    <asp:ObjectDataSource ID="ObjectData" runat="server" TypeName="MultiSelectDataSource"
        SelectMethod="GetTreeViewItems"></asp:ObjectDataSource>
</asp:Content>

