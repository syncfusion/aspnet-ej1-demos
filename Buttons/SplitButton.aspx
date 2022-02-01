<%@ Page Title="Buttons-Split Button-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="SplitButton.aspx.cs" MetaDescription="This example demonstrates the default functionalities of SplitButton and its various property like size,text, showroundedcorner and targetid in a ASP.NET Web Forms" Inherits="WebSampleBrowser.Buttons.splitbuttons" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
             <table>
                <tr>
				    <th colspan="2" style="padding-left:30px"> Split button </th>
			    </tr> <tr>
                    <td>Mini</td>
                    <td class="btnsht">
                        <ej:SplitButton ID="ButtonSizeMini" runat="server" Text="login" Size="Mini" ShowRoundedCorner="true" ContentType="ImageOnly" PrefixIcon="e-icon e-uiLight e-login">
                            <Items>
                                <ej:SplitItem Text="User"></ej:SplitItem>
                                <ej:SplitItem Text="Guest"></ej:SplitItem>
                                <ej:SplitItem Text="Admin"></ej:SplitItem>
                            </Items>
                        </ej:SplitButton>
                    </td>
			    </tr> <tr>
                    <td>Small</td>
                    <td class="btnsht">
                        <ej:SplitButton ID="ButtonSizeSmall" runat="server" Text="login" Size="Small" ShowRoundedCorner="true">
                            <Items>
                                <ej:SplitItem Text="User"></ej:SplitItem>
                                <ej:SplitItem Text="Guest"></ej:SplitItem>
                                <ej:SplitItem Text="Admin"></ej:SplitItem>
                            </Items>
                        </ej:SplitButton>
                   </td>
			    </tr> <tr>
                    <td>Normal</td>
                    <td class="btnsht">
                    <ej:SplitButton ID="ButtonSizeNormal" runat="server" Text="login" Size="Normal" ShowRoundedCorner="true" Width="100px" >
                        <Items>
                            <ej:SplitItem Text="User"></ej:SplitItem>
                            <ej:SplitItem Text="Guest"></ej:SplitItem>
                            <ej:SplitItem Text="Admin"></ej:SplitItem>
                        </Items>
                    </ej:SplitButton>
                 </td>
			    </tr> <tr>
                    <td>Medium</td>
                    <td class="btnsht">
                        <ej:SplitButton ID="ButtonSizeMedium" runat="server" Text="login" Size="Medium" ShowRoundedCorner="true">
                            <Items>
                                <ej:SplitItem Text="User"></ej:SplitItem>
                                <ej:SplitItem Text="Guest"></ej:SplitItem>
                                <ej:SplitItem Text="Admin"></ej:SplitItem>
                            </Items>
                        </ej:SplitButton>
                    </td>
			    </tr> <tr>
                    <td>Large</td>
                    <td class="btnsht">
                        <ej:SplitButton ID="ButtonSizeLarge" runat="server" Text="login" Size="Large" ShowRoundedCorner="true" ContentType="TextAndImage" PrefixIcon="e-icon e-login e-uiLight">
                            <Items>
                                <ej:SplitItem Text="User"></ej:SplitItem>
                                <ej:SplitItem Text="Guest"></ej:SplitItem>
                                <ej:SplitItem Text="Admin"></ej:SplitItem>
                            </Items>
                        </ej:SplitButton>
                   </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">ButtonMode</div>
                <div class="col-md-3">
                    <ej:DropDownList ID="btnmode" runat="server" Width="120px" SelectedItemIndex="0" ClientSideOnChange="onChange">
                        <Items>
                            <ej:DropDownListItem Text="Split" Value="split"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Dropdown" Value="dropdown"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onChange(args) {
            $(".e-splitbutton").ejSplitButton({ "buttonMode": args.value });
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-bgdefault:hover .e-splitbuttondiv .e-icon.e-uiLight.e-login, .e-bgdefault:active .e-splitbuttondiv .e-icon.e-login.e-uiLight {
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
			width: 50%;
		}
        .spltspan {
            width: 50px;
        }    </style>
</asp:Content>

