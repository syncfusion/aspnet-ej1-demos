<%@ Page Title="TreeView-Full Row Select-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" CodeBehind="FullRowSelection.aspx.cs" 
    MasterPageFile="~/Samplebrowser.Master" MetaDescription="This example demonstrates the full row selection that highlight entire nodes in a row in ASP.NET Web Forms TreeView." Inherits="WebSampleBrowser.TreeView.FullRowSelection" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width: 250px">
        <ej:TreeView ID="fullrowtree" runat="server" DataSourceID="ObjectData" DataTextField="Text"
            DataIdField="ID" DataParentIdField="ParentID" DataHasChildField="HasChild"
            DataExpandedField="Expanded" DataSelectedField="Selected" FullRowSelect="true" >
        </ej:TreeView>
    </div>
    <asp:ObjectDataSource ID="ObjectData" runat="server" TypeName="FullRowSelectDataSource"
        SelectMethod="GetFullRowItems"></asp:ObjectDataSource>
</asp:Content>

