<%@ Page Title="FileExplorer-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" 
CodeBehind="API.aspx.cs" MetaDescription="This example demonstrates the various methods like enable and disable in a ASP.NET Web Forms File Explorer." Inherits="WebSampleBrowser.FileExplorer.API" %>


<asp:Content ID="Content4" ContentPlaceHolderID="SampleHeading" runat="server">
    ClientSide API
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:FileExplorer ID="fileexplorer" Width="100%" runat="server" IsResponsive="true" MinWidth="150px" Layout="Tile" 
                     AjaxAction="API.aspx/FileActionDefault" Path="~/FileBrowser/">
        <AjaxSettings>
            <Download Url="downloadFile.ashx{0}" />
            <Upload Url="uploadFiles.ashx{0}" />
        </AjaxSettings>
    </ej:FileExplorer>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Toolbar
       
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton ID="check1" runat="server" Width="105px" Size="Normal" ContentType="TextOnly" 
                                     DefaultText="Hide" ActiveText="Show" ClientSideOnClick="Toolbar"></ej:ToggleButton>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Status Bar
       
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton ID="check2" runat="server" Width="105px" Size="Normal" ContentType="TextOnly" 
                                     DefaultText="Hide" ActiveText="Show" ClientSideOnClick="Statusbar"></ej:ToggleButton>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Treeview
       
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton ID="check3" runat="server" Width="105px" Size="Normal" ContentType="TextOnly" 
                                     DefaultText="Hide" ActiveText="Show" ClientSideOnClick="Treeview"></ej:ToggleButton>

                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    ContextMenu
       
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton ID="check5" runat="server" Width="105px" Size="Normal" ContentType="TextOnly" 
                                     DefaultText="Disable" ActiveText="Enable" ClientSideOnClick="ContextMenu"></ej:ToggleButton>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Destroy/Restore
       
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton ID="check6" runat="server" Width="105px" Size="Normal" ContentType="TextOnly" 
                                     DefaultText="Destroy" ActiveText="Restore" ClientSideOnClick="onDestoryRestore"></ej:ToggleButton>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Diable/Enable AddFolder
       
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton ID="check7" runat="server" Width="105px" Size="Normal" ContentType="TextOnly" 
                                     DefaultText="Disable" ActiveText="Enable" ClientSideOnClick="onDisableEnable"></ej:ToggleButton>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Get Current Path
       
                </div>
                <div class="col-md-3">
                    <ej:Button ID="getPath" runat="server" Type="Button" Width="105px" Text="Get Path" 
                               ClientSideOnClick="getCurrentPath"></ej:Button>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Show/Hide Checkbox
       
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton ID="check8" runat="server" Width="105px" Size="Normal" ContentType="TextOnly" 
                                     DefaultText="Hide" ActiveText="Show" ClientSideOnClick="Checkbox"></ej:ToggleButton>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var rte;
        $(function () {
            feObj = $("#<%=fileexplorer.ClientID%>").data("ejFileExplorer");
            $("#sampleProperties").ejPropertiesPanel();
        });
    </script>
    <script type="text/javascript" src="../Scripts/FileExplorer/APIJs.js"></script>
</asp:Content>

