<%@ Page Title="TreeView-XML Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" 
CodeBehind="DataBinding-Xml.aspx.cs" MetaDescription="This demo explains how to process and bind the XML type data to the Syncfusion ASP.NET Web Forms TreeView control." Inherits="WebSampleBrowser.TreeView.DataBinding.DataBinding_Xml" %>

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


