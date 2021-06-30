<%@ Page Language="C#" Title="Menu-Center Menu-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="CenterMenu.aspx.cs" MetaDescription="This sample demonstrates aligning the menu items to the center of the popup in a ASP.NET Web Forms Menu control." Inherits="WebSampleBrowser.Menu.CenterMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe">
    <ej:Menu ID="docfile" runat="server" EnableCenterAlign="true">
        <Items>

            <ej:MenuItem Text="File">
                <Items>
                    <ej:MenuItem Text="New"></ej:MenuItem>
                    <ej:MenuItem Text="Open"></ej:MenuItem>
                    <ej:MenuItem Text="Save"></ej:MenuItem>
                    <ej:MenuItem Text="PrintPreview"></ej:MenuItem>
                    <ej:MenuItem Text="Print"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Text="Edit">
                <Items>
                    <ej:MenuItem Text="Undo"></ej:MenuItem>
                    <ej:MenuItem Text="Redo"></ej:MenuItem>
                    <ej:MenuItem Text="Cut"></ej:MenuItem>
                    <ej:MenuItem Text="Copy"></ej:MenuItem>
                    <ej:MenuItem Text="Paste"></ej:MenuItem>
                    <ej:MenuItem Text="Select All"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Text="View">
                <Items>
                    <ej:MenuItem Text="Print Layout"></ej:MenuItem>
                    <ej:MenuItem Text="Show ruler"></ej:MenuItem>
                    <ej:MenuItem Text="Show spelling suggestion"></ej:MenuItem>
                    <ej:MenuItem Text="Compact controls"></ej:MenuItem>
                    <ej:MenuItem Text="Full screen"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Text="Insert">
                <Items>
                    <ej:MenuItem Text="Image"></ej:MenuItem>
                    <ej:MenuItem Text="Link"></ej:MenuItem>
                    <ej:MenuItem Text="Comments"></ej:MenuItem>
                    <ej:MenuItem Text="Foot note"></ej:MenuItem>
                    <ej:MenuItem Text="Header"></ej:MenuItem>
                    <ej:MenuItem Text="Footer"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Text="Help">
                <Items>
                    <ej:MenuItem Text="Docs Help"></ej:MenuItem>
                    <ej:MenuItem Text="User Forums"></ej:MenuItem>
                    <ej:MenuItem Text="Report an Issue"></ej:MenuItem>
                    <ej:MenuItem Text="Keyboard Shortcuts"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
    </ej:Menu>
        </div>
</asp:Content>
<asp:Content ID="style" ContentPlaceHolderID="StyleSection" runat="server">
      <link href="../Content/ejthemes/responsive-css/ej.responsive.css" rel="stylesheet" />
</asp:Content>

