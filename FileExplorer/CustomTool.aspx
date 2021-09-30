<%@ Page Title="FileExplorer-Custom Tool-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" 
CodeBehind="CustomTool.aspx.cs"  MetaDescription="This example demonstrates about customizing the toolbar in a ASP.NET Web Forms File Explorer." Inherits="WebSampleBrowser.FileExplorer.CustomTool" %>

<asp:Content ID="Content4" ContentPlaceHolderID="SampleHeading" runat="server">
    Custom Tool
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:FileExplorer ID="customTool" runat="server" Width="100%" IsResponsive="true" MinWidth="150px" Layout="LargeIcons" 
                     AjaxAction="CustomTool.aspx/FileActionDefault" Path="~/FileBrowser/">
        <AjaxSettings>
            <Download Url="downloadFile.ashx{0}" />
            <Upload Url="uploadFiles.ashx{0}" />
        </AjaxSettings>
        <Tools>
            <CustomTool>
                <ej:FileExplorerCustomTool Name="Help" Tooltip="Help" Action="dialogOpen" Css="e-fileExplorer-toolbar-icon Help" />
            </CustomTool>
        </Tools>
    </ej:FileExplorer>
    <ej:Dialog ID="helpDialog" Title="FileExplorer Help" ShowOnInit="false" EnableModal="true" Width="350" EnableResize="false" 
               CssClass="e-fe-dialog" runat="server">
        <DialogContent>
            <div class="text-content">
                <div class="header-content">Need assistance?</div>
                <div class="header-content">Our help document assists you to know more about FileExplorer control.</div>
                <div class="header-content">Please refer -> <a href="//help.syncfusion.com/aspnet/fileexplorer/overview" 
                target="_blank">Help Document</a></div>
            </div>
        </DialogContent>
    </ej:Dialog>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function dialogOpen() {
            $('#<%=helpDialog.ClientID%>').ejDialog('open')
        }
    </script>
</asp:Content>

<asp:Content ID="content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-fileExplorer-toolbar-icon {
            height: 22px;
            width: 22px;
            font-family: 'ej-webfont';
            font-size: 18px;
            margin-top: 2px;
            text-align: center;
        }

            .e-fileExplorer-toolbar-icon.Help:before {
                content: "\e72b";
            }

        .e-dialog .header-content:not(:last-child) {
            margin-bottom: .5em;
        }

        .e-dialog > .e-titlebar {
            padding: .25em .25em .25em 1em;
        }

        .e-dialog.e-dialog-wrap {
            border: none;
        }

        .e-dialog .e-dialog-icon {
            right: 0;
        }
    </style>
</asp:Content>

