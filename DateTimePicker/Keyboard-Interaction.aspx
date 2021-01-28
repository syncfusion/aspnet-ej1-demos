<%@ Page Title="DateTimePicker-Keyboard Interaction-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Keyboard-Interaction.aspx.cs" MetaDescription="This example demonstrates how the datetimepicker supports the keyboard navigation(keyboard shortcuts) in a ASP.NET Web Forms" Inherits="WebSampleBrowser.DateTimePicker.keyboardnavigation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadSection" runat="server">
    <style type="text/css">
      .frame {
            padding: 50px;
            width: 30%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DateTimePicker ID="dateTime" Width="100%" runat="server"></ej:DateTimePicker>
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
                    After popup opened:
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Focus through out the popup container in forward direction
                </div>
                <div class="col-md-3 col-xs-4">
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Focus through out the popup container in backward direction
                </div>
                <div class="col-md-3 col-xs-4">
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enter
                </div>
                <div class="col-md-3 col-xs-4">
                    select the focused control/selects the focused element
                </div>
                <div class="col-md-3 col-xs-4">
                </div>
            </div>
            <br />
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
                    $("#<%=dateTime.ClientID%>").focus();
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .e-datetime-popup .e-focus {
            box-shadow: 0 0 2px rgba(0, 0, 0, 0.5);
        }

        .darktheme .e-datetime-popup .e-focus {
            box-shadow: 0 0 2px rgba(255, 255, 255, 0.5);
        }
    </style>
</asp:Content>

