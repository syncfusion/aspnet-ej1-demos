<%@ Page Title="DatePicker-Keyboard Interaction-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Keyboard-Interaction.aspx.cs"MetaDescription="This example demonstrates how the datepicker supports the keyboard navigation(keyboard shortcuts) in a ASP.NET Web Forms" Inherits="WebSampleBrowser.DatePicker.keyboard" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DatePicker ID="datepickkey" runat="server" Width="100%"></ej:DatePicker>
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
                    Opens the popup
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves to previous date
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves to next date
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves one week upward
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves one week downward
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enter
                </div>
                <div class="col-md-3 col-xs-4">
                    Selects the focused date
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + Enter
                </div>
                <div class="col-md-3 col-xs-4">
                    Selects the today date
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
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates to top view
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates to lower view
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates to previous month
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates to next month
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
                    $("#<%=datepickkey.ClientID%>").focus();
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
       .frame {
            padding: 50px;
            width: 30%;
        }
    </style>
</asp:Content>

