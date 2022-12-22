<%@ Page Title="ListBox-Keyboard Interaction-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to access the Syncfusion ASP.NET Web Forms ListBox component functionalities using keyboard interactions." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="KeyboardInteraction.aspx.cs" Inherits="WebSampleBrowser.ListBox.KeyboardInteraction" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select a font style</div>
            <ej:ListBox ID="fontnames" runat="server" DataTextField="Fonts" ClientSideOnCreate="OnCreated"></ej:ListBox>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid keyboard">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + J
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
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target;
        $(function () {
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) { // j- key code.
                    var target = $('#<%=fontnames.ClientID%>').data("ejListBox");
                    target.selectItemByIndex(0);
                    $("#<%=fontnames.ClientID%>_container").focus();
                }
            });
            $("#sampleProperties").ejPropertiesPanel();
        });
        function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=fontnames.ClientID%>").ejListBox("instance");
                    obj._refreshScroller();
                }, 800);
            }
            setTimeout(function () {
                $(".listbox").css("display", "block");
            }, 300);
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-ddl-popup {
            margin: 0 auto;
        }

        .ctrllabel {
            font-weight: 600;
            padding-bottom: 12px;
        }
    </style>
</asp:Content>


