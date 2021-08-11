<%@ Page Title="Splitter-Orientation-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates both vertical and horizontal orientation of the panes in the Syncfusion ASP.NET Web Forms Splitter component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Orientation.aspx.cs" Inherits="WebSampleBrowser.Splitter.Orientation" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:Splitter Height="250" Width="408" ID="outersplitter" Orientation="Vertical" EnableAutoResize="true" runat="server">
        <ej:SplitPane>
            <ej:Splitter ID="innersplitter" Width="408" runat="server" EnableAutoResize="true">
                <ej:SplitPane paneSize="80">
                    <div>
                        <div>Pane 1</div>
                    </div>
                </ej:SplitPane>
                <ej:SplitPane>
                    <div>
                        <div>Pane 2</div>
                    </div>
                </ej:SplitPane>
            </ej:Splitter>
        </ej:SplitPane>
        <ej:SplitPane PaneSize="70">
            <div>
                <div>Pane 3</div>
            </div>
        </ej:SplitPane>

    </ej:Splitter>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Orientation
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="changeOrientation" Width="120px" SelectedItemIndex="0" ClientSideOnChange="onOrientationChange" TargetID="Options" runat="server"></ej:DropDownList>
                    <div id="Options">
                        <ul>
                            <li>Horizontal</li>
                            <li>Vertical</li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Splitter/Orientation.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .cont {
            padding: 10px 0 0 30px;
        }

        #<%=outersplitter.ClientID%> {
            margin: 0 auto;
        }

        #<%=innersplitter%> {
            border: none;
        }
    </style>
</asp:Content>

