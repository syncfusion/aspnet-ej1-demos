<%@ Page Title="Splitter-Keyboard Interaction-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to access the Syncfusion ASP.NET Web Forms Splitter component functionalities using keyboard interactions." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Keyboard-Interaction.aspx.cs" Inherits="WebSampleBrowser.Splitter.Keyboard_Interaction" %>


<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:Splitter Height="250" Width="402" ID="outersplitter" ClientSideOnCreate="oncreate" ClientSideOnExpandCollapse="oncollapse" EnableAutoResize="true" ClientSideOnResize="onresize" Orientation="Vertical" runat="server">
        <ej:SplitPane>
            <ej:Splitter ID="innerSplitter" runat="server" Width="402" Height="148" ClientSideOnCreate="oncreate" ClientSideOnExpandCollapse="oncollapse" ClientSideOnResize="onresize" EnableAutoResize="true">
                <ej:SplitPane>
                    <div>
                        <div class="cont">Pane 1</div>
                    </div>
                </ej:SplitPane>
                <ej:SplitPane>
                    <div>
                        <div class="cont">Pane 2</div>
                    </div>
                </ej:SplitPane>
            </ej:Splitter>
        </ej:SplitPane>

        <ej:SplitPane PaneSize="80">
            <div>
                <div class="cont">Pane 3 </div>
            </div>
        </ej:SplitPane>

    </ej:Splitter>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid keyboard">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + j
                </div>
                <div class="col-md-3 col-xs-4">
                    Focuses the first Splitbar
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Tab
                </div>
                <div class="col-md-3 col-xs-4">
                    Focuses the next Splitbar
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Shift + Tab
                </div>
                <div class="col-md-3 col-xs-4">
                    Focuses the previous Splitbar
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enter
                </div>
                <div class="col-md-3 col-xs-4">
                    Resize the Pane to the current Splitbar position.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">  
                    <br />                  
                    Esc
                </div>
                <div class="col-md-3 col-xs-4"> 
                    <br />                   
                    Focuses out from the Splitbar.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <br />
                    For Horizontal:
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves the Splitbar in Left
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves the Splitbar in Right
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Collapses the left Pane
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Collapses the right Pane
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    For Vertical:
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves the Splitbar in Bottom
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Moves the Splitbar in Right
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Collapses the top Pane
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Ctrl + Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Collapses the bottom Pane
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Splitter/Keyboardinteraction.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .cont {
            text-align: center;
            padding: 10px 0 0 10px;
        }
    </style>
</asp:Content>

