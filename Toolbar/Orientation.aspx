<%@ Page Language="C#" Title="Toolbar-Orientation-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Orientation.aspx.cs" Inherits="WebSampleBrowser.Toolbar.Orientation" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Toolbar ID="edittoolsv" runat="server" Orientation="Horizontal" DataIdField="id" DataSpriteCssClassField="iconCss" DataTooltipTextField="ToolTip"
                DataSourceID="SqlDataSource1">
            </ej:Toolbar>
            <br />
            <ej:Toolbar ID="toolver" runat="server" Orientation="Vertical" DataIdField="id" DataSpriteCssClassField="iconCss" DataTooltipTextField="ToolTip"
                DataSourceID="SqlDataSource1" Width="48px" IsResponsive="True">
            </ej:Toolbar>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM [Toolbar]" ConnectionString="<%$ ConnectionStrings:Linq_To_SQLConnectionString %>" ProviderName="<%$ ConnectionStrings:Linq_To_SQLConnectionString.ProviderName %>"></asp:SqlDataSource>
        </div>
    </div>
    <style>
.material .frame{
			width: 618px;
		}
    </style>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Toolbar/orientation.css" rel="stylesheet" />
</asp:Content>

