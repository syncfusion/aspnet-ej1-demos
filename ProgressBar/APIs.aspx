<%@ Page Title="ProgressBar-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="APIs.aspx.cs" MetaDescription="This example demonstrates the various methods like enable and disable in a ASP.NET Web Forms ProgressBar." Inherits="WebSampleBrowser.ProgressBar.methods" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">

            <div>
                <ej:ProgressBar ID="ProgressBar1" runat="server" Height="20px"></ej:ProgressBar>
            </div>

        </div>
        <div class="txt">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-12">
                    <ej:ToggleButton ID="enabledisable" Width="110px" ClientSideOnClick="changeState" Type="Button" ActiveText="Enable" DefaultText="Disable" runat="server"></ej:ToggleButton>

                </div>
                <div class="col-md-12">
                    <ej:Button ID="getper" Text="Get Percentage" Type="Button" ClientSideOnClick="onGetPercentage" CssClass="e-btn inputbtn" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var progressBar;
        $(function () {
            progressBar = $("#<%=ProgressBar1.ClientID%>").data("ejProgressBar");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function changeState(args) {
            if (args.isChecked) progressBar.disable();
            else progressBar.enable();
        }
        function onGetPercentage() {
            alert("Progress percentage : " + progressBar.getPercentage());
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 330px;
        }
        .inputbtn {
            width: 110px;
        }

        .cols-prop-area .content {
            height: 300px;
        }
    </style>
</asp:Content>

