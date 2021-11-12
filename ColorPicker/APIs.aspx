<%@ Page Title="ColorPicker-API's-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="APIs.aspx.cs" MetaDescription="This example demonstrates the various methods like show, hide, enable, getValue and disable in a ASP.NET Web Forms ColorPicker"  Inherits="WebSampleBrowser.ColorPicker.APIs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <label class = "fadetext"> Choose a color </label>
            <ej:ColorPicker ID="colorPick" runat="server" Value="#278787"></ej:ColorPicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Value (prefix with '#')
                </div>
                <div class="col-md-3">
                    <input type="text" id="color-value" class="input ejinputtext" onchange="onValueChange()" placeholder="Value" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Opacity Value
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox runat="server" ID="opacityValue" Width="95px" MinValue="0" MaxValue="100" EnableStrictMode="true" ShowSpinButton="false" ClientSideOnChange="onOpacityChange" WatermarkText="Opacity Value"></ej:NumericTextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Enable Preview
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton runat="server" ID="preview" Width="95px" DefaultText="False" ActiveText="True" ClientSideOnChange="onPreview"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Enable Opacity
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton runat="server" ID="opacity" Width="95px" DefaultText="False" ActiveText="True" ClientSideOnChange="onEnableOpacity"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Show Recent Color
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton runat="server" ID="recentColor" Width="95px" DefaultText="True" ActiveText="False" ClientSideOnChange="onRecentColor"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Enabled
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton runat="server" ID="enabled" Width="95px" DefaultText="False" ActiveText="True" ClientSideOnChange="onEnabled"></ej:ToggleButton>
                </div>
            </div>
             <div class="row">
                <div class="col-md-3">
                    Show Swithcer
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton runat="server" ID="switcher" Width="95px" DefaultText="False" ActiveText="True" ClientSideOnChange="onSwitcher"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Show Buttons
                </div>
                <div class="col-md-3">
                    <ej:ToggleButton runat="server" ID="showButton" Width="95px" DefaultText="False" ActiveText="True" ClientSideOnChange="onShowButton"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Get HexCode
                </div>
                <div class="col-md-3">
                    <input type="button" class="e-btn e-select" id="hexCode" value="Value" onclick="getHexCode()" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var ColorObj;
        $(function () {
            ColorObj = $("#<%=colorPick.ClientID%>").data('ejColorPicker');
            $("#sampleProperties").ejPropertiesPanel();
            $("#color-value").keypress(function(event){
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if(keycode == '13'){
                    if ($("#color-value").val() !== "") {
                        if ($("#color-value").val().length == 4 || $("#color-value").val().length == 7)
                            ColorObj.option('value', $("#color-value").val());
                    }	
                }
            });
            $("#<%=opacityValue.ClientID%>").keypress(function(event){
                var keycode = (event.keyCode ? event.keyCode : event.which);
                if(keycode == '13')
                    ColorObj.option('opacityValue', $("#<%=opacityValue.ClientID%>").val());
            });
        });
        function onValueChange() {
            if ($("#color-value").val() !== "") {
                if ($("#color-value").val().length == 4 || $("#color-value").val().length == 7)
                    ColorObj.option('value', $("#color-value").val());
            }
        }
        function onOpacityChange(args) {
            args.value !=="" && ColorObj.option('opacityValue', args.value);
        }
        function onEnabled(args) {
            var ColorObj = $("#<%=colorPick.ClientID%>").data('ejColorPicker');
            if (args.isChecked) {
                ColorObj.option('enabled', false);
                $(".fadetext").addClass("e-disable");
            }
            else {
                ColorObj.option('enabled', true);
                $(".fadetext").removeClass("e-disable");
            }
        }
        function onShowButton(args) {
            var ColorObj = $("#<%=colorPick.ClientID%>").data('ejColorPicker');
            if (args.isChecked) ColorObj.option('showApplyCancel', false);
            else ColorObj.option('showApplyCancel', true);
        }
        function onSwitcher(args) {
            var ColorObj = $("#<%=colorPick.ClientID%>").data('ejColorPicker');
            if (args.isChecked) ColorObj.option('showSwitcher', false);
            else ColorObj.option('showSwitcher', true);
        }
        function onRecentColor(args) {
            var ColorObj = $("#<%=colorPick.ClientID%>").data('ejColorPicker');
            if (args.isChecked) ColorObj.option('showRecentColors', true);
            else ColorObj.option('showRecentColors', false);
        }
        function onEnableOpacity(args) {
            var ColorObj = $("#<%=colorPick.ClientID%>").data('ejColorPicker');
            var numericObj = $("#<%=opacityValue.ClientID%>").data('ejNumericTextbox');
            if (args.isChecked) {
                ColorObj.option('enableOpacity', false);
                numericObj.disable();
            }
            else {
                ColorObj.option('enableOpacity', true);
                numericObj.enable();
            }
        }
        function onPreview(args) {
            var ColorObj = $("#<%=colorPick.ClientID%>").data('ejColorPicker');
            if (args.isChecked) ColorObj.option('showPreview', false);
            else ColorObj.option('showPreview', true);
        }
        function getHexCode() {
            var ColorObj = $("#<%=colorPick.ClientID%>").data('ejColorPicker');
            setTimeout(function () { alert("The Colorpicker value : " + ColorObj.getValue()); }, 250);
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .frame .control {
           margin-left: 40%;
        }

        .prop-grid .row .e-btn.e-select {
            width: 95px;
        }

        .row #hexCode {
            width: 95px;
            height: 30px;
        }

        .e-bootstrap .row #hexCode {
            height: 34px;
        }

        .input.ejinputtext {
            text-indent: 10px;
            width: 93px;
            height: 26px;
        }

        .e-btn {
            height: 30px;
        }

        .e-prop.e-bootstrap .input.ejinputtext {
            height: 30px;
        }

        .row .e-widget.e-numeric {
            width: 95px;
        }
    </style>
</asp:Content>


