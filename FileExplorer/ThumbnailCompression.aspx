<%@ Page Title="FileExplorer-Thumbnail Compression-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ThumbnailCompression.aspx.cs" MetaDescription="This example demonstrates about thumbnail image compression in a ASP.NET Web Forms File Explorer" Inherits="WebSampleBrowser.FileExplorer.ThumbnailCompression" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    Default 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" EnablePageMethods="true" runat="server">
    <ej:FileExplorer 
        ID="fileexplorer" 
        runat="server" 
        IsResponsive="true" 
        Width="100%" 
        MinWidth="150px" 
        EnableThumbnailCompress="true" 
        Layout="Tile" 
        AjaxAction="ThumbnailCompression.aspx/FileActionDefault"
        Path="~/FileBrowser/">
        <AjaxSettings>
            <Download Url="downloadFile.ashx{0}" />
            <Upload Url="uploadFiles.ashx{0}" />
            <GetImage Url="getImage.ashx{0}" />
        </AjaxSettings>
    </ej:FileExplorer>
</asp:Content>

