<%@ Page Language="C#" Title="RichTextEditor-Default Functionalities-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This example demonstrates initializing a simple ASP.NET Web Forms RichTextEditor control." Inherits="WebSampleBrowser.RichTextEditor.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    Default 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="height:600px">
        <ej:RTE ID="DefaultRTE" Width="100%" Height="100%" runat="server" MinWidth="200px">
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
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="StyleSection" ID="content1">
    <style>
        #LayoutSection_ControlsSection_DefaultRTE_wrapper {
    min-width: 200px!important;
}

    </style>
</asp:Content>


