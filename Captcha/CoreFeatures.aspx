<%@ Page Language="C#" Title="Captcha-API's-ASP.NET-SYNCFUSION" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CoreFeatures.aspx.cs" MetaDescription="This example demonstrates the various options like character set, maximin length and hatch style in ASP.NET Web Forms Captcha." Inherits="WebSampleBrowser.Captcha.CoreFeatures" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <table>
                <tr>
                    <td>
                        <div>
                            <ej:Captcha ID="captcha1" ShowAudioButton="true" ShowRefreshButton="true" MaximumLength="5" CharacterSet="ABCD1234" HatchStyle="BackwardDiagonal" EnableAutoValidation="true" CustomErrorMessage="Invalid Captcha" TargetButton="btnSubmit" Mapper="GetCurrentItem" runat="server"></ej:Captcha>
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
<asp:Content ID="Content1" ContentPlaceHolderID="PropertySection" runat="server">

    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">Hatch Style</div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="Hatch" SelectedItemIndex="0" runat="server" Width="100px"></ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">Character Set</div>
                <div class="col-md-3 col-xs-4">
                    <asp:TextBox ID="charset1" runat="server" Text="ABCD1234" Width="100px"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">Maximum Length</div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="maxset" EnableStrictMode="false" MaxValue="9" MinValue="5" Value="5" runat="server" Width="100px"></ej:NumericTextBox>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <ej:Button ID="apply1" Width="107px" Type="Button" OnClick="apply1_Click" Text="Apply" runat="server"></ej:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
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

