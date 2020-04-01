<%@ Page Language="C#" Title="Menu-Vertical Menu-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="VerticalMenu.aspx.cs" MetaDescription="This example demonstrates how to initialize a menu in vertical orientation using Syncfusion ASP.NET Web Forms Menu control." Inherits="WebSampleBrowser.Menu.VerticalMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 150px;">
    <ej:Menu ID="vertical" Orientation="Vertical" MenuType="NormalMenu" runat="server">
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
                    <ej:MenuItem Text=""></ej:MenuItem>
                </Items>
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

<asp:Content ID="Content4" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-menu-res-wrap {
            height: 32px;
            overflow: hidden;
        }
    </style>
</asp:Content>

