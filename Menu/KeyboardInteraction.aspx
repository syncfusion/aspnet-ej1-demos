<%@ Page Language="C#" Title="Menu-Keyboard Interactions-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="KeyboardInteraction.aspx.cs" MetaDescription="This example demonstrates how the menu control supports the keyboard navigation(keyboard shortcuts) in a ASP.NET Web Forms" Inherits="WebSampleBrowser.Menu.KeyboardInteraction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 384px;">
    <ej:Menu ID="keyboard" MenuType="NormalMenu" runat="server">
        <Items>
            <ej:MenuItem Text="Books">
                <Items>
                    <ej:MenuItem Text="New Releases"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="New Releases audio book"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Bestsellers"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Upcoming"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Box Sets"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="Gaming">
                <Items>
                    <ej:MenuItem Text="Upcoming"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="PC"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="PS Vista"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="PS3"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="XBox"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Consoles"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="Mobiles">
                <Items>
                    <ej:MenuItem Text="New Arrivals"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Bestsellers"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Low Price"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Tablets"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="Cameras">
                <Items>
                    <ej:MenuItem Text="Point & Shoots"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Digital SLR"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Camcorders"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Bestsellers"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="Musics">
                <Items>
                    <ej:MenuItem Text="New Releases"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Bestsellers"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Rock Music"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Devotional & Spiritual"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Sufi & Ghazal"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
    </ej:Menu>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid keyboard">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + j
                </div>
                <div class="col-md-3 col-xs-4">
                    Focuses the control
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates up or previous item
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates down or next item
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates to previous group
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates to next group
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Esc
                </div>
                <div class="col-md-3 col-xs-4">
                    Closes the menu group
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enter
                </div>
                <div class="col-md-3 col-xs-4">
                    Selects the focused item
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Menu/KeyboardInteraction.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-menu-res-wrap {
            height: 32px;
            overflow: hidden;
        }
		
        .office-365 .controlframe{
            width: 404px !important;
        }
</style>
</asp:Content>

