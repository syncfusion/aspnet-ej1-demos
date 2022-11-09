<%@ Page Title="Splitter-API's-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to dynamically customize the Syncfusion ASP.NET Web Forms Essential JS 1 Splitter component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="APIs.aspx.cs" Inherits="WebSampleBrowser.Splitter.APIs" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">

    <ej:Splitter ID="outterSplitter" Height="280" Width="602" runat="server" EnableAutoResize="true">
        <ej:SplitPane PaneSize="40%" MinSize="30">        
                <div>
                <div class="content">
                    <h3 class="h3">Pane 1 </h3>
                    
                </div>
            </div>
        </ej:SplitPane>
        <ej:SplitPane PaneSize="35%" MinSize="30">
           <div>
                <div class="content">
                    <h3 class="h3">Pane 2 </h3>
                    
                </div>
            </div>
        </ej:SplitPane>
        <ej:SplitPane MinSize="30">
           <div>
                <div class="content">
                    <h3 class="h3">Pane 3 </h3>
                    
                </div>
            </div>
        </ej:SplitPane>
    </ej:Splitter>

  
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Pane Index
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="paneindex" runat="server" Value="0" ShowSpinButton="false" Width="100px" MinValue="0" MaxValue="2">
                    </ej:NumericTextBox>
                </div>

            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="Button2" Type="Button" ClientSideOnClick="expandpane" Text="Expand" CssClass="e-btn" runat="server"></ej:Button>
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="Button1" Type="Button" ClientSideOnClick="collapsepane" Text="Collapse" CssClass="e-btn" runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <b>Add New Pane </b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <span>Pane Index</span>
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="index" runat="server" Value="0" ShowSpinButton="false" Width="100px" MinValue="0" MaxValue="2">
                    </ej:NumericTextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <span>Pane Size</span>
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="size" runat="server" Value="20" ClientSideOnChange="validate" ShowSpinButton="false" Width="100px">
                    </ej:NumericTextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <span>Min Size</span>
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="min" runat="server" Value="20" ClientSideOnFocusOut="validate" ShowSpinButton="false" Width="100px">
                    </ej:NumericTextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <span>Max Size</span>
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="max" runat="server" Value="100" ClientSideOnFocusOut="validate" ShowSpinButton="false" Width="100px">
                    </ej:NumericTextBox>
                </div>
            </div>
            <span id="error" style="color: red"></span>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="Button3" Type="Button" ClientSideOnClick="add" Text="Add pane" CssClass="e-btn" runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <b>Remove Pane </b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Remove Pane Index
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="removepaneidx" runat="server" Value="0" ShowSpinButton="false" Width="100px" MinValue="0" MaxValue="2">
                    </ej:NumericTextBox>
                </div>

            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="Button4" Type="Button" ClientSideOnClick="removepane" Text="Remove pane" CssClass="e-btn" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../Scripts/Splitter/API.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        input.e-btn {
            width: 78px;
        }

        .h3 {
            font-size: 17px;
            margin: 0;
        }

        .content {
            padding: 15px;
        }
    </style>
</asp:Content>

