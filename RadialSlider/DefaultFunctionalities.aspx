<%@ Page Title="RadialSlider-Default Functionalities-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to select a value or range of values in a circular interface using the Syncfusion ASP.NET Web Forms Radial slider component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.RadialSlider.DefaultFunctionalities" %>


<asp:Content ID="Content7" ContentPlaceHolderID="ActionDescriptionSection" runat="server">
    <div>
        <p>
            This sample demonstrates about the Essential ASP.NET The RadialSlider control that provides an optimized interface for selecting a numeric value using touch interface.
            This allows the user to select a value or range of values in a circular motion.
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox">
        <div class="frame">
            <ej:RadialSlider ID="slider" runat="server" InnerCircleImageUrl="../Content/images/radialslider/chevron-right.png"></ej:RadialSlider>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .row [class*="cols-"] {
            overflow-x: auto;
        }
    </style>
</asp:Content>

