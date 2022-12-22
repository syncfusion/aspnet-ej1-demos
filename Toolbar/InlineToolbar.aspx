<%@ Page Language="C#" Title="Toolbar-Inline Toolbar-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="InlineToolbar.aspx.cs" Inherits="WebSampleBrowser.Toolbar.InlineToolbar" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame" style="width:300px">
        <div class="control">
            
               <ej:Toolbar ID="Inlinetoolbar" runat="server" EnableSeparator="true" IsResponsive="true" ResponsiveType="Inline" width="320px">
                <Items>
                    <ej:ToolbarItem Id="Cut" SpriteCssClass="e-icon e-cut_01" TooltipText="Cut"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Copy" SpriteCssClass="e-icon e-copy_02" TooltipText="Copy"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Paste" SpriteCssClass="e-icon e-paste_01" TooltipText="Paste"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Edit" SpriteCssClass="e-icon e-edit" TooltipText="Edit"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Save" SpriteCssClass="e-icon e-save" TooltipText="Save" IsSeparator="true"></ej:ToolbarItem>
               </Items>
               <Items>
                    <ej:ToolbarItem Id="Bold" SpriteCssClass="e-icon e-bold_01" TooltipText="Bold"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Underline" SpriteCssClass="e-icon e-underline_01" TooltipText="Underline"></ej:ToolbarItem>
                   <ej:ToolbarItem Id="Strikethrough" SpriteCssClass="e-icon e-strikethrough_01" TooltipText="Strikethrough" IsSeparator="true"></ej:ToolbarItem>
                </Items>
                 <Items>
                    <ej:ToolbarItem Id="left" SpriteCssClass="e-icon e-align-left_01" TooltipText="Align left"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="center" SpriteCssClass="e-icon e-align-center_01" TooltipText="Align center"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="right" SpriteCssClass="e-icon  e-align-right_01" TooltipText="Align right"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="justify" SpriteCssClass="e-icon e-align-justify_01" TooltipText="Align justify" IsSeparator="true"></ej:ToolbarItem>
               </Items>
                <Items>
                    <ej:ToolbarItem Id="Reload" SpriteCssClass="e-icon e-reload" TooltipText="Reload"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Delete" SpriteCssClass="e-icon  e-delete" TooltipText="Delete"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Print" SpriteCssClass="e-icon  e-print_02" TooltipText="Print"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Export" SpriteCssClass="e-icon e-excel-export " TooltipText="Export"></ej:ToolbarItem>
               </Items>
            </ej:Toolbar>
        </div>
    </div>
    <style type="text/css">
	.material .frame{
		width: 497px;
	}
    .e-toolbar>.e-horizontal.e-ul>li
	{
	   margin-top:4px;
	}
    
    </style>
</asp:Content>

