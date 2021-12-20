<%@ Page Title="FileExplorer-Client-Side Events-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" 
CodeBehind="Events.aspx.cs" MetaDescription="This example demonstrates the various events available in a ASP.NET Web Forms File Explorer" Inherits="WebSampleBrowser.FileExplorer.Events" %>

<asp:Content ID="Content4" ContentPlaceHolderID="SampleHeading" runat="server">
    Events
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:FileExplorer ID="fileExplorer" Width="100%" runat="server" IsResponsive="true" MinWidth="150px" 
                     AjaxAction="Events.aspx/FileActionDefault" Path="~/FileBrowser/" ClientSideOnLayoutChange="onLayoutChange" 
                     ClientSideOnCreateFolder="onCreateFolder" ClientSideOnSelect="onSelect" ClientSideOnRemove="onRemove" 
                     ClientSideOnCut="onCut" ClientSideOnCopy="onCopy" ClientSideOnPaste="onPaste" ClientSideOnOpen="onOpen"
                     ClientSideOnUnselect="onUnselect">
        <AjaxSettings>
            <Download Url="downloadFile.ashx{0}" />
            <Upload Url="uploadFiles.ashx{0}" />
        </AjaxSettings>
    </ej:FileExplorer>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="EventSection" runat="server">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" 
                                     ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" 
                                     runat="server">
                        <Items>
                            <ej:DropDownListItem Value="layoutChange" Text="layoutChange"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="select" Text="select"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="unselect" Text="unselect"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="createFolder" Text="createFolder"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="remove" Text="remove"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="cut" Text="cut"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="copy" Text="copy"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="paste" Text="paste"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="open" Text="open"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog" runat="server" clientidmode="Static">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" Type="Button" Text="Clear" ClientSideOnClick="onClear" CssClass="eventclear e-btn" 
                               runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/FileExplorer/Events.js")%>' type="text/javascript"></script>
</asp:Content>

