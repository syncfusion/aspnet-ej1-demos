<%@ Page Language="C#" Title="Menu-Server-Side Events-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Events.aspx.cs" MetaDescription="This sample demonstrates the various server side click event of ASP.NET Web Forms Menu control." Inherits="WebSampleBrowser.Menu.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 364px;">
    <ej:Menu ID="menuEvents" runat="server" OnItemClick="menuEvents_ItemClick">
        <Items>
            <ej:MenuItem Id="File" Text="File">
                <Items>
                    <ej:MenuItem Id="New" Text="New"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Open" Text="Open"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Save" Text="Save"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="PrintPreview" Text="PrintPreview"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Print" Text="Print"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="Edit" Text="Edit">
                <Items>
                    <ej:MenuItem Id="Undo" Text="Undo"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Redo" Text="Redo"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Cut" Text="Cut"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Copy" Text="Copy"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Paste" Text="Paste"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="SelectAll" Text="Select All"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="View" Text="View">
                <Items>
                    <ej:MenuItem Id="PrintLayout" Text="Print Layout"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Showruler" Text="Show ruler"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Showspellingsuggestion" Text="Show spelling suggestion"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Compactcontrols" Text="Compact controls"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Fullscreen" Text="Full screen"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="Insert" Text="Insert">
                <Items>
                    <ej:MenuItem Id="Image" Text="Image"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Link" Text="Link"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Comments" Text="Comments"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Footnote" Text="Foot note"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Header" Text="Header"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Footer" Text="Footer"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="Help" Text="Help">
                <Items>
                    <ej:MenuItem Id="DocsHelp" Text="Docs Help"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="UserForums" Text="User Forums"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="ReportanIssue" Text="Report an Issue"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="KeyboardShortcuts" Text="Keyboard Shortcuts"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
    </ej:Menu>
        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <%--  <script src='<%= Page.ResolveClientUrl("~/Scripts/Menu/Events.js")%>' type="text/javascript"></script>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        #<%=menuEvents.ClientID%> {
            margin-left: 70px;
        }

        .e-menu-res-wrap {
            height: 32px;
            overflow: hidden;
        }
		.office-365 .controlframe{
            width: 382px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ClearButton" EventName="click" />
        </Triggers>
        <ContentTemplate>
            <div class="cols-prop-area event-tracer">
                <div>
                    <div class="heading">
                        <span>Event Trace</span>
                    </div>
                    <div class="prop-grid content">
                        <div class="eventarea">
                            <div class="EventLog" id="EventLog" runat="server">
                            </div>
                        </div>
                        <div class="evtbtn">
                            <ej:Button ID="ClearButton" Type="Button" OnClick="ClearButton_Click" runat="server" Text="Clear"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

