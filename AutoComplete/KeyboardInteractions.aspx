<%@ Page Title="Keyboard interaction in ASP.NET AutoComplete | Syncfusion" MetaDescription="This example demonstrates how to access the Syncfusion ASP.NET Web Forms Autocomplete control functionalities using keyboard interactions." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="KeyboardInteractions.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.KeyboardInteractions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="keyboard" runat="server" Width="100%" WatermarkText="Choose skills" MultiSelectMode="Delimiter"></ej:Autocomplete>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        $(function () {
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) { // j- key code.
                    $("#<%=keyboard.ClientID%>").focus();
                }
            });
            $("#sampleProperties").ejPropertiesPanel();
        });
    </script>
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
                    Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves to previous item
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves to next item
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
                    Esc
                </div>
                <div class="col-md-3 col-xs-4">
                    Closes the popup
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>

