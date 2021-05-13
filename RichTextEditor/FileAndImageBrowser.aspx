<%@ Page Title="RichTextEditor-File & Image Browser-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="FileAndImageBrowser.aspx.cs" MetaDescription="This sample demonstrates how to manage the files and images using File Explorer and insert them in ASP.NET Web Forms RichTextEditor control."  Inherits="WebSampleBrowser.RichTextEditor.FileAndImageBrowser" %>

<asp:Content ID="Content4" ContentPlaceHolderID="SampleHeading" runat="server">
    File/Image Browser
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
        <ej:RTE ID="browser" Width="100%" Height="440" runat="server" MinWidth="200px">
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
            <ImageBrowser ExtensionAllow="*.png,*.gif,*.jpg,*.jpeg" FilePath="~/FileBrowser/" AjaxAction="FileAndImageBrowser.aspx/FileActionDefault" UploadAction="../FileExplorer/uploadFiles.ashx{0}"/>
            <FileBrowser ExtensionAllow="*.png,*.txt,*.jpg,*.docx" FilePath="~/FileBrowser/" AjaxAction="FileAndImageBrowser.aspx/FileActionDefault" UploadAction="../FileExplorer/uploadFiles.ashx{0}"/>
        </ej:RTE>
</asp:Content>

