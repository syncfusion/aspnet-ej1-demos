<%@ Page Language="C#" Title="Toolbar-RTL-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="RTL.aspx.cs" Inherits="WebSampleBrowser.Toolbar.RTL" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Toolbar ID="edittools" runat="server" Orientation="Horizontal" EnableRTL="true" DataIdField="id" DataSpriteCssClassField="iconCss" DataTooltipTextField="ToolTip"
                DataSourceID="SqlDataSource1" Width="100%">
            </ej:Toolbar>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM [Toolbar]" ConnectionString="<%$ ConnectionStrings:Linq_To_SQLConnectionString %>" ProviderName="<%$ ConnectionStrings:Linq_To_SQLConnectionString.ProviderName %>"></asp:SqlDataSource>
        </div>
    </div>
    <style>
.material .frame{
			width: 684px;
		}
    </style>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Toolbar/rtl.css" rel="stylesheet" />
</asp:Content>

