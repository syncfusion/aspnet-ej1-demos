<%@ Page Title="TreeView-Load On Demand-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="LoadOnDemand.aspx.cs" MetaDescription="This example shows how the ASP.NET Web TreeView loads the nodes on demand." Inherits="WebSampleBrowser.TreeView.LoadOnDemand" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width:250px">
        <ej:TreeView ID="Treeview" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Text" DataIdField="ID"
        DataParentIdField="ParentID" DataHasChildField="HasChild" LoadOnDemand="true">
    </ej:TreeView>
</div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TreeOnDemandDataSource"
        SelectMethod="GetTreeItems"></asp:ObjectDataSource>

</asp:Content>


