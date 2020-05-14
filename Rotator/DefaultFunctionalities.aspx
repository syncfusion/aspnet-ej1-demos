<%@ Page Title="Rotator-Default Functionalities-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to create a Syncfusion ASP.NET Web Forms Rotator component where each slide contains images." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.Rotator.Default" %>

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
                IsResponsive="true"
                AnimationType="slide">
                <Items>
                    <ej:RotatorItem Caption="Nature" Url="../Content/images/rotator/nature.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Caption="Beautiful Bird" Url="../Content/images/rotator/bird.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Caption="Amazing Sculptures" Url="../Content/images/rotator/sculpture.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Caption="Sea-View" Url="../Content/images/rotator/seaview.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Caption="Snow Fall" Url="../Content/images/rotator/snowfall.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Caption="Credit Card" Url="../Content/images/rotator/card.jpg"></ej:RotatorItem>
                    <ej:RotatorItem Caption="Colorful Night" Url="../Content/images/rotator/night.jpg"></ej:RotatorItem>
                </Items>
            </ej:Rotator>
    </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
             height:300px;
             width:500px;
        }
           #<%=sliderContent.ClientID%> > li img {
            width: 100%; 
			height:300px;
         }
    </style>
</asp:Content>

