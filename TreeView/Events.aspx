<%@ Page Title="TreeView-Server-Side Events-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="Events.aspx.cs" MetaDescription="This example demonstrates the server side events OnNodeChecked and OnNodeSelected in a ASP.NET Web Forms TreeView" Inherits="WebSampleBrowser.TreeView.clientevents" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 250px">
        <ej:TreeView ID="treeView" runat="server" Height="100%" ShowCheckbox="true" OnNodeSelected="treeView_NodeSelected" 
                     OnNodeChecked="treeView_NodeChecked" AllowDragAndDrop="true" AllowDropChild="true" AllowDropSibling="true" 
                     AllowEditing="true">
             <Nodes>
                <ej:TreeViewNode Text="Cricket" Expanded="true">
                    <Nodes>
                        <ej:TreeViewNode Text="Princeton Club"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Harverd Club"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="st.Columbia Club"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Dartmouth Club"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Middlebury Club"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
                <ej:TreeViewNode Text="Football">
                    <Nodes>
                        <ej:TreeViewNode Text="A.F.C Blackpool"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="A.F.C Emley"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Bedford"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Farsley"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
                <ej:TreeViewNode Text="Basketball">
                    <Nodes>
                        <ej:TreeViewNode Text="AGE Halkida"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Iraklio"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Sporting Athens"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Pagrati Athens"></ej:TreeViewNode>
                        <ej:TreeViewNode Text="Lodon colney"></ej:TreeViewNode>
                    </Nodes>
                </ej:TreeViewNode>
            </Nodes>               
        </ej:TreeView>
    </div>
</asp:Content>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="EventSection">
    <asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Clear" EventName="click" />
        </Triggers>
        <ContentTemplate>
            <div class="cols-prop-area event-tracer">
                <div>
                    <div class="heading">
                        <span>Event Trace</span>
                    </div>
                    <div class="prop-grid content">
                        <div class="eventarea">
                            <div class="EventLog" id="EventLog" runat="server">
                            </div>
                        </div>
                        <div class="evtbtn">
                            <ej:Button ID="Clear" Type="Button" Text="Clear" OnClick="Clear_Click" CssClass="eventclear e-btn" 
                                       runat="server"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>



<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/TreeView/Events.js")%>' type="text/javascript"></script>
</asp:Content>



