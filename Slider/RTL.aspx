<%@ Page Title="Slider-RTL-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="RTL.aspx.cs" MetaDescription="This example demonstrates how to enable the rtl property in a ASP.NET Web Forms Slider control." Inherits="WebSampleBrowser.Slider.RTL" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadSection" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div class="txt">
            Min-Range
        </div>
        <ej:Slider ID="minSilder" runat="server" SliderType="MinRange" EnableRTL="True" 
                   Value="60"></ej:Slider>
        <br />
        <br />
        <div class="txt">
            Range
        </div>
        <ej:Slider ID="rangeSlider" runat="server" SliderType="Range" EnableRTL="True" 
                   Values="30,70"></ej:Slider>
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
            direction: rtl;
            font-size: 15px;
            margin-bottom: 13px;
            text-align: right;
        }
    </style>
</asp:Content>

