<%@ Page Language="C#" Title="RichTextEditor-Localization-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Localization.aspx.cs" MetaDescription="This example demonstrates how to localize the RichTextEditor component in a ASP.NET Web Forms." Inherits="WebSampleBrowser.RichTextEditor.Localization" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    Localization
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
        <ej:RTE ID="rteSample" runat="server" Width="100%">
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
                <div class="col-md-3">
                    Selection culture
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="language" Width="120" ClientSideOnChange="onChange" SelectedItemIndex="0" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="en-US" Text="English"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="de-DE" Text="Deutsch"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="es-ES" Text="Español"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/RichTextEditor/localizationScripts.js")%>' type="text/javascript" charset="us-ascii"></script>
</asp:Content>

