<%@ Page Title="ColorPicker-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This example demonstrates a simple, mobile-friendly and responsive ASP.NET Web Forms ColorPicker to select a color" Inherits="WebSampleBrowser.ColorPicker.DefaultFunctionalities" %>

<asp:Content ID="Content7" ContentPlaceHolderID="ActionDescriptionSection" runat="server">
    <div>
        <p>
            This sample demonstrates about the Essential ASP.NET ColorPicker control provides you a rich visual interface for color selection. 
            You can select the color from the professionally designed palettes or custom color. 
            By clicking a point on the color, you can change the active color to the color that is located under the pointer. 
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame ">
        <div class="control">
            <span>Select a Color</span>
            <ej:ColorPicker runat="server" ID="colorpick" Value="#278787"></ej:ColorPicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">

    <style type="text/css">
        .frame .control {
            margin-left: 40%;
        }
    </style>
</asp:Content>

