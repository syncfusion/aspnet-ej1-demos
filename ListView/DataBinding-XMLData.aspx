<%@ Page Title="ListView-XML Data-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to bind an XML database key value mapping in the Syncfusion ASP.NET Web Forms ListView component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-XMLData.aspx.cs" Inherits="WebSampleBrowser.ListView.DataBinding_XML" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:ListView ID="List" runat="server" EnableCheckMark="true" DataSourceID="XmlDataSource1" DataTextField="Text" Width="400" Height="550"></ej:ListView>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/XMLData.xml"></asp:XmlDataSource>
</asp:Content>

