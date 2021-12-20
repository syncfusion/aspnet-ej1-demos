<%@ Page Language="C#" Title="RichTextEditor-RTL-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="RTL.aspx.cs" MetaDescription="This example demonstrates how to enable the rtl property in a ASP.NET Web Forms RichTextEditor." Inherits="WebSampleBrowser.RichTextEditor.RTL" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    RTL Support 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">

    <ej:RTE ID="rteRTL" runat="server" EnableRTL="true" Width="100%" MinWidth="200px">
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


