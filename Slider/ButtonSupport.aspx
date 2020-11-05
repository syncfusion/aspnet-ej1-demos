<%@ Page Title="Slider-Button Support-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="ButtonSupport.aspx.cs" MetaDescription="This example demonstrates how to enable the buttons with ASP.NET WebForms slider control to increment or decrements the values." Inherits="WebSampleBrowser.Slider.ButtonSupport" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div class="rangetxt">
            Range
        </div>
        <ej:Slider ID="rangeBtn" runat="server" SliderType="Range" Values="30,60" ShowButtons="true"></ej:Slider>
        <br />
        <br />
        <div class="minrangetxt">
            Min-Range
        </div>
        <ej:Slider ID="minBtn" runat="server" SliderType="MinRange" Value="40" ShowButtons="true"  ShowScale="true" LargeStep="20" SmallStep="5" IncrementStep="5"></ej:Slider>
        <br />
        <br />

    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
     <style type="text/css">
        .frame {
            width: 50%;
        }

        .minrangetxt {
            font-size: 15px;
            margin-bottom: 30px;
        }

        .rangetxt {
            font-size: 15px;
            margin-bottom: 20px;
        }

    </style>
</asp:Content>

