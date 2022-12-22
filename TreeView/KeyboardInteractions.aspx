<%@ Page Title="TreeView-Keyboard Interactions-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="KeyboardInteractions.aspx.cs" MetaDescription="This example demonstrates how the treeview supports the keyboard navigation(keyboard shortcuts) in a ASP.NET Web Forms." Inherits="WebSampleBrowser.TreeView.keyboardinteract" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width:250px">
        <ej:TreeView ID="treeview" runat="server" Height="100%" AllowKeyboardNavigation="true" ShowCheckbox="true" 
                     AllowEditing="true">
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
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid keyboard">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + j
                </div>
                <div class="col-md-3 col-xs-4">
                    Focus the control
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    F2
                </div>
                <div class="col-md-3 col-xs-4">
                    Edit the node
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Delete
                </div>
                <div class="col-md-3 col-xs-4">
                    Delete the node
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Traverse next node
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Traverse previous node
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Expand node / Traverse first child
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Collapse node
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enter
                </div>
                <div class="col-md-3 col-xs-4">
                    Select node
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Space
                </div>
                <div class="col-md-3 col-xs-4">
                    Check / Uncheck node
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Home
                </div>
                <div class="col-md-3 col-xs-4">
                    Traverse the first node in Tree
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    End
                </div>
                <div class="col-md-3 col-xs-4">
                    Traverse the last node in tree
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        $(function () {
            //Control focus key
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) {
                    // j- key code.
                    $(".e-treeview.e-js").focus();
                }
            });
            $("#sampleProperties").ejPropertiesPanel();
        });

    </script>
</asp:Content>

