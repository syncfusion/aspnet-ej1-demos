<%@ Page Title="Rotator-API's-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to change the position, display, pager, animation, and orientation of the Syncfusion ASP.NET Web Forms Rotator component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="APIs.aspx.cs" Inherits="WebSampleBrowser.Rotator.properties" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
            <ej:Rotator ID="sliderContent" 
                NavigateSteps="3"
                FrameSpace="2px" 
                DisplayItemCount="3"
                SlideWidth="33%"
                SlideHeight="165"
                EnableResize="true"
                PagerPosition="Outside"
                ShowThumbnail="false"
                Orientation="Horizontal"
                ShowPager="true"
                EnableRTL="false"
                Enabled="true"
                ShowCaption="false"
                AllowKeyboardNavigation="true"
                ShowPlayButton="false" Animation="slide"
                runat="server" IsResponsive="true">
                <Items>
                    <ej:RotatorItem Caption="Nature" Url="../Content/images/rotator/nature.jpg"></ej:RotatorItem>
                </Items>
                <Items>
                    <ej:RotatorItem Caption="Beautiful Bird" Url="../Content/images/rotator/bird.jpg"></ej:RotatorItem>
                </Items>
                <Items>
                    <ej:RotatorItem Caption="Amazing Sculptures" Url="../Content/images/rotator/sculpture.jpg"></ej:RotatorItem>
                </Items>
                <Items>
                    <ej:RotatorItem Caption="Sea-View" Url="../Content/images/rotator/seaview.jpg"></ej:RotatorItem>
                </Items>
                <Items>
                    <ej:RotatorItem Caption="Snow Fall" Url="../Content/images/rotator/snowfall.jpg"></ej:RotatorItem>
                </Items>
                <Items>
                    <ej:RotatorItem Caption="Credit Card" Url="../Content/images/rotator/card.jpg"></ej:RotatorItem>
                </Items>
                <Items>
                    <ej:RotatorItem Caption="Colorful Night" Url="../Content/images/rotator/night.jpg"></ej:RotatorItem>
                </Items>
            </ej:Rotator>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Item Display
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="changeDisplay" SelectedItemIndex="2" Width="120px" ClientSideOnChange="onDisplayChange" TargetID="change" runat="server"></ej:DropDownList>
                    <div id="change">
                        <ul>
                            <li>1</li>
                            <li>2</li>
                            <li>3</li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-xs-4">
                    Item Move
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="itemMove" SelectedItemIndex="2" ClientSideOnChange="onMoveChange" Width="120px" runat="server"></ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    PagerPosition
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="changePager" SelectedItemIndex="4" Width="120px" ClientSideOnChange="onPagerChange" TargetID="changePagerlist" runat="server"></ej:DropDownList>
                    <div id="changePagerlist">
                        <ul>
                            <li>TopLeft</li>
                            <li>TopRight</li>
                            <li>BottomLeft</li>
                            <li>BottomRight</li>
                            <li>Outside</li>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Animation
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="changeAnimation" SelectedItemIndex="0" Width="120px" ClientSideOnChange="onAnimationChange" TargetID="changeAnimationlist" runat="server"></ej:DropDownList>
                    <div id="changeAnimationlist">
                        <ul>
                            <li>Slide</li>
                            <li>SlowSlide</li>
                            <li>FastSlide</li>
                            <li>SlideShow</li>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Orientation
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="changeOrientation" SelectedItemIndex="0" Width="120px" ClientSideOnChange="onOrientationChange" TargetID="changeOrientationlist" runat="server"></ej:DropDownList>
                    <div id="changeOrientationlist">
                        <ul>
                            <li>Horizontal</li>
                            <li>Vertical</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Show/Hide Pager
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:CheckBox runat="server" ID="chkPager" CssClass="e-checkbox" Checked="true" ClientSideOnChange="onPager"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enable/Disable
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:CheckBox runat="server" ID="chkEnable" CssClass="e-checkbox" Checked="true" ClientSideOnChange="EnableDisable"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Action
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="previous" Type="Button" Text="Previous" CssClass="e-btn" ClientSideOnClick="previous" runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="next" Type="Button" Text="Next" CssClass="e-btn" ClientSideOnClick="next" runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Current Index
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button Type="Button" ID="getValue" Text="Get Index" CssClass="e-btn" ClientSideOnClick="getValue" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Rotator/Properties.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/Rotator/API.css")%>" rel="stylesheet" />
</asp:Content>

