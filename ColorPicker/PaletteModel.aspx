<%@ Page Title="ColorPicker-Color Palette-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="PaletteModel.aspx.cs" MetaDescription="This example demonstrates how to specify the palette and picker model type in a ASP.NET Web Forms ColorPicker" Inherits="WebSampleBrowser.ColorPicker.PaletteModel" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame ">
        <div class="control">
            <ej:ColorPicker runat="server" ID="colorpick" Value="#278787" ModelType="Palette"></ej:ColorPicker>
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

