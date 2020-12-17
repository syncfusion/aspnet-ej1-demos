<%@ Page Title="FileExplorer-Keyboard Interaction-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="KeyboardNavigation.aspx.cs" MetaDescription="This example demonstrates how the File Explorer supports the keyboard navigation(keyboard shortcuts) in ASP.NET Web Forms" Inherits="WebSampleBrowser.FileExplorer.Keyboard_Navigation" %>

<asp:Content ID="Content4" ContentPlaceHolderID="SampleHeading" runat="server">
    Keyboard Navigation
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:FileExplorer ID="dss" runat="server" Layout="LargeIcons" Width="100%" MinWidth="150px" IsResponsive="true" 
                     AjaxAction="KeyboardNavigation.aspx/FileActionDefault" Path="~/FileBrowser/">
        <AjaxSettings>
            <Download Url="downloadFile.ashx{0}" />
            <Upload Url="uploadFiles.ashx{0}" />
        </AjaxSettings>
    </ej:FileExplorer>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid keyboard">
            <div class="row">
                <div class="col-md-3">
                    Alt + j
                </div>
                <div class="col-md-3">
                    Focuses the control
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ctrl + Shift + 1
                </div>
                <div class="col-md-3">
                    Focuses the Toolbar
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ctrl + Shift + 2
                </div>
                <div class="col-md-3">
                    Focuses the Treeview
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ctrl + Shift + 3
                </div>
                <div class="col-md-3">
                    Focuses the Splitter
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ctrl + Shift + 4
                </div>
                <div class="col-md-3">
                    Focuses the Grid view
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ctrl + Shift + 5
                </div>
                <div class="col-md-3">
                    Focuses the Tile view
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ctrl + Shift + 6
                </div>
                <div class="col-md-3">
                    Focuses the LargeIcons view
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ctrl + Shift + 7
                </div>
                <div class="col-md-3">
                    Focuses the Statusbar
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Right
                </div>
                <div class="col-md-3">
                    Focusing next item
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Left
                </div>
                <div class="col-md-3">
                    Focusing previous item
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Enter
                </div>
                <div class="col-md-3">
                    Selection the focused item
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Esc
                </div>
                <div class="col-md-3">
                    Closes the opened dialog
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    F2
                </div>
                <div class="col-md-3">
                    Renames the selected item
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ctrl + A
                </div>
                <div class="col-md-3">
                    Selects the all items
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Alt + N
                </div>
                <div class="col-md-3">
                    Opens Create Folder dialog
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ctrl + U
                </div>
                <div class="col-md-3">
                    Opens Upload dialog
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    F5
                </div>
                <div class="col-md-3">
                    Refresh the content
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Alt + Enter
                </div>
                <div class="col-md-3">
                    Get the details of selected item
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ctrl + X
                </div>
                <div class="col-md-3">
                    To cut the selected items
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ctrl + C
                </div>
                <div class="col-md-3">
                    To copy the selected items
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Ctrl + V
                </div>
                <div class="col-md-3">
                    Pastes the copied items
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Delete
                </div>
                <div class="col-md-3">
                    Deletes the selected items
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Shift + F10
                </div>
                <div class="col-md-3">
                    Opens the ContextMenu
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) { // j- key code.
                    $("#<%=dss.ClientID%>").focus();
                }
            });

            $("#sampleProperties").ejPropertiesPanel();
        });
    </script>
</asp:Content>


