<%@ Page Title="Slider-Show Scale-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Scale.aspx.cs" MetaDescription="This sample demonstrates to display the scale along the Syncfusion ASP.NET Web Forms Slider control." Inherits="WebSampleBrowser.Slider.Scale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadSection" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="txt">
            Default 
        </div>
        <ej:Slider ID="defaultslider" runat="server" ShowScale="true"  Value="40" SmallStep="2"></ej:Slider>
        <br />
        <br />
        <div class="txt">
            Range
        </div>
        <ej:Slider ID="rangeSlider" runat="server" SliderType="Range" ShowScale="true" ShowSmallTicks="false" MaxValue="50" Values="20,40"></ej:Slider>
        <br />
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .e-slider-wrap.e-horizontal .e-handle {
            top: -3px;
        }

        .e-slider-wrap.e-vertical .e-handle {
            left: -3px;
        }

        .frame {
            width: 50%;
        }

        .txt {
            font-size: 15px;
            margin-bottom: 40px;
        }
    </style>
</asp:Content>

