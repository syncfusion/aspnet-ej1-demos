<%@ Page Title="Rotator-Keyboard Interaction-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to access the Syncfusion ASP.NET Web Forms Rotator component functionalities using keyboard interactions." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Keyboard-Interaction.aspx.cs" Inherits="WebSampleBrowser.Rotator.keyboardnavigation" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <ej:Rotator ID="Keyboardevent" SlideWidth="100%"
            FrameSpace="0px"
            DisplayItemCount="1"
            SlideHeight="auto"
            NavigateSteps="1"
            EnableResize="true"
            PagerPosition="Outside"
            ShowThumbnail="true"
            thumbnailSourceID="slide"
            Orientation="Horizontal"
            ShowPager="false"
            Enabled="true"
            ShowCaption="false"
            AllowKeyboardNavigation="true"
            ShowPlayButton="true" IsResponsive="true"
            AnimationType="slide" runat="server">
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

        <ul id="slide" style="display: none">
            <li>
                <img src="../Content/images/rotator/nature.jpg" title="Nature" /></li>
            <li>
                <img src="../Content/images/rotator/bird.jpg" title="Beautiful Bird" /></li>
            <li>
                <img src="../Content/images/rotator/sculpture.jpg" title="Amazing Sculptures" /></li>
            <li>
                <img src="../Content/images/rotator/seaview.jpg" title="Sea-View" /></li>
            <li>
                <img src="../Content/images/rotator/snowfall.jpg" title="Snow Fall" /></li>
            <li>
                <img src="../Content/images/rotator/card.jpg" title="Credit Card" /></li>
            <li>
                <img src="../Content/images/rotator/night.jpg" title="Colorful Night" /></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
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
                    Up / Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Move to next slide
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down / Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Move to previous slide
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Space 
                </div>
                <div class="col-md-3 col-xs-4">
                    Play/Pause slide
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt+Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Move thumbnail item to left and select item
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt+left
                </div>
                <div class="col-md-3 col-xs-4">
                    Move thumbnail item to right and select item
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enter
                </div>
                <div class="col-md-3 col-xs-4">
                    Move to selected thumbnail item
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Rotator/KeyboardInteraction.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
         .frame{
              width: 350px;
        }

         #<%=Keyboardevent.ClientID%> > li img {
            width: 100%; 
			height:300px;
         }
         .e-rotator-wrap .e-thumb .e-thumb-items li img {
            width: 130px;
            height: 82px;
        }

    </style>
</asp:Content>

