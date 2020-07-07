<%@ Page Title="TreeView-Node Editing-Cut-Paste-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="NodeEditing-Copy-Paste.aspx.cs" MetaDescription="This sample demonstrates inline node editing in ASP.NET Web Forms TreeView." Inherits="WebSampleBrowser.TreeView.NodeEditing_Copy_Paste" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width:250px">
        <ej:TreeView ID="treeview" runat="server" Height="100%" AllowEditing="true" AllowDragAndDrop="true" 
                     AllowDropChild="true" AllowDropSibling="true">
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
</asp:Content>


