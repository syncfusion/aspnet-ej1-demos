<%@ Page Language="C#" Title="Toolbar-Default Functionalities-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.Toolbar.DefaultFunctionalities" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <div class="ctrllabel">Toolbar</div>
            <ej:Toolbar ID="editingToolbar" runat="server" Width="100%">
                <Items>
                    <ej:ToolbarItem Id="Left" SpriteCssClass="ToolbarItems LeftAlign_tool" TooltipText="Left"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Center" SpriteCssClass="ToolbarItems CenterAlign_tool" TooltipText="Center"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Right" SpriteCssClass="ToolbarItems RightAlign_tool" TooltipText="Right" IsSeparator="true"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Justify" SpriteCssClass="ToolbarItems Justify_tool" TooltipText="Justify"></ej:ToolbarItem>
                </Items>
                <Items>
                    <ej:ToolbarItem Id="Bold" SpriteCssClass="ToolbarItems Bold_tool" TooltipText="Bold"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Italic" SpriteCssClass="ToolbarItems Italic_tool" TooltipText="Italic"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="StrikeThrough" SpriteCssClass="ToolbarItems StrikeThrough_tool" TooltipText="StrikeThrough"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="UnderLine" SpriteCssClass="ToolbarItems Underline_tool" TooltipText="UnderLine"></ej:ToolbarItem>
                </Items>
            </ej:Toolbar>
        </div>
    </div>
    <style type="text/css" class="cssStyles">
	.material .frame{
		width: 497px;
	}
    </style>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Toolbar/defaultfunctionalites.css" rel="stylesheet" />
</asp:Content>

