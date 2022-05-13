<%@ Page Title="Splitter-Client-Side Events-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates client-side events when particular operations are performed in the Syncfusion ASP.NET Web Forms Splitter component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Splitter.Events" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">

    <ej:Splitter ID="outersplitter" ClientSideOnCreate="oncreate" ClientSideOnExpandCollapse="oncollapse" ClientSideOnResize="onresize" Height="250" Width="401" Orientation="Vertical" EnableAutoResize="true" runat="server">
        <ej:SplitPane>
            <ej:Splitter ID="innersplitter" ClientSideOnCreate="oncreate" ClientSideOnExpandCollapse="oncollapse" ClientSideOnResize="onresize" EnableAutoResize="true" Height="250" Width="401" runat="server">
                <ej:SplitPane>
                    <div id="Pane1">
                        <div class="cont">Pane 1</div>
                    </div>
                </ej:SplitPane>
                <ej:SplitPane>
                    <div id="Pane2">
                        <div class="cont">Pane 2</div>
                    </div>
                </ej:SplitPane>
            </ej:Splitter>
        </ej:SplitPane>
        <ej:SplitPane PaneSize="80">
            <div id="Pane3">
                <div class="cont">Pane 3 </div>
            </div>
        </ej:SplitPane>
    </ej:Splitter>

</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="EventSection" runat="server">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="expandCollapse" Text="expandCollapse"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="resize" Text="resize"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" Type="Button" ClientSideOnClick="onClear" Text="Clear" CssClass="eventclear e-btn" runat="server"></ej:Button>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Splitter/Events.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .cont {
            padding: 10px 0 0 10px;
        }
    </style>
</asp:Content>

