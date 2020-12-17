<%@ Page Title="ColorPicker-Presets-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Presets.aspx.cs" MetaDescription="This example demonstrates how to specify the presets in a ASP.NET Web Forms ColorPicker" Inherits="WebSampleBrowser.ColorPicker.Presets" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <div class="presets-col">
                <span>Basic</span>
                <ej:ColorPicker ID="basicPreset" runat="server" TagName="div" DisplayInline="true" ModelType="Palette" PresetType="Basic" Value="#9494c8"></ej:ColorPicker>
            </div>
            <div class="presets-col">
                <span>Mono Chrome</span>
                <ej:ColorPicker ID="monoChromePreset" runat="server" TagName="div" DisplayInline="true" ModelType="Palette" PresetType="MonoChrome" Value="#8e8e8e"></ej:ColorPicker>
            </div>
            <div class="presets-col">
                <span>Flat Colors</span>
                <ej:ColorPicker ID="flatColorsPreset" runat="server" TagName="div" DisplayInline="true" ModelType="Palette" PresetType="FlatColors" Value="#f79853"></ej:ColorPicker>
            </div>
            <div class="presets-col">
                <span>Sea Wolf</span>
                <ej:ColorPicker ID="seaWolfPreset" runat="server" TagName="div" DisplayInline="true" ModelType="Palette" PresetType="SeaWolf" Value="#13647F"></ej:ColorPicker>
            </div>
            <div class="presets-col">
                <span>Web Colors</span>
                <ej:ColorPicker ID="webColorsPreset" runat="server" TagName="div" DisplayInline="true" ModelType="Palette" PresetType="WebColors" Value="#E7C36F"></ej:ColorPicker>
            </div>
            <div class="presets-col">
                <span>Sandy</span>
                <ej:ColorPicker ID="sandyPreset" runat="server" TagName="div" DisplayInline="true" ModelType="Palette" PresetType="Sandy" Value="#EFECCA"></ej:ColorPicker>
            </div>
            <div class="presets-col">
                <span>Pink Shades</span>
                <ej:ColorPicker ID="pinkShadesPreset" runat="server" TagName="div" DisplayInline="true" ModelType="Palette" PresetType="PinkShades" Value="#996072"></ej:ColorPicker>
            </div>
            <div class="presets-col">
                <span>Misty</span>
                <ej:ColorPicker ID="mistyPreset" runat="server" TagName="div" DisplayInline="true" ModelType="Palette" PresetType="Misty" Value="#0A0D0C"></ej:ColorPicker>
            </div>
            <div class="presets-col">
                <span>Citrus</span>
                <ej:ColorPicker ID="citrusPreset" runat="server" TagName="div" DisplayInline="true" ModelType="Palette" PresetType="Citrus" Value="#F29727"></ej:ColorPicker>
            </div>
            <div class="presets-col">
                <span>Vintage</span>
                <ej:ColorPicker ID="vintagePreset" runat="server" TagName="div" DisplayInline="true" ModelType="Palette" PresetType="Vintage" Value="#557359"></ej:ColorPicker>
            </div>
            <div class="presets-col">
                <span>Moon Light</span>
                <ej:ColorPicker ID="moonLightPreset" runat="server" TagName="div" DisplayInline="true" ModelType="Palette" PresetType="MoonLight" Value="#383A47"></ej:ColorPicker>
            </div>
            <div class="presets-col">
                <span>Candy Crush</span>
                <ej:ColorPicker ID="candyCrushPreset" runat="server" TagName="div" DisplayInline="true" ModelType="Palette" PresetType="CandyCrush" Value="#97cacb"></ej:ColorPicker>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .presets-col {
            margin-bottom: 25px;
            display: inline-block;
            margin-right: 35px;
        }

        .frame {
            width: auto;
            border: 0px;
            padding-left: 30px;
        }
    </style>
</asp:Content>



