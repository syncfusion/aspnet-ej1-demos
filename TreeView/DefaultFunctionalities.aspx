<%@ Page Title="TreeView-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This demo explains how to render the Syncfusion ASP.NET Web Forms TreeView control with a local data." Inherits="WebSampleBrowser.TreeView.DefaultFunctionalities" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
<div style="width:250px">
    <ej:TreeView ID="treeview" runat="server" >
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

