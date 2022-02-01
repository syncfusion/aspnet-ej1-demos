<%@ Page Title="Slider-Server-Side Events-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" 
CodeBehind="Events.aspx.cs" MetaDescription="This sample demonstrates the server side onChange event in a ASP.NET Web Forms Slider control." Inherits="WebSampleBrowser.Slider.Events" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <ej:Slider ID="sliderEvents" runat="server" SliderType="MinRange" Value="30" 
                   OnChangeEvent="sliderEvents_ChangeEvent"></ej:Slider>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="EventSection" runat="server">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog" runat="server">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" Type="Button" OnClick="Clear_Click" Text="Clear" CssClass="eventclear e-btn" 
                               runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
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

