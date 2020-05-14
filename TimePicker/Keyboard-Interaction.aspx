<%@ Page Title="TimePicker-Keyboard Interaction-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Keyboard-Interaction.aspx.cs" MetaDescription="This example demonstrates how the timepicker supports the keyboard navigation (Keyboard shortcuts) in a ASP.NET Web Forms" Inherits="WebSampleBrowser.TimePicker.keyboardnavigation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadSection" runat="server">
    <style type="text/css">
        .control {
            width: 210px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:TimePicker ID="time" Width="100%" runat="server"></ej:TimePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid keyboard">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt+ j 
                </div>
                <div class="col-md-3 col-xs-4">
                    Focuses the control
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Opens/Hides the popup
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Right / Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves to the adjacent part
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Increments the value
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Decrements the value
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    After popup opened:
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Selects the previous time
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Selects the next time
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Home / End
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves to the first / last item
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Esc
                </div>
                <div class="col-md-3 col-xs-4">
                    Closes the popup
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
                    $("#<%=time.ClientID%>").focus();
                }
            });
        });
    </script>
</asp:Content>

