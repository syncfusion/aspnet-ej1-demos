<%@ Page Title="Buttons-RTL-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="RTL.aspx.cs" Inherits="WebSampleBrowser.Buttons.rtl"  MetaDescription="This example demonstrates how to enable the rtl property in a ASP.NET Web Forms Button, ToggleButton, GroupButton, SplitButton."%>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <table>
                <tr>
                    <td class="btnsht">
                        <ej:Button ID="Button" runat="server" Text="Play" Type="Button" Size="Large" ContentType="TextAndImage" ShowRoundedCorner="true" ImagePosition="ImageLeft" PrefixIcon="e-icon e-mediaplay e-uiLightn" EnableRTL="true"></ej:Button>

                    </td>
                    <td class="btnsht brtl">Button
                    </td>
                </tr>
                <tr>
                    <td class="btnsht">
                        <ej:ToggleButton ID="ToggleButton" runat="server" Size="Large" ShowRoundedCorner="true" ContentType="TextAndImage" DefaultText="Play" ActiveText="Next" DefaultPrefixIcon="e-icon e-mediaplay e-uiLight" ActivePrefixIcon="e-icon e-mediapause e-uiLight" EnableRTL="true"></ej:ToggleButton>

                    </td>
                    <td class="btnsht brtl">Toggle Button
                    </td>
                </tr>
                <tr>
                    <td class="btnsht">
                        <ej:SplitButton ID="SplitButton" runat="server" Text="Play" Size="Large" ContentType="TextAndImage" ShowRoundedCorner="true" ImagePosition="ImageLeft" PrefixIcon="e-icon e-mediaplay e-uiLight" EnableRTL="true">
                            <Items>
                                <ej:SplitItem Text="Pause"></ej:SplitItem>
                                <ej:SplitItem Text="Next"></ej:SplitItem>
                                <ej:SplitItem Text="Previous"></ej:SplitItem>
                            </Items>
                        </ej:SplitButton>

                    </td>
                    <td class="splttd btnsht brtl">Split Button
                    </td>
                </tr>
                <tr>
                    <td class="btnsht">
                        <ej:GroupButton ID="GroupButton" runat="server" EnableRTL="true" Width="100%" Height="40px" GroupButtonMode="RadioButton" ShowRoundedCorner="true">
                            <Items>
                                <ej:GroupButtonItem Text="Next"></ej:GroupButtonItem>
                                <ej:GroupButtonItem Text="Play"></ej:GroupButtonItem>
                                <ej:GroupButtonItem Text="Previous"></ej:GroupButtonItem>
                            </Items>
                        </ej:GroupButton>                        
                    </td>
                    <td class="splttd btnsht brtl">Group Button
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-bgdefault:hover .e-buttondiv .e-icon.e-uiLight, .e-bghover .e-tglebuttondiv .e-icon.e-uiLight, .e-bgdefault:hover .e-splitbuttondiv .e-icon.e-uiLight, .e-bgdefault:active .e-buttondiv .e-icon.e-uiLight, .e-bgselected .e-tglebuttondiv .e-icon.e-uiLight, .e-bgdefault:active .e-splitbuttondiv .e-icon.e-uiLight {
            background-image: url('../Content/ejthemes/common-images/icons-white.png');
        }

        .frame {
            width: 50%;
        }

        .control {
            margin-left: 15%;
        }

        .brtl {
            text-align: right;
        }
    </style>
</asp:Content>

