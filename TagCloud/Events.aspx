<%@ Page Language="C#" Title="TagCloud-Server-Side Events-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.TagCloud.Events" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="controlframe" style="width: 350px;">
    <ej:TagCloud ID="tagEvents" Title="Car Models"
        DataSourceID="ObjectDataSource1" DataTextField="text" DataUrlField="url" DataFrequencyField="frequency"
        OnClick="tagEvents_Click" runat="server"></ej:TagCloud>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TagCloudData"
        SelectMethod="GetTagCloudItems"></asp:ObjectDataSource>
        </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="EventSection" runat="server">
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
                            <ej:Button ID="Clear" Text="Clear" Type="Button" OnClick="Clear_Click" CssClass="eventclear e-btn" runat="server"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <%-- <script src='<%= Page.ResolveClientUrl("~/Scripts/TagCloud/Events.js")%>' type="text/javascript"></script>--%>
</asp:Content>


