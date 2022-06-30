<%@ Page Language="C#" Title="Menu-Context Menu-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ContextMenu.aspx.cs" MetaDescription="This sample demonstrates initializing the context menu over a target using ASP.NET Web Forms Menu control." Inherits="WebSampleBrowser.Menu.ContextMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe">
    <div id="target" class="textarea">
        HTML is written in the form of HTML elements consisting of tags enclosed in angle
        brackets (like
        &lt;html&gt;
        ),within the web page content. HTML tags most commonly come in pairs like and ,although
        some tags, known as empty elements, are unpaired, for example
        &lt;img&gt;. The purpose of a web browser is to read HTML documents and compose them into
        visible or audible web pages. The browser does not display the HTML tags, but uses
        the tags to interpret the content of the page.
    </div>
        </div>
    <ej:Menu ID="Menu1" MenuType="ContextMenu" OpenOnClick="false" runat="server" ContextMenuTarget="#target">
        <Items>
            <ej:MenuItem Text="Cut"></ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="Copy"></ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="Paste" SpriteCssClass="e-separator"></ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="Comments"></ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="Links"></ej:MenuItem>
        </Items>
        <Items>
            <ej:MenuItem Text="Clear Formatting"></ej:MenuItem>
        </Items>
    </ej:Menu>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
      <link href="../Content/ejthemes/responsive-css/ej.responsive.css" rel="stylesheet" />
    <style type="text/css">
        .textarea {
            border: 1px solid;
            padding: 10px;
            position: relative;
            text-align: justify;
            color: gray;
        }

        .e-menu-res-wrap {
            display: none;
            height: 32px;
            overflow: hidden;
        }
    </style>
</asp:Content>

