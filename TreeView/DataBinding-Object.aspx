<%@ Page Title="TreeView-Object Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" 
CodeBehind="DataBinding-Object.aspx.cs" MetaDescription="This demo explains how to bind the Object datasource as datasource to the Syncfusion ASP.NET Web Forms Treeview control." Inherits="WebSampleBrowser.TreeView.DataBinding.DataBinding_Object" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width:250px">
    <ej:TreeView ID="Treeview" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Text" DataIdField="ID"
        DataParentIdField="ParentID" DataHasChildField="HasChild" DataExpandedField="Expanded">
    </ej:TreeView>
        </div>
    <div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TreeLocalDataSource"
            SelectMethod="GetTreeDataItems"></asp:ObjectDataSource>
    </div>
</asp:Content>

