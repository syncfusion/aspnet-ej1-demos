<%@ Page Title="ColorPicker-Keyboard Interaction-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Keyboard-Interaction.aspx.cs" MetaDescription="This example demonstrates how the colorpicker supports the keyboard navigation (keyboard shortcuts) in a ASP.NET Web Forms" Inherits="WebSampleBrowser.ColorPicker.Keyboard_Interaction" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <div class="element">
                <ej:ColorPicker ID="colorpick" runat="server" Value="#278787"></ej:ColorPicker>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid keyboard">
            <div class="row">
                <span>
                    <center>KeyBoard Support</center>
                </span>
                <br />
            </div>
            <div class="row">
                <div class="row">
                    <div class="col-md-3">
                        Alt+J
                    </div>
                    <div class="col-md-3">
                        Focus the Control
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        Enter
                    </div>
                    <div class="col-md-3">
                        Open or Close the Popup / Choose the current color
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-3">
                        Esc
                    </div>
                    <div class="col-md-3">
                        Close the popup
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="row">
                    <span>
                        <center>Color Picker</center>
                    </span>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        Tab
                    </div>
                    <div class="col-md-3">
                        Choose the next element
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        Down
                    </div>
                    <div class="col-md-3">
                        Decrease the brightness
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        Up
                    </div>
                    <div class="col-md-3">
                        Increase the brightness 
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        Left
                    </div>
                    <div class="col-md-3">
                        Decrease the staturation 
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        Right
                    </div>
                    <div class="col-md-3">
                        Increase the staturation
                    </div>
                </div>
            </div>
            <div class="row">
                <br />
                <br />
                <div class="row">
                    <span>
                        <center>Color Palette</center>
                    </span>
                </div>
                <br />

                <div class="row">
                    <div class="col-md-3">
                        Down
                    </div>
                    <div class="col-md-3">
                        Move to downwards cell
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        Up
                    </div>
                    <div class="col-md-3">
                        Move to upwards cell
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        Left
                    </div>
                    <div class="col-md-3">
                        Move to previous cell
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        Right
                    </div>
                    <div class="col-md-3">
                        Move to next cell
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="row">
                    <span>
                        <center>Slider Only</center>
                    </span>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-3">
                        Home
                    </div>
                    <div class="col-md-3">
                        Downwards to value 0
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        End
                    </div>
                    <div class="col-md-3">
                        Upwards to value  100
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) { // j- key code.
                    $("#<%=colorpick.ClientID%>Wrapper").focus();
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .element {
            width: 400px;
        }
         .frame .control {
            margin-left:33%;
        }

        .prop-grid .row .col-md-3 {
            font-size: 12px;
        }
    </style>
</asp:Content>

