<%@ Page Title="" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="VirtualScrolling.aspx.cs" Inherits="WebSampleBrowser.FileExplorer.VirtualScrolling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
   Virtual Scrolling 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" EnablePageMethods="true" runat="server">
    <ej:FileExplorer ID="fileexplorer" runat="server" VirtualItemCount="20" IsResponsive="true" Width="100%" MinWidth="150px" Layout="Tile" 
                     AjaxAction="VirtualScrolling.aspx/FileActionDefault" Path="~/FileBrowser1/">
        <AjaxSettings>
            <Download Url="downloadFile.ashx{0}" />
            <Upload Url="uploadFiles.ashx{0}" />
        </AjaxSettings>
    </ej:FileExplorer>
</asp:Content>
