<%@ Page Title="DropDownList-Keyboard Interaction-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="KeyboardInteraction.aspx.cs" MetaDescription="This example demonstrates how the DropDownList control supports the keyboard navigation(keyboard shortcuts) in a ASP.NET Web Forms." Inherits="WebSampleBrowser.DropDownList.KeyboardInteraction" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="fontnames" runat="server" DataTextField="Fonts" WatermarkText="Select a font" Width="100%"></ej:DropDownList>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid keyboard">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + j
                </div>
                <div class="col-md-3 col-xs-4">
                    Focuses the control
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    UP
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates upwards 
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates downwards
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates upwards
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates downwards
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Home
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates to the starting item
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    End
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates to the ending item
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enter
                </div>
                <div class="col-md-3 col-xs-4">
                    Selects the focused item
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Closes the popup window
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Opens the popup window
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Esc
                </div>
                <div class="col-md-3 col-xs-4">
                    Closes the popup window
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target;
        $(function () {
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) { // j- key code.
                    $("#<%=fontnames.ClientID%>_wrapper").focus();
                }
            });
            $("#sampleProperties").ejPropertiesPanel();
        });
    </script>
</asp:Content>

