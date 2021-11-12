<%@ Page Title="Buttons-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This example demonstrates the default functionalities of the Button control and its properties like size, contenttype and showroundedcorner in a ASP.NET Web Forms" 
AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.Buttons.button" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
       <div class="control">
             <table>
                <tr>
				    <th colspan="2" style="padding-left:30px"> Button </th>
			    </tr><tr>
                    <td>Normal</td>
                    <td class="btnsht">
                        <ej:Button ID="ButtonNormal" runat="server" Type="Button" Text="login" Size="Normal" ShowRoundedCorner="true" ContentType="ImageOnly" PrefixIcon="e-icon e-uiLight e-handup"></ej:Button>
                     </td>
                </tr>
                <tr>
                    <td>Mini</td>
                    <td class="btnsht">
                        <ej:Button ID="ButtonMini" runat="server" Type="Button" Text="login" Size="Mini" ShowRoundedCorner="true"></ej:Button>
                    </td>
                </tr>
                <tr>
                    <td>Small</td>
                    <td class="btnsht">
                        <ej:Button ID="ButtonSmall" runat="server" Type="Button" Text="login" Size="Small" ShowRoundedCorner="true"></ej:Button>
                    </td>
                </tr>
                <tr>
                    <td>Medium</td>
                    <td class="btnsht">
                        <ej:Button ID="ButtonMedium" runat="server" Type="Button" Text="login" Size="Medium" ShowRoundedCorner="true"></ej:Button>
                    </td>
                </tr>
                <tr>
                    <td>Large</td>
                    <td class="btnsht">
                         <ej:Button ID="ButtonLarge" runat="server" Type="Button" Text="login" Size="Large" ShowRoundedCorner="true" ContentType="TextAndImage" PrefixIcon="e-icon e-uiLight e-handup"></ej:Button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-bgdefault:hover .e-buttondiv .e-icon.e-uiLight.e-handup, .e-bgdefault:active .e-buttondiv .e-icon.e-uiLight {
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

