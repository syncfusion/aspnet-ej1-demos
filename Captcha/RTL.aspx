<%@ Page Language="C#" Title="Captcha-RTL-ASP.NET-SYNCFUSION" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RTL.aspx.cs" MetaDescription="This example demonstrates how to enable the rtl property in a ASP.NET Web Forms Captcha" Inherits="WebSampleBrowser.Captcha.RTL" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <table>
                <tr>
                    <td>
                        <div style="margin-left: -13px;">
                            <ej:Captcha ID="captcha1" ShowAudioButton="true" EnableRTL="true" ShowRefreshButton="true" Mapper="GetCurrentItem" EnableAutoValidation="true" CustomErrorMessage="Invalid Captcha" TargetButton="btnSubmit" MinimumLength="5" runat="server"></ej:Captcha>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="padding:5px;">
                            <ej:Button ID="btnSubmit" EnableRTL="true" runat="server" Text="Submit" Size="Large" Type="Button" ClientSideOnClick="onValidate"></ej:Button>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function onValidate(args) {
            var value = $("#<%=captcha1.ClientID%>_CaptchaMessage")[0].innerHTML;
            if (value != "Invalid Captcha") {
                alert("Thank you for registering");
            }
        }
    </script>
	<style type="text/css">
        .control {
            width:155px;
            margin: 0 auto;
        }
    </style>
</asp:Content>

