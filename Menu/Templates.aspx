<%@ Page Language="C#" Title="Menu-Templates-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Templates.aspx.cs" MetaDescription="This demo shows templates using Syncfusion ASP.NET Web menu control" Inherits="WebSampleBrowser.Menu.Templates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 229px;">
    <ej:Menu ID="MenuSample" runat="server" OpenOnClick="false" Enabled="true" ShowRooltLevelArrows="true" ShowSubLevelArrows="true" EnableCenterAlign="false" MenuType="NormalMenu" Orientation="Horizontal">
        <Items>
            <ej:MenuItem Text="Books">
                <Items>
                    <ej:MenuItem Text="Child1" SpriteCssClass="flag-dz">
                        <Template>
                            <div class="temp temp1">
                                <span>BOOKS</span>
                                <ul>
                                    <li><a>New Releases</a></li>
                                    <li><a>Bestsellers</a></li>
                                    <li><a>Upcoming</a></li>
                                    <li><a>Box Sets</a></li>
                                </ul>
                                <ul>
                                    <li><a>HTML Basics</a></li>
                                    <li><a>JavaScript</a></li>
                                    <li><a>JQuery</a></li>
                                    <li><a>PHP Basics</a></li>
                                </ul>
                            </div>
                        </Template>
                    </ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Text="Cameras">
                <Items>
                    <ej:MenuItem Text="Child1" SpriteCssClass="flag-dz">
                        <Template>

                            <div class=" temp temp2">
                                <div>
                                    <span>CAMERAS</span>
                                    <ul>
                                        <li><a>Point & Shoots</a></li>
                                        <li><a>Digital SLR</a></li>
                                        <li><a>Camcorders</a></li>
                                        <li><a>Bestsellers</a></li>
                                    </ul>
                                    <ul>
                                        <li><a>Still Camera</a></li>
                                        <li><a>Digital Camera</a></li>
                                        <li><a>Video Camera</a></li>
                                        <li><a>Virtual Camera</a></li>
                                    </ul>
                                </div>
                            </div>

                        </Template>
                    </ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Text="Movies">
                <Items>
                    <ej:MenuItem Text="Child1" SpriteCssClass="flag-dz">
                        <Template>

                            <div class="temp temp3">
                                <div>
                                    <span>MOVIES</span>
                                    <ul>
                                        <li><a>Genobili Actions</a></li>
                                        <li><a>Jackie Rocks</a></li>
                                        <li><a>Men In Blue</a></li>
                                        <li><a>Human vs Alien</a></li>
                                    </ul>
                                    <ul>
                                        <li><a>Million Dreams</a></li>
                                        <li><a>Kung-fu</a></li>
                                    </ul>
                                </div>
                            </div>

                        </Template>
                    </ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
    </ej:Menu>
        </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/Menu/Template.css")%>" rel="stylesheet" />
	<style type="text/css">
        .office-365 .controlframe{
            width: 240px !important;
        }
    </style>
</asp:Content>

