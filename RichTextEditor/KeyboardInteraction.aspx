<%@ Page Language="C#" Title="RichTextEditor-Keyboard Interaction-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="KeyboardInteraction.aspx.cs" MetaDescription="This example demonstrates how the RichTextEditor control supports the keyboard navigation(keyboard shortcuts) in a ASP.NET Web Forms." Inherits="WebSampleBrowser.RichTextEditor.KeyboardInteraction" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    keyboard Interactions
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:RTE ID="rteKey" runat="server" Width="100%" Height="511px" MinWidth="200px">
        <RTEContent>
            <p><b>Description:</b></p>
        <p>The Rich Text Editor (RTE) control is an easy to render in
        client side. Customer easy to edit the contents and get the HTML content for
        the displayed content. A rich text editor control provides users with a toolbar
        that helps them to apply rich text formats to the text entered in the text
        area. </p>
       <p><b>Functional
        Specifications/Requirements:</b></p>
        <ol><li><p>Provide
        the tool bar support, it’s also customizable.</p></li><li><p>Options
        to get the HTML elements with styles.</p></li><li><p>Support
        to insert image from a defined path.</p></li><li><p>Footer
        elements and styles(tag / Element information , Action button (Upload, Cancel))</p></li><li><p>Re-size
        the editor support.</p></li><li><p>Provide
        efficient public methods and client side events.</p></li><li><p>Keyboard
        navigation support.</p></li></ol>
        </RTEContent>
    </ej:RTE>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">

            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + j
                </div>
                <div class="col-md-3 col-xs-4">
                    Focuses the control.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + Ctrl + t
                </div>
                <div class="col-md-3 col-xs-4">
                    Focuses the toolbar.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Selected next item.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Selected previous item.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + b
                </div>
                <div class="col-md-3 col-xs-4">
                    Bold selected text.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + i
                </div>
                <div class="col-md-3 col-xs-4">
                    Italic selected text.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + u
                </div>
                <div class="col-md-3 col-xs-4">
                    Underline selected text.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + l
                </div>
                <div class="col-md-3 col-xs-4">
                    Text align left.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + e
                </div>
                <div class="col-md-3 col-xs-4">
                    Text align center.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + r
                </div>
                <div class="col-md-3 col-xs-4">
                    Text align right.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + j
                </div>
                <div class="col-md-3 col-xs-4">
                    Text align justify.
                </div>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        $(function () {
            //Control focus key
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) { // j- key code.
                    var rte = $("#<%=rteKey.ClientID%>").data("ejRTE");
                    rte.focus();
                }
                else if (e.altKey && e.ctrlKey && e.keyCode === 84) { // Alt + T
                    e.preventDefault();
                    $("#<%=rteKey.ClientID%>_toolbar").focus();
                }
            });
            $("#<%=rteKey.ClientID%>_Iframe").contents().on("keydown", function (e) {
                if (e.altKey && e.ctrlKey && e.keyCode === 84) { // Alt + T
                    e.preventDefault();
                    $("#<%=rteKey.ClientID%>_toolbar").focus();
                }
            });
            $("#sampleProperties").ejPropertiesPanel();
        });
    </script>
</asp:Content>

