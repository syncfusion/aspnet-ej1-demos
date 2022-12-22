<%@ Page Title="Splitter-Integration-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates the integration of other Syncfusion ASP.NET Web Forms components with the Syncfusion ASP.NET Web Forms Splitter component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Integration.aspx.cs" Inherits="WebSampleBrowser.Splitter.Integration" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:Splitter Height="280" Width="501" ID="outersplitter" runat="server" EnableAutoResize="true">
        <ej:SplitPane>
            <div>
                <div class="cont">
                    <h3 class="h3">FRENCH CITIES</h3>
                    <ej:TreeView ID="treeView" runat="server" ClientSideOnNodeSelected="treeClicked">
                        <Nodes>
                            <ej:TreeViewNode Text="PARIS">
                                <Nodes>
                                    <ej:TreeViewNode Id="tools" Text="Speciality"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                            <ej:TreeViewNode Text="CAMEMBERT">
                                <Nodes>
                                    <ej:TreeViewNode Id="chart" Text="Speciality"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                            <ej:TreeViewNode Text="GRENOBLE">
                                <Nodes>
                                    <ej:TreeViewNode Id="grid" Text="Speciality"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeView>
                </div>
            </div>
        </ej:SplitPane>

        <ej:SplitPane>
            <div>
                <div class="cont">
                    <div class="_content">
                        Select any city from the tree to show the description.
                    </div>
                    <div class="tools des">
                        <h3>PARIS</h3>
                       Paris, the city of lights and love - this short guide is full of ideas for how to make the most of the romanticism...
                    </div>
                    <div class="chart des">
                        <h3>CAMEMBERT</h3>
                       The village in the Orne département of Normandy where the famous French cheese is originated from.
                    </div>
                    <div class="grid des">
                        <h3>GRENOBLE</h3>
                        The capital city of the French Alps and a major scientific center surrounded by many ski resorts, host of the Winter Olympics in 1968. 
                    </div>
                </div>
            </div>
        </ej:SplitPane>

    </ej:Splitter>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function treeClicked(sender, args) {
            if (sender.value == "Speciality") {
                var content = $('.' + sender.currentElement[0].id).html();
                $('._content').html(content);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .cont {
            padding: 20px;
            min-width: 50px;
        }

            .cont #<%=treeView.ClientID%>_Container {
                margin-bottom: 0;
                border: none;
            }

        .h3 {
            font-size: 14px;
            margin: 0;
        }

        .des {
            display: none;
        }
    </style>
</asp:Content>

