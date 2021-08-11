<%@ Page Title="TreeView-Context Menu-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="Contextmenu.aspx.cs" MetaDescription="This sample demonstrates enable/disable nodes by integerating menu with ASP.NET Web Forms TreeView." Inherits="WebSampleBrowser.TreeView.Contextmenu" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width: 250px">
        <ej:TreeView ID="treeView" runat="server" Height="100%" >
            <Nodes>
                <ej:TreeViewNode Expanded="True" Text="ASP.NET MVC Team">
                    <Nodes>
                        <ej:TreeViewNode Text="Smith"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Johnson"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Anderson"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
                <ej:TreeViewNode Text="Windows Team">
                    <Nodes>
                        <ej:TreeViewNode Text="Clark"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Wright"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Lopez"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
                <ej:TreeViewNode Text="Web Team">
                    <Nodes>
                        <ej:TreeViewNode Text="Joshua"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Matthew"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="David"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
                <ej:TreeViewNode Text="Build Team">
                    <Nodes>
                        <ej:TreeViewNode Text="Ryan"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Justin"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Robert"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
                <ej:TreeViewNode Text="WPF Team">
                    <Nodes>
                        <ej:TreeViewNode Text="Brown"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Johnson"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Miller"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
            </Nodes>
        </ej:TreeView>
    </div>
    <div>
        <ej:Menu ID="treeviewMenu" MenuType="ContextMenu" ClientSideOnClick="menuclick" ClientSideOnBeforeContextOpen="beforeOpen" 
                 OpenOnClick="false" runat="server" ContextMenuTarget="#LayoutSection_ControlsSection_treeView">
            <Items>
                <ej:MenuItem Text="Add New Item"></ej:MenuItem>
            </Items>
            <Items>
                <ej:MenuItem Text="Remove Item"></ej:MenuItem>
            </Items>
            <Items>
                <ej:MenuItem Text="Disable Item"></ej:MenuItem>
            </Items>
            <Items>
                <ej:MenuItem Text="Enable Item"></ej:MenuItem>
            </Items>
        </ej:Menu>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        var tabIndex = 1, treeviewObj, contextMenuObj, childMenu, selectedNode;
        $(function () {
            treeviewObj = $("#<%=treeView.ClientID%>").data("ejTreeView");
            contextMenuObj = $("#<%=treeviewMenu.ClientID%>").data("ejMenu");
        });
        function beforeOpen(args) {
            childMenu = contextMenuObj.element.children();
            if ($(args.target).hasClass('e-node-hover')) {
                $(childMenu).removeClass('e-disable-item');
                $(childMenu[3]).addClass('e-disable-item');
            }
            else if ($(args.target).hasClass('e-node-disable')) {
                $(childMenu).addClass('e-disable-item');
                $(childMenu[3]).removeClass('e-disable-item');
            }
            if (!$(args.target).hasClass("e-text"))
                args.cancel = true;
            else {
                selectedNode = $(args.target).closest('.e-item');
                if (!$(args.target).hasClass('e-node-disable'))
                    treeviewObj.selectNode(selectedNode);
            }
        }
        function menuclick(args) {
            if (args.events.text == "Add New Item") {
                treeviewObj.addNode("Item" + tabIndex, selectedNode);
                tabIndex++;
            }
            else if (args.events.text == "Remove Item") {
                treeviewObj.removeNode(selectedNode);
            }
            else if (args.events.text == "Disable Item") {
                treeviewObj.disableNode(selectedNode);
            }
            else if (args.events.text == "Enable Item") {
                treeviewObj.enableNode(selectedNode);
            }
        }
    </script>
</asp:Content>

