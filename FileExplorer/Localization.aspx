<%@ Page Title="FileExplorer-Localization-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" 
CodeBehind="Localization.aspx.cs" MetaDescription="This example demonstrates how to localize the File Explorer in a ASP.NET Web Forms" Inherits="WebSampleBrowser.FileExplorer.Localization" %>

<asp:Content ID="Content4" ContentPlaceHolderID="SampleHeading" runat="server">
    Localization
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:FileExplorer ID="fileexplorer" runat="server" Width="100%" MinWidth="150px" IsResponsive="true" Layout="Tile" 
                     AjaxAction="Localization.aspx/FileActionDefault" Path="~/FileBrowser/">
        <AjaxSettings>
            <Download Url="downloadFile.ashx{0}" />
            <Upload Url="uploadFiles.ashx{0}" />
        </AjaxSettings>
    </ej:FileExplorer>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Select culture
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="language" Width="120" ClientSideOnChange="onChange" SelectedItemIndex="0" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="en-US" Text="English"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="de-DE" Text="Deutsch"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="es-ES" Text="Español"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="ar-SA" Text="العربية"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/FileExplorer/localizationScripts.js")%>' type="text/javascript" charset="us-ascii"></script>
</asp:Content>


