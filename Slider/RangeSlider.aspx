<%@ Page Title="Slider-Range Slider-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="RangeSlider.aspx.cs" MetaDescription="This example demonstrates taht how to select a range of values using Syncfusion ASP.NET Web Forms Slider control." Inherits="WebSampleBrowser.Slider.RangeSlider" %>


<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div class="txt">
            Range
        </div>
        <ej:Slider ID="rangeSlider" runat="server" SliderType="Range" Values="30,60"></ej:Slider>
        <br />
        <br />
        <div class="txt">
            Min-Range
        </div>
        <ej:Slider ID="minSilder" runat="server" SliderType="MinRange" Value="60"></ej:Slider>
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
            margin-bottom: 13px;
        }
    </style>
</asp:Content>

