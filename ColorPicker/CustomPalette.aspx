<%@ Page Title="ColorPicker-Custom Palette-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="CustomPalette.aspx.cs" MetaDescription="This example demonstrates how to specify the custom palatte in a ASP.NET Web Forms ColorPicker" Inherits="WebSampleBrowser.ColorPicker.CustomPalette" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame ">
        <div class="control">
            <ej:ColorPicker runat="server" ID="custom" Value="#278787" Palette="CustomPalette" ModelType="Palette" Custom="ffffff,ffccff,ff99ff,ff66ff,ff33ff,ff00ff,ccffff,ccccff,cc99ff,cc66ff,cc33ff,cc00ff,99ffff,99ccff,9999ff,9966ff,9933ff,9900ff,ffffcc,ffcccc"></ej:ColorPicker>
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

