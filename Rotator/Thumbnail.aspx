<%@ Page Title="Rotator-Thumbnail-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to view or access any rotator slides instanly in the Syncfusion ASP.NET Web Forms Rotator component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Thumbnail.aspx.cs" Inherits="WebSampleBrowser.Rotator.thumbnail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
            <ej:Rotator ID="sliderContent" runat="server"
                SlideWidth="100%"
                FrameSpace="0px"
                DisplayItemCount="1"
                SlideHeight="300"
                NavigateSteps="1"
                EnableResize="false"
                ShowPager="true"
                Enabled="true"
                ShowCaption="true"
                AllowKeyboardNavigation="true"
                ShowPlayButton="true"
                AnimationType="slide"
                ShowThumbnail="true"
                thumbnailSourceID="thumbContent" IsResponsive="true">
                <Items>
                    <ej:RotatorItem Caption="Nature" Url="../Content/images/rotator/nature.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Caption="Beautiful Bird" Url="../Content/images/rotator/bird.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Caption="Amazing Sculptures" Url="../Content/images/rotator/sculpture.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Caption="Sea-View" Url="../Content/images/rotator/seaview.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Caption="Snow Fall" Url="../Content/images/rotator/snowfall.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Caption="Credit Card" Url="../Content/images/rotator/card.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Caption="Colorful Night" Url="../Content/images/rotator/night.jpg"></ej:RotatorItem>
                </Items>
                <ThumbItems>
                    <ej:ThumbItem Caption="Nature" Url="../Content/images/rotator/nature.jpg"></ej:ThumbItem>
                    <ej:ThumbItem Caption="Beautiful Bird" Url="../Content/images/rotator/bird.jpg"></ej:ThumbItem>
                    <ej:ThumbItem Caption="Amazing Sculptures" Url="../Content/images/rotator/sculpture.jpg"></ej:ThumbItem>
                    <ej:ThumbItem Caption="Sea-View" Url="../Content/images/rotator/seaview.jpg"></ej:ThumbItem>
                    <ej:ThumbItem Caption="Snow Fall" Url="../Content/images/rotator/snowfall.jpg"></ej:ThumbItem>
                    <ej:ThumbItem Caption="Credit Card" Url="../Content/images/rotator/card.jpg"></ej:ThumbItem>
                    <ej:ThumbItem Caption="Colorful Night" Url="../Content/images/rotator/night.jpg"></ej:ThumbItem>
                </ThumbItems>
            </ej:Rotator>
    </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width:500px;
        }
        #<%=sliderContent.ClientID%> > li img {
            width: 100%; 
			height:300px;
         }
    </style>
</asp:Content>

