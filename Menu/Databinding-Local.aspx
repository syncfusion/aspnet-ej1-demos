<%@ Page Language="C#" Title="Menu / Data Binding / Local Data" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Databinding-Local.aspx.cs" MetaDescription="This example demonstrates how to bind a local data as database in the Syncfusion ASP.NET Web Forms Menu control." Inherits="WebSampleBrowser.Menu.Databinding_Local" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 455px;">
        <ej:Menu ID="sitemenu" DataIdField="id" DataParentIdField="parentId" DataTextField="text" DataSpriteCssField="sprite" runat="server"></ej:Menu>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Menu/LocalDatabinding.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .e-menu-res-wrap {
            height: 32px;
            overflow: hidden;
        }
    </style>
</asp:Content>
