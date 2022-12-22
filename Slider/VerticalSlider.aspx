<%@ Page Title="Slider-Vertical Slider-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="VerticalSlider.aspx.cs" MetaDescription="This example demonstrates how to initialize the Syncfusion ASP.NET Web Forms Slider control in vertical orientation." Inherits="WebSampleBrowser.Slider.VerticalSlider" %>


<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">


    <div class="frame">
        <div class="control">
            <ej:Slider ID="normalSlider" runat="server" Height="200px" Orientation="Vertical" 
                       SliderType="Default" Value="30"></ej:Slider>
            <span>Default</span>
        </div>
        <div class="control">
            <ej:Slider ID="minSilder" runat="server" Height="200px" SliderType="MinRange" 
                       Orientation="Vertical" Value="70"></ej:Slider>
            <span>Min-Range</span>
        </div>
        <div class="control">
            <ej:Slider ID="rangeSlider" runat="server" Height="200px" SliderType="Range" 
                       Orientation="Vertical" Values="30,70"></ej:Slider>
            <span>Range</span>
        </div>
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
            height: 250px;
            width: 290px;
            padding: 40px;
        }

            .frame .e-slider-wrap {
                margin: 15px 35px;
            }

        .control {
            float: left;
        }

            .control span {
                color: #676767;
                display: block;
                font-size: 11px;
                text-align: center;
            }
    </style>
</asp:Content>

