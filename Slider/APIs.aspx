<%@ Page Title="Slider-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" 
CodeBehind="APIs.aspx.cs" MetaDescription="This example demonstrates the various methods like getValue, enable and disable in a ASP.NET Web Forms Slider control." Inherits="WebSampleBrowser.Slider.APIs" %>



<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <ej:Slider ID="rangeSlider" runat="server" SliderType="Range" Values="20,70"></ej:Slider>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-6">Enable / Disable</div>
                <div class="col-md-6">
                    <ej:ToggleButton Type="Button" ID="Toggle" runat="server" DefaultText="Disable" ActiveText="Enable" 
                                     ClientSideOnClick="changeState" Width="105px"></ej:ToggleButton>
                </div>
                <div class="col-md-6">Get the Slider value</div>
                <div class="col-md-6">
                    <ej:Button ID="Button" Type="Button" runat="server" Text="GetValue" Width="105px" ClientSideOnClick="getValue"></ej:Button>
                </div>
            </div>

        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target;
        $(function () {
            // declaration
            target = $("#<%=rangeSlider.ClientID%>").data("ejSlider");
            $("#sampleProperties").ejPropertiesPanel();
        });

        function changeState(args) {
            if (args.isChecked) target.disable();
            else target.enable();
        }
        function getValue() {
            alert(target.getValue());
        }

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
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

