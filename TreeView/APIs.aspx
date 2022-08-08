<%@ Page Title="TreeView-API's-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="clientapi.aspx.cs" MetaDescription="This example demonstrates the various methods like collapseAll, expandAll, enable and disable in a ASP.NET Web Forms TreeView." Inherits="WebSampleBrowser.TreeView.clientapi" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="display:table">
        <ej:TreeView ID="treeview" runat="server" ShowCheckbox="true" AllowEditing="true">
            <Nodes>
                <ej:TreeViewNode Text="Cricket">
                    <Nodes>
                        <ej:TreeViewNode Text="Princeton Club"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Harvard Club"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="St.Columba's Club"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Dartmouth Club"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Middlebury Club"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
                <ej:TreeViewNode Text="Football">
                    <Nodes>
                        <ej:TreeViewNode Text="A.F.C. Blackpool"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="A.F.C. Emley"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Bedford"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Celtic Nation"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Farsley"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Gresley"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="London Colney"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
                <ej:TreeViewNode Text="Volleyball">
                    <Nodes>
                        <ej:TreeViewNode Text="AGE Halkida "></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Iraklio"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Sporting Athen"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Pagrati Athens"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
                <ej:TreeViewNode Text="Tennis">
                    <Nodes>
                        <ej:TreeViewNode Text="Ryoma Echizen"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Kaoru Kaidoh"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Rokkaku"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Yamabuki"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Higa"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
            </Nodes>
        </ej:TreeView>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Expand / Collapse All
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton Type="Button" Width="115px" ID="btnchkExpand" runat="server" ActiveText="Collapse All" 
                                     DefaultText="Expand All" ClientSideOnChange="onExpandAll"></ej:ToggleButton>
                </div>
                <div class="col-md-3 col-xs-4">
                    Check / Uncheck All
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton Type="Button" Width="115px" ID="btnchkCheckAll" runat="server" ActiveText="Uncheck All"
                                     DefaultText="Check All" ClientSideOnChange="onCheckAll"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Selected Node
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="btnExpand" Text="Expand" Type="Button" ClientSideOnClick="onExpand" CssClass="e-btn inputbtn" 
                               runat="server"></ej:Button>
                </div>
                <div class="col-md-3 col-xs-4">
                    Selected Node
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="btnCollapse" Text="Collapse" Type="Button" ClientSideOnClick="onCollapse" 
                               CssClass="e-btn inputbtn" runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Selected Node
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="btnCheck" Text="Check" Type="Button" ClientSideOnClick="onCheck" 
                               CssClass="e-btn inputbtn" runat="server"></ej:Button>
                </div>
                <div class="col-md-3 col-xs-4">
                    Selected Node
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="btnUncheck" Text="Uncheck" Type="Button" ClientSideOnClick="onUncheck"  
                               CssClass="e-btn inputbtn" runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Selected Node
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="btnDisable" Text="Disable" Type="Button" ClientSideOnClick="onDisable" 
                               CssClass="e-btn inputbtn" runat="server"></ej:Button>
                </div>
                <div class="col-md-3 col-xs-4">
                    Disable Nodes 
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="btnEnable" Text="Enable" Type="Button" ClientSideOnClick="onEnable" 
                               CssClass="e-btn inputbtn" runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Add New Node
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="btnAdd" Text="Add" Type="Button" ClientSideOnClick="onAddNew" CssClass="e-btn inputbtn" 
                               runat="server"></ej:Button>
                </div>
                <div class="col-md-3 col-xs-4">
                    Remove Node
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button ID="btnRemove" Text="Remove" Type="Button" ClientSideOnClick="onRemoveNode" CssClass="e-btn inputbtn" 
                               runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Destory
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton Type="Button" Width="115px" ID="chkDestroy" runat="server" ActiveText="Restore" 
                                     DefaultText="Destory" ClientSideOnChange="onDestoryRestore"></ej:ToggleButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/TreeView/APIs.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style>
        .e-btn.inputbtn, .e-togglebutton {
            width: 115px;
        }
    </style>
</asp:Content>

