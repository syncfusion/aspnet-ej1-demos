<%@ Page Title="TreeView-Drag and Drop-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="DragandDrop.aspx.cs" MetaDescription="This sample demonstrated the drag and drop functionality of the nodes in Syncfusion ASP.NET Web Forms TreeView control." Inherits="WebSampleBrowser.TreeView.DragandDrop" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="display: table">
        <div style="float: left">
            <span class="treeCaption">TREEVIEW - 1</span>
            <ej:TreeView ID="treeview" runat="server" Height="100%" Width="250px" AllowDragAndDrop="true" 
                         AllowDropChild="true" AllowDropSibling="true" AllowDragAndDropAcrossControl="true">
                <Nodes>
                    <ej:TreeViewNode Expanded="True" Text="Artwork">
                        <Nodes>
                            <ej:TreeViewNode Text="Abstract">
                                <Nodes>
                                    <ej:TreeViewNode Text="2 Acrylic Mediums"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Creative Acrylic"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Modern Painting"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Canvas Art"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Black white"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                            <ej:TreeViewNode Text="Children">
                                <Nodes>
                                    <ej:TreeViewNode Text="Preschool Crafts"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="School-age Crafts"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Fabulous Toddler"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                            <ej:TreeViewNode Text="Comic / Cartoon">
                                <Nodes>
                                    <ej:TreeViewNode Text="Batman"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Adventures of Superman"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Super boy"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeViewNode>
                    <ej:TreeViewNode Expanded="True" Text="Books">
                        <Nodes>
                            <ej:TreeViewNode Text="Comics">
                                <Nodes>
                                    <ej:TreeViewNode Text="The Flash"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Human Target"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Birds of Prey"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Canvas Art"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Black white"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                            <ej:TreeViewNode Text="Entertaining"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Design"></ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeViewNode>
                    <ej:TreeViewNode Text="Music">
                        <Nodes>
                            <ej:TreeViewNode Text="Classical">
                                <Nodes>
                                    <ej:TreeViewNode Text="Avant-Garde"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Medieval"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Orchestral"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                            <ej:TreeViewNode Text="Mass"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Folk"></ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeViewNode>
                </Nodes>
            </ej:TreeView>
        </div>
        <div style="float: left">
            <span class="treeCaption">TREEVIEW - 2</span>
            <ej:TreeView ID="treeview2" runat="server" Height="100%" Width="250px" AllowDragAndDrop="true" AllowDropChild="true" 
                         AllowDropSibling="true" AllowDragAndDropAcrossControl="true">
                <Nodes>
                    <ej:TreeViewNode Expanded="True" Text="Artwork">
                        <Nodes>
                            <ej:TreeViewNode Text="Abstract">
                                <Nodes>
                                    <ej:TreeViewNode Text="2 Acrylic Mediums"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Creative Acrylic"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Modern Painting"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Canvas Art"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Black white"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                            <ej:TreeViewNode Text="Children">
                                <Nodes>
                                    <ej:TreeViewNode Text="Preschool Crafts"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="School-age Crafts"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Fabulous Toddler"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                            <ej:TreeViewNode Text="Comic / Cartoon">
                                <Nodes>
                                    <ej:TreeViewNode Text="Batman"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Adventures of Superman"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Super boy"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeViewNode>
                    <ej:TreeViewNode Expanded="True" Text="Books">
                        <Nodes>
                            <ej:TreeViewNode Text="Comics">
                                <Nodes>
                                    <ej:TreeViewNode Text="The Flash"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Human Target"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Birds of Prey"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Canvas Art"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Black white"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                            <ej:TreeViewNode Text="Entertaining"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Design"></ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeViewNode>
                    <ej:TreeViewNode Text="Music">
                        <Nodes>
                            <ej:TreeViewNode Text="Classical">
                                <Nodes>
                                    <ej:TreeViewNode Text="Avant-Garde"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Medieval"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Orchestral"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                            <ej:TreeViewNode Text="Mass"></ej:TreeViewNode>
                            <ej:TreeViewNode Text="Folk"></ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeViewNode>
                </Nodes>
            </ej:TreeView>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style>
        .treeCaption {
            padding: 5px;
            text-align: center;
            font-size: 12px;
            font-weight: bold;
        }
        .e-treeview-wrap {
            margin-top: 10px;
            margin-bottom: 10px;
        }
    </style>
</asp:Content>

