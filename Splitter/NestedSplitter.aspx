<%@ Page Title="Splitter-Nested Splitter-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates nested pane support for the Syncfusion ASP.NET Web Forms Splitter component, which allows adding a pane between two pane elements." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="NestedSplitter.aspx.cs" Inherits="WebSampleBrowser.Splitter.NestedSplitter" %>


<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">

    <ej:Splitter ID="outersplitter" Height="320" Width="602" Orientation="Vertical" runat="server" EnableAutoResize="true">
        <ej:SplitPane PaneSize="60" MinSize="30">
            <div class="content" style="padding: 0px 15px;">
                <h3>FRENCH CITIES</h3>
            </div>
        </ej:SplitPane>
        <ej:SplitPane MinSize="30">

            <ej:Splitter ID="innersplitter" Height="280" Width="602" runat="server" EnableAutoResize="true">
                <ej:SplitPane PaneSize="40%" MinSize="30">
                    <div>
                        <div class="content">
                            <h3>PARIS</h3>
                           Paris, the city of lights and love - this short guide is full of ideas for how to make the most of the romanticism...
                        </div>
                    </div>
                </ej:SplitPane>
                <ej:SplitPane PaneSize="35%" MinSize="30">
                    <div>
                        <div class="content">
                            <h3>CAMEMBERT</h3>
                           The village in the Orne département of Normandy where the famous French cheese is originated from.
                        </div>
                    </div>
                </ej:SplitPane>
                <ej:SplitPane MinSize="30">
                    <div>
                        <div class="content">
                            <h3>GRENOBLE</h3>
                          The capital city of the French Alps and a major scientific center surrounded by many ski resorts, host of the Winter Olympics in 1968. 
                        </div>
                    </div>
                </ej:SplitPane>
            </ej:Splitter>
        </ej:SplitPane>
    </ej:Splitter>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .h3 {
            font-size: 14px;
        }

        .content {
            padding: 7px;
        }
    </style>
</asp:Content>

