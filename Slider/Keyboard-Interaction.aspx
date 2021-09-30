<%@ Page Title="Slider-Keyboard Interaction-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Keyboard-Interaction.aspx.cs" MetaDescription="This example demonstrates how the slider control supports the keyboard navigation(keyboard shortcuts) in a ASP.NET Web Forms." Inherits="WebSampleBrowser.Slider.Keyboard_Interaction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadSection" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <ej:Slider ID="minSlider" runat="server" SliderType="MinRange" Value="20"></ej:Slider>
        <br />
        <br />
        <ej:Slider ID="rangeSlider" runat="server" SliderType="Range" Values="40,80"></ej:Slider>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
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
                    Increments the slider value
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down / Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Decrements the slider value
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Home
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves to the start value
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    End
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves to the end value
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Esc
                </div>
                <div class="col-md-3 col-xs-4">
                    Focuses out from the handle
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Tab
                </div>
                <div class="col-md-3 col-xs-4">
                    Focus to next control
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            //Control focus key
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) { // j- key code.
                    $("#<%=minSlider.ClientID%> a")[0].focus();
                }
            });
            $("#sampleProperties").ejPropertiesPanel();
        });
    </script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
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
    </style>
</asp:Content>

