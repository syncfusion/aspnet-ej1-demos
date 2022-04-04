<%@ Page Title="FileExplorer-Custom Context Menu-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"
    CodeBehind="CustomContextMenu.aspx.cs" MetaDescription="This example demonstrates about customizing the context menu in a ASP.NET Web Forms File Explorer." Inherits="WebSampleBrowser.FileExplorer.CustomContextMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    Custom Context Menu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" EnablePageMethods="true" runat="server">
    <ej:FileExplorer ID="fileexplorer" runat="server" IsResponsive="true" Width="100%" MinWidth="150px" 
        AjaxAction="CustomContextMenu.aspx/FileActionContextMenu" Path="~/FileBrowser/"
        ClientSideOnLayoutChange="onLayoutChange" ClientSideOnMenuOpen="onMenuOpen">
        <AjaxSettings>
            <Download Url="downloadFile.ashx{0}" />
            <Upload Url="uploadFiles.ashx{0}" />
        </AjaxSettings>
        <ContextMenuSettings>
            <Items Navbar="Upload,|,Delete,Rename,|,Cut,Copy,Paste,|,Getinfo"
                Cwd="Refresh,Paste,|,SortBy,View,|,NewFolder,Upload,|,Getinfo"
                Files="Open,Download,|,Delete,Rename,|,Cut,Copy,Paste,|,OpenFolderLocation,Getinfo" />
            <CustomMenuFields>
                <ej:FileExplorerCustomMenuFields Id="View" Text="View by" SpriteCssClass="custom-grid">
                    <Child>
                        <ej:FileExplorerCustomMenuFields Id="tile" Text="Tile view" Action="onLayout">
                        </ej:FileExplorerCustomMenuFields>
                        <ej:FileExplorerCustomMenuFields Id="grid" Text="Grid view" Action="onLayout">
                        </ej:FileExplorerCustomMenuFields>
                        <ej:FileExplorerCustomMenuFields Id="largeicons" Text="Large icons view" Action="onLayout">
                        </ej:FileExplorerCustomMenuFields>
                    </Child>
                </ej:FileExplorerCustomMenuFields>
            </CustomMenuFields>
        </ContextMenuSettings>
    </ej:FileExplorer>
    <h6>
        <span style="font-style: italic; margin-top: 5px; margin-left: 20%;">
            Note: A new custom ContextMenu item ("View") is added to Current Working Directory's ContextMenu
        </span>
    </h6>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function onLayout(args) {
            var feObj = $('#<%=fileexplorer.ClientID%>').data("ejFileExplorer");
            feObj && feObj.option("layout", args.ID);
        }
        function onMenuOpen(args) {
            if (args.contextMenu == "cwd") {
                $(".fe-context-menu").find(".e-fe-activeicon").removeClass("e-fe-activeicon");
                $(".fe-context-menu").find("." + this.model.layout).addClass("e-fe-activeicon");
            }
        }
        function onLayoutChange(args) {
            $(".fe-context-menu .View").removeClass("custom-grid custom-tile custom-largeicons");
            $(".fe-context-menu .View").addClass("custom-" + this.model.layout);
        }
    </script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .fe-context-menu .custom-grid:before {
            content: "\e7b9";
        }

        .fe-context-menu .custom-largeicons:before {
            content: "\e7bb";
        }

        .fe-context-menu .custom-tile:before {
            content: "\e7be";
        }
    </style>
</asp:Content>

