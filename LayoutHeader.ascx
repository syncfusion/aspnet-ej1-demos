<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LayoutHeader.ascx.cs" Inherits="WebSampleBrowser.LayoutHeader" %>
<div class="header">
    <div class="sbheader" style="visibility: visible">
        <div class="title">
            <a href="../default.aspx" class="anchorclass site-title">
                <div title="Essential Studio for ASP.NET HTML5" style="visibility:hidden" class="jslogo"></div>
            </a>
        </div>
        
        <div class="themewrap"></div>
        <div class="themeswitch" style="float: right;">
             <div class="ejthemestudio" style="float:left">
                <ej:Button ContentType="TextAndImage" ID="mobileSamples" Type="Button" PrefixIcon="e-icon mobile-logo " Size="Normal" CssClass="themestudio" ClientIDMode="Static" runat="server" ShowRoundedCorner="true" ClientSideOnClick="ionicSwitch" Text="MOBILE SAMPLES" Width="165" Height="30" />
            </div>
            <div class="ejthemestudio" style="float:left">
                <ej:Button ContentType="TextAndImage" ID="themestudio" Type="Button" PrefixIcon="e-icon themestudio-logo" Size="Normal" CssClass="themestudio" ClientIDMode="Static" runat="server" ShowRoundedCorner="true" ClientSideOnClick="paintTheme" Text="THEME STUDIO" Width="165" Height="30" />
            </div>
            <div class="wrapper-demo">
                    <ej:Button ContentType="ImageOnly" ID="buybutton" Type="Button" PrefixIcon="e-icon e-uiLight e-icon-handup" Size="Normal" CssClass="float-right ejbutton downbutton metroblue" ClientIDMode="Static" runat="server" Width="66px" Height="55px" ClientSideOnClick="downloadlink"  />
            </div>
            <div class="themegallery">
                <ej:Dialog ID="sbtooltipbox" runat="server" CssClass="metroblue" Height="86" Width="176" EnableResize="false" ShowOnInit="false" ShowHeader="false" ClientIDMode="Static" AllowKeyboardNavigation="false">
                    <DialogContent>
                        <div class="sbtooltip"></div>
                    </DialogContent>
                </ej:Dialog>                
                <ej:Menu ID="themeButton" DataImageUrlField="imageURL" DataIdField="id" IsResponsive="false" DataParentIdField="parentId" DataSpriteCssField="sprite" DataTextField="text" runat="server" Width="62px" OpenOnClick="true" TitleText=" " CssClass="e-custom-theme" ClientSideOnClick="themebtnClick">                   
                </ej:Menu>
               
            </div>
        </div>
    </div>
</div>

