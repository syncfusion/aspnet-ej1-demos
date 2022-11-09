<%@ Page Title="Toolbar-XML Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-XML.aspx.cs" Inherits="WebSampleBrowser.Toolbar.DataBinding_XML" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Toolbar ID="Toolbar" runat="server" DataIdField="id" DataSpriteCssClassField="Sprite" DataTooltipTextField="Tooltip" DataMember="RootItem" DataSourceID="XmlDataSource1"></ej:Toolbar>
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/XMLTool.xml"></asp:XmlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Toolbar/BasicTool.css" rel="stylesheet" />
</asp:Content>

