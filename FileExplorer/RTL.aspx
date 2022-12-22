<%@ Page Title="FileExplorer-RTL-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" 
CodeBehind="RTL.aspx.cs" MetaDescription="This example demonstrates how to enable the RTL property in a ASP.NET Web Forms File Explorer" Inherits="WebSampleBrowser.FileExplorer.RTL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    RTL Support
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:FileExplorer ID="dss" runat="server" Width="100%" MinWidth="150px" IsResponsive="true"  Layout="Tile" 
                     AjaxAction="RTL.aspx/FileActionDefault" Path="~/FileBrowser/" EnableRTL="true">
        <AjaxSettings>
            <Download Url="downloadFile.ashx{0}" />
            <Upload Url="uploadFiles.ashx{0}" />
        </AjaxSettings>
    </ej:FileExplorer>
</asp:Content>


