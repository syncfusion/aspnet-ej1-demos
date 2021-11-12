<%@ Page Language="C#" Title="Menu-API's-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="APIs.aspx.cs" MetaDescription="This example demonstrates the various methods like disableItem, enableItem, and disableAll/enableAll in a ASP.NET Web Forms Menu control." Inherits="WebSampleBrowser.Menu.APIs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width:535px">
    <ej:Menu ID="JobSearch" runat="server">
        <Items>
            <ej:MenuItem Id="Home" Text="Home"></ej:MenuItem>
            <ej:MenuItem Text="Search Jobs">
                <Items>
                    <ej:MenuItem Text="Advanced Search"></ej:MenuItem>
                    <ej:MenuItem Text="Jobs by Company"></ej:MenuItem>
                    <ej:MenuItem Text="Jobs by Category"></ej:MenuItem>
                    <ej:MenuItem Text="Jobs by Location"></ej:MenuItem>
                    <ej:MenuItem Text="Jobs by Skills"></ej:MenuItem>
                    <ej:MenuItem Text="Jobs by Designation"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="PostResume" Text="Post Resume"></ej:MenuItem>
            <ej:MenuItem Id="JobSeeker" Text="JobSeeker Login"></ej:MenuItem>
            <ej:MenuItem Id="FastForward" Text="Fast Forward">
                <Items>
                    <ej:MenuItem Text="Resume writing"></ej:MenuItem>
                    <ej:MenuItem Text="Certification"></ej:MenuItem>
                    <ej:MenuItem Text="Resume Spotlight"></ej:MenuItem>
                    <ej:MenuItem Text="Jobs4u"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="More" Text="More">
                <Items>
                    <ej:MenuItem Text="Mobile"></ej:MenuItem>
                    <ej:MenuItem Text="Pay check"></ej:MenuItem>
                    <ej:MenuItem Text="Blog"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
    </ej:Menu>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Disable Item
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="Disable" ClientSideOnChange="onDisable" Width="120px" TargetID="Events" runat="server" WatermarkText="Select"></ej:DropDownList>
                    <div id="Events">
                        <ul>
                            <li>Home</li>
                            <li>Search Jobs</li>
                            <li>Post Resume</li>
                            <li>JobSeeker Login</li>
                            <li>Fast Forward</li>
                            <li>More</li>
                        </ul>
                    </div>

                </div>
                <div class="col-md-3 col-xs-4">
                    Enable Item
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="Enable" ClientSideOnChange="onEnable" Width="120px" TargetID="Enableapi" runat="server" WatermarkText="Select"></ej:DropDownList>
                    <div id="Enableapi">
                        <ul>
                            <li>Home</li>
                            <li>Search Jobs</li>
                            <li>Post Resume</li>
                            <li>JobSeeker Login</li>
                            <li>Fast Forward</li>
                            <li>More</li>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Disable All\Enable All
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="btnchkunchk" ClientSideOnChange="onCheckUncheckAll" DefaultText="Disable" Width="120px" ActiveText="Enable" runat="server"></ej:ToggleButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Menu/API.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="StyleSection" runat="server">
      <link href="../Content/ejthemes/responsive-css/ej.responsive.css" rel="stylesheet" />
    <style type="text/css">
        .e-menu-res-wrap {
            height: 32px;
            overflow: hidden;
        }
		.office-365 .controlframe{
            width: 610px !important;
        }
    </style>
</asp:Content>

