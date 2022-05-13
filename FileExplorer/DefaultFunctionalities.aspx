<%@ Page Title="FileExplorer-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This example demonstrates the default functionalities in a ASP.NET Web Forms File Explorer." Inherits="WebSampleBrowser.FileExplorer.DefaultFunctionalities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    Default 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" EnablePageMethods="true" runat="server">
    <ej:FileExplorer ID="fileexplorer" runat="server" IsResponsive="true" Width="100%" MinWidth="150px" Layout="Tile" 
                     AjaxAction="DefaultFunctionalities.aspx/FileActionDefault" Path="~/FileBrowser/">
        <AjaxSettings>
            <Download Url="downloadFile.ashx{0}" />
            <Upload Url="uploadFiles.ashx{0}" />
        </AjaxSettings>
    </ej:FileExplorer>
</asp:Content>


