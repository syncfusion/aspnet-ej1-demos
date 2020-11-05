<%@ Page Language="C#" Title="RichTextEditor-API's-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="API.aspx.cs" MetaDescription="This example demonstrates the various methods like getText, getHtml, executeCommand, pasteContent etc. in a ASP.NET Web Forms RichTextEditor control." Inherits="WebSampleBrowser.RichTextEditor.API_s" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    ClientSide API
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:RTE ID="rteSample" runat="server" Width="100%" MinWidth="200px">
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
                <div class="col-md-12">
                    <ej:Button ID="getHtmlBtn" CssClass="e-btn inputbtn" Text="Get HTML" Type="Button" ClientSideOnClick="ongetHtmlString" runat="server"></ej:Button>
                </div>
                <div class="col-md-12">
                    <ej:Button ID="gettxtBtn" CssClass="e-btn inputbtn" Text="Get Text" Type="Button" ClientSideOnClick="ongetText" runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ej:Button ID="execBtn" runat="server" CssClass="e-btn inputbtn" Type="Button" Text="Execute Bold" ClientSideOnClick="onexec"></ej:Button>
                </div>
                <div class="col-md-12">
                    <ej:Button CssClass="e-btn inputbtn" Text="Bold Status" Type="Button" ID="boldstsBtn" runat="server" ClientSideOnClick="oncmdStatus"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ej:Button ID="disBtn" runat="server" CssClass="e-btn inputbtn" Type="Button" Text="Select All" ClientSideOnClick="onSelectAll"></ej:Button>
                </div>
                <div class="col-md-12">
                    <ej:Button ID="boldBtn" runat="server" CssClass="e-btn inputbtn" Type="Button" Text="Select Range" ClientSideOnClick="onSeletcRange"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ej:Button ID="remonBtn" CssClass="e-btn inputbtn" Text="Paste Content" Type="Button" ClientSideOnClick="onPasteContent" runat="server"></ej:Button>
                </div>
                </div>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var rte;
        $(function () {
            rte = $("#<%=rteSample.ClientID%>").data("ejRTE");
            $("#sampleProperties").ejPropertiesPanel();
        });
    </script>
    <script type="text/javascript" src="../Scripts/RichTextEditor/APIJs.js"></script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .inputbtn {
            width: 107px;
        }
    </style>
</asp:Content>

