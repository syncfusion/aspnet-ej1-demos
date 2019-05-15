<%@ Page Title="Toolbar-Object Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-ObjectData.aspx.cs" Inherits="WebSampleBrowser.Toolbar.DataBinding_ObjectData" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Toolbar ID="ToolbarList" runat="server"
                DataSourceID="ObjectDataSource1" 
                DataTooltipTextField="Tooltip" DataIdField="ID" DataSpriteCssClassField="Css">
            </ej:Toolbar>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetToolItems" TypeName="ToolData"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Toolbar/ObjectTool.css" rel="stylesheet" />
</asp:Content>

