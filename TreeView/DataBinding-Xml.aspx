<%@ Page Title="" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" 
CodeBehind="DataBinding-Xml.aspx.cs" Inherits="WebSampleBrowser.TreeView.DataBinding.DataBinding_Xml" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width:250px">
        <ej:TreeView ID="TreeXmlDS" runat="server" DataSourceID="XmlDataSource1"
        DataTextField="Item" DataParentIdField="RootItem">
    </ej:TreeView>
        </div>
    <div>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~\App_Data\XMLData.xml"></asp:XmlDataSource>
    </div>
</asp:Content>

