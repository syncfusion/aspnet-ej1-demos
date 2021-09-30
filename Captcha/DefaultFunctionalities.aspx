<%@ Page Language="C#" Title="Captcha-Default Functionalities-ASP.NET-SYNCFUSION" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs"  MetaDescription="This example demonstrates as simple form validation using ASP.NET Web Forms Captcha." Inherits="WebSampleBrowser.Captcha.DefaultFunctionalities" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame" style="width: 500px">
        <div class="control">
            <table class="tabprop">
                <tr>
                    <td>
                        <div style="width: 185px;">
                            <ej:Captcha ID="captcha1" Mapper="GetCurrentItem" ShowAudioButton="true" ShowRefreshButton="true" EnableAutoValidation="true" CustomErrorMessage="Invalid Captcha" TargetButton="btnSubmit" runat="server"></ej:Captcha>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <ej:Button ID="btnSubmit" runat="server" Text="Submit" Size="Large" Type="Button" ClientSideOnClick="onValidate"></ej:Button>
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

