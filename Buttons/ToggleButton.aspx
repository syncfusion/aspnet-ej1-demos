<%@ Page Title="Buttons-Toggle Button-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="ToggleButton.aspx.cs" Inherits="WebSampleBrowser.Buttons.togglebuttons" MetaDescription="This example demonstrates the default functionalities of the ToggleButton and its various property like size,text, showroundedcorner in a ASP.NET Web Forms"%>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <table>
                <tr>
				    <th colspan="2" style="padding-left:30px"> Toggle button </th>
			    </tr> <tr>
                    <td>Normal
                    </td>
                    <td class="btnsht">
                        <ej:ToggleButton ID="ToggleButtonNormal" runat="server" Size="Normal" ShowRoundedCorner="true" ContentType="ImageOnly" DefaultPrefixIcon="e-icon e-mediaplay e-uiLight" ActivePrefixIcon="e-icon e-mediapause e-uiLight"></ej:ToggleButton>
                    </td>
                </tr>
                <tr>
                    <td>Mini
                    </td>
                    <td class="btnsht">
                        <ej:ToggleButton ID="ToggleButtonMini" runat="server" Size="Mini" ShowRoundedCorner="true" DefaultText="Play" ActiveText="Pause"></ej:ToggleButton>
                    </td>
                </tr>
                <tr>
                    <td>Small
                    </td>
                    <td class="btnsht">
                        <ej:ToggleButton ID="ToggleButtonSmall" runat="server" Size="Small" ShowRoundedCorner="true" DefaultText="Play" ActiveText="Pause"></ej:ToggleButton>
                    </td>
                </tr>
                <tr>
                    <td>Medium
                    </td>
                    <td class="btnsht">
                        <ej:ToggleButton ID="ToggleButtonMedium" runat="server" Size="Medium" ShowRoundedCorner="true" DefaultText="Play" ActiveText="Pause"></ej:ToggleButton>
                    </td>
                </tr>
                <tr>
                    <td>Large
                    </td>
                    <td class="btnsht">
                        <ej:ToggleButton ID="ToggleButtonLarge" runat="server" Size="Large" ShowRoundedCorner="true" ContentType="TextAndImage" DefaultText="Play" ActiveText="Pause" DefaultPrefixIcon="e-icon e-mediaplay e-uiLight" ActivePrefixIcon="e-icon e-mediapause e-uiLight"></ej:ToggleButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-bghover .e-tglebuttondiv .e-icon.e-uiLight, .e-bgselected .e-tglebuttondiv .e-icon.e-uiLight {
            background-image: url('../Content/ejthemes/common-images/icons-white.png');
        }

        .control{
			padding: 30px;
		}
		td{
			padding:5px;
		}
		.frame{
			padding: 0 20px;
			width: 28%;
		}
        .spltspan {
            width: 50px;
        }    </style>
</asp:Content>

